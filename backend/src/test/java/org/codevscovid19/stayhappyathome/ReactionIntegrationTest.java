package org.codevscovid19.stayhappyathome;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import io.restassured.http.ContentType;
import io.restassured.http.Header;
import io.restassured.http.Headers;
import org.codevscovid19.stayhappyathome.dto.PostDto;
import org.codevscovid19.stayhappyathome.dto.PostReactionDto;
import org.codevscovid19.stayhappyathome.dto.ReactionSummaryDto;
import org.codevscovid19.stayhappyathome.dto.TargetFeelingDto;
import org.codevscovid19.stayhappyathome.dto.UserDto;
import org.codevscovid19.stayhappyathome.entity.Emoji;
import org.codevscovid19.stayhappyathome.entity.Emotion;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;

import java.util.Set;

import static io.restassured.RestAssured.given;
import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.http.HttpStatus.OK;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class ReactionIntegrationTest {

  @LocalServerPort
  private int port;
  private String baseUri = "http://localhost";
  private String basePath = "/api/v1";
  private static final String USER_ID_MEISTER = "meister";
  private static final String USER_ID_KLEISTER = "kleister";
  private static final Headers HEADERS_MEISTER = new Headers(new Header("X-User-Id", USER_ID_MEISTER));
  private static final Headers HEADERS_KLEISTER = new Headers(new Header("X-User-Id", USER_ID_KLEISTER));

  @Test
  void testReactions() {
    createUser(USER_ID_MEISTER, "Hans12");
    createUser(USER_ID_KLEISTER, "Hans99");
    IdContainer post = createPost(HEADERS_MEISTER);
    reactToPost(post.getId(), HEADERS_KLEISTER);

    ReactionSummaryDto reactionReceivedMeister = getReactionsReceived(HEADERS_MEISTER);
    assertThat(reactionReceivedMeister.getReactions())
      .hasSize(1);
    ReactionSummaryDto reactionGivenMeister = getReactionsGiven(HEADERS_MEISTER);
    assertThat(reactionGivenMeister.getReactions())
      .hasSize(0);

    ReactionSummaryDto reactionReceivedKleister = getReactionsReceived(HEADERS_KLEISTER);
    assertThat(reactionReceivedKleister.getReactions())
      .hasSize(0);
    ReactionSummaryDto reactionGivenKleister = getReactionsGiven(HEADERS_KLEISTER);
    assertThat(reactionGivenKleister.getReactions())
      .hasSize(1);
  }

  private ReactionSummaryDto getReactionsReceived(Headers headersMeister) {
    return given()
      .baseUri(baseUri)
      .basePath(basePath)
      .port(port)
      .headers(headersMeister)
      .when()
      .get("/user/reactions/received")
      .then()
      .statusCode(OK.value())
      .extract()
      .body().as(ReactionSummaryDto.class);
  }

  private ReactionSummaryDto getReactionsGiven(Headers headersMeister) {
    return given()
      .baseUri(baseUri)
      .basePath(basePath)
      .port(port)
      .headers(headersMeister)
      .when()
      .get("/user/reactions/given")
      .then()
      .statusCode(OK.value())
      .extract()
      .body().as(ReactionSummaryDto.class);
  }

  private void reactToPost(Long postId, Headers headers) {
    given()
      .baseUri(baseUri)
      .basePath(basePath)
      .port(port)
      .headers(headers)
      .contentType(ContentType.JSON)
      .body(new PostReactionDto(Emoji.PANDA))
      .when()
      .post("/post/" + postId + "/reaction")
      .then()
      .statusCode(OK.value());
  }

  private IdContainer createPost(Headers headers) {
    return given()
      .baseUri(baseUri)
      .basePath(basePath)
      .port(port)
      .headers(headers)
      .contentType(ContentType.JSON)
      .body(new PostDto("Title", "Description", null, new byte[]{}, Set.of(new TargetFeelingDto(Emotion.AWWW)), "image/png", 10))
      .when()
      .post("/post")
      .then()
      .statusCode(OK.value())
      .extract()
      .body().as(IdContainer.class);
  }

  private void createUser(String userId, String userName) {
    given()
      .baseUri(baseUri)
      .basePath(basePath)
      .port(port)
      .headers(new Headers(new Header("X-User-Id", userId)))
      .contentType(ContentType.JSON)
      .body(new UserDto(userId, userName, new byte[]{}, "image/png"))
      .when()
      .post("/user")
      .then()
      .statusCode(OK.value());
  }

  @JsonIgnoreProperties(ignoreUnknown = true)
  private static class IdContainer {
    private Long id;

    public IdContainer() {
      // for Jackson
    }

    public Long getId() {
      return id;
    }

    public void setId(Long id) {
      this.id = id;
    }
  }
}
