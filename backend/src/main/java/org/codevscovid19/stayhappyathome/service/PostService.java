package org.codevscovid19.stayhappyathome.service;

import org.codevscovid19.stayhappyathome.entity.*;
import org.codevscovid19.stayhappyathome.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
public class PostService {
    private PostRepository postRepository;

    @Autowired
    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public Set<Post> getPostsForUser(User user) {
        Set<Post> posts = new HashSet<>();
        FeelingRecord latestFeelingRecord = new FeelingRecord();
        latestFeelingRecord.setTime(LocalDateTime.now());
        latestFeelingRecord.setFeelings(List.of(new Feeling(Emoji.DOWNCAST_FACE_WITH_SWEAT)));
        /*user.getFeelingRecords().stream()
                .max(Comparator.comparing(FeelingRecord::getTime))
                .orElseThrow(() -> new IllegalStateException(String.format("User %s has no feelings", user)));*/
        // latestFeelingRecord.getFeelings().forEach(feeling -> posts.addAll(postRepository.findByFeeling(feeling)));
        latestFeelingRecord.getFeelings().forEach(feeling -> posts.addAll(postRepository.findAll()));
        return posts;
    }
}
