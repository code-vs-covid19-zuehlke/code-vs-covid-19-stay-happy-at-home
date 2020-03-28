package org.codevscovid19.stayhappyathome.service;

import org.codevscovid19.stayhappyathome.entity.FeelingRecord;
import org.codevscovid19.stayhappyathome.entity.Post;
import org.codevscovid19.stayhappyathome.entity.User;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PostService {
  public ResponseEntity<List<Post>> getPostsForUser(User user) {
    List<FeelingRecord> feelingRecords = user.getFeelingRecords();
    feelingRecords.stream().max((o1, o2) -> o1.)
    return null;
  }
}
