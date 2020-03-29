package org.codevscovid19.stayhappyathome.service;

import org.codevscovid19.stayhappyathome.entity.*;
import org.codevscovid19.stayhappyathome.repository.TargetFeelingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

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
    for (Emotion emotion : emotions) {
      postsForFeeling.addAll(getPostsForEmotion(emotion));
    }
    return postsForFeeling;
  }

  private Collection<Post> getPostsForEmotion(Emotion emotion) {
    Collection<Post> postsForEmotion = new ArrayList<>();
    Optional<List<TargetFeeling>> targetFeelings = targetFeelingRepository.findAllByEmotion(emotion);
    if (targetFeelings.isEmpty()) {
      return postsForEmotion;
    }
    for (TargetFeeling targetFeeling : targetFeelings.get()) {
      postsForEmotion.add(targetFeeling.getPost());
    }
    return postsForEmotion;
  }
}
