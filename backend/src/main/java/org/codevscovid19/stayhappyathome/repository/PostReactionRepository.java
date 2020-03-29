package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.PostReaction;
import org.codevscovid19.stayhappyathome.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostReactionRepository extends CrudRepository<PostReaction, Long> {
  List<PostReaction> findAllByUserEquals(User user);
}
