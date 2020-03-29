package org.codevscovid19.stayhappyathome.service;

import org.codevscovid19.stayhappyathome.entity.*;
import org.codevscovid19.stayhappyathome.repository.TargetFeelingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;

@Component
public class PostService {
  private final TargetFeelingRepository targetFeelingRepository;

  @Autowired
  public PostService(TargetFeelingRepository targetFeelingRepository) {
    this.targetFeelingRepository = targetFeelingRepository;
  }

  public Set<Post> getPostsForUser(User user) {
    Set<Post> posts = new HashSet<>();
    FeelingRecord latestFeelingRecord = user.getFeelingRecords().stream()
      .max(Comparator.comparing(FeelingRecord::getTime))
      .orElseThrow(() -> new IllegalStateException(String.format("User %s has no feelings", user)));
    latestFeelingRecord.getFeelings().forEach(feeling -> posts.addAll(getPostsForFeeling(feeling)));
    return posts;
  }

  private Collection<Post> getPostsForFeeling(Feeling feeling) {
    Collection<Post> postsForFeeling = new HashSet<>();
    Set<Emotion> emotions = FeelingMatcherMap.getEmotionToEmotionMatrix().get(feeling.getEmoji());
    emotions.forEach(emotion -> {
      targetFeelingRepository.findByEmotion(emotion)
        .map(targetFeeling -> postsForFeeling.add(targetFeeling.getPost()));
    });
    return postsForFeeling;
  }
}
