package org.codevscovid19.stayhappyathome.service;

import org.codevscovid19.stayhappyathome.entity.*;
import org.codevscovid19.stayhappyathome.repository.TargetFeelingRepository;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.util.Assert;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import static org.mockito.Mockito.when;

class PostServiceTest {

  @Test
  void getPostsForUser() {
    TargetFeelingRepository targetFeelingRepository = Mockito.mock(TargetFeelingRepository.class);
    PostService postService = new PostService(targetFeelingRepository);

    String userId = "18a5f592-0307-446a-8825-3a0f853b195e";
    User user = new User(userId, "hans12", null, "");
    List<Feeling> feelings = Arrays.asList(new Feeling(Emoji.THINKING_FACE), new Feeling(Emoji.NERD_FACE));
    FeelingRecord feelingRecord = new FeelingRecord(feelings);
    user.addFeelings(feelingRecord);

    Post visiblePost = new Post("Informative post", "", null, user, null);
    TargetFeeling applicableTargetFeeling = new TargetFeeling(visiblePost, Emotion.INFORMED);

    Post anotherVisiblePost = new Post("I should show up + INFORMED", "", null, user, null);
    TargetFeeling anotherApplicableTargetFeeling = new TargetFeeling(anotherVisiblePost, Emotion.INFORMED);
    TargetFeeling nonApplicableTargetFeeling = new TargetFeeling(anotherVisiblePost, Emotion.AWWW);

    Post invisiblePost = new Post("I should show up + INFORMED", "", null, user, null);
    TargetFeeling anotherNonApplicableTargetFeeling = new TargetFeeling(invisiblePost, Emotion.AWWW);

    Optional<List<TargetFeeling>> informativeTargetFeelings = Optional.of(Arrays.asList(applicableTargetFeeling, anotherApplicableTargetFeeling));
    Optional<List<TargetFeeling>> awwwTargetFeelings = Optional.of(Arrays.asList(nonApplicableTargetFeeling, anotherNonApplicableTargetFeeling));

    when(targetFeelingRepository.findAllByEmotion(Emotion.INFORMED)).thenReturn(informativeTargetFeelings);
    when(targetFeelingRepository.findAllByEmotion(Emotion.AWWW)).thenReturn(awwwTargetFeelings);

    Set<Post> postsForUser = postService.getPostsForUser(user);

    Assert.isTrue(postsForUser.contains(visiblePost));
    Assert.isTrue(postsForUser.contains(anotherVisiblePost));
  }
}
