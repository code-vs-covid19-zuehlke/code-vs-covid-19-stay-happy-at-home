package org.codevscovid19.stayhappyathome.service;

import org.codevscovid19.stayhappyathome.entity.*;
import org.codevscovid19.stayhappyathome.repository.TargetFeelingRepository;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import javax.print.DocFlavor;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import static org.mockito.Mockito.when;

@SpringBootTest
class PostServiceTest {

  @MockBean
  private TargetFeelingRepository targetFeelingRepository;

  @Test
  void getPostsForUser() {
    User user = new User("18a5f592-0307-446a-8825-3a0f853b195e", "hans12", null, "");
    List<Feeling> feelings = Arrays.asList(new Feeling(Emoji.THINKING_FACE), new Feeling(Emoji.NERD_FACE));
    FeelingRecord feelingRecord = new FeelingRecord(feelings);
    user.addFeelings(feelingRecord);
    Post visiblePost = new Post("I should show up + INFORMED", "", null, user);
    Post anotherVisiblePost = new Post("I should show up + INFORMED", "", null, user);
    Post invisiblePost = new Post("I should show up + INFORMED", "", null, user);

    TargetFeeling visiblePostFeeling = new TargetFeeling(visiblePost, Emotion.INFORMED);

    TargetFeeling anotherVisiblePostFeeling = new TargetFeeling(anotherVisiblePost, Emotion.INFORMED);
    TargetFeeling anotherVisiblePostFeeling2 = new TargetFeeling(anotherVisiblePost, Emotion.AWWW);

    TargetFeeling invisblePostFeeling = new TargetFeeling(visiblePost, Emotion.AWWW);

    TargetFeeling applicableTargetFeeling = new TargetFeeling(visiblePost, Emotion.INFORMED);
    when(targetFeelingRepository.findAllByEmotion(Emotion.INFORMED)).thenReturn(Optional.of(Set.of(visiblePostFeeling,anotherVisiblePostFeeling)));

  }
}
