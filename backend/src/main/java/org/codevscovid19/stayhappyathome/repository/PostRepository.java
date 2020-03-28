package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.Post;
import org.codevscovid19.stayhappyathome.entity.TargetFeeling;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface PostRepository extends CrudRepository<Post, Long> {
  List<Post> findAll();

  Set<Post> findByTargetFeeling(TargetFeeling targetFeeling);
}
