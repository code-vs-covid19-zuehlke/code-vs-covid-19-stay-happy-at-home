package org.codevscovid19.stayhappyathome.service;

import org.codevscovid19.stayhappyathome.entity.*;
import org.codevscovid19.stayhappyathome.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.*;

@Component
public class PostService {
  private PostRepository postRepository;
  private FeelingMatcherMap feelingMatcherMap;

  @Autowired

  public PostService(PostRepository postRepository) {
    this.postRepository = postRepository;
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
    Set<TargetFeeling> targetFeelings = feelingMatcherMap.getEmotionToEmotionMatrix().get(feeling);
    targetFeelings.forEach(targetFeeling -> postsForFeeling.addAll(postRepository.findByTargetFeeling(targetFeeling)));
    return postsForFeeling;
  }
}
