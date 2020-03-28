package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.PostReaction;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostReactionRepository extends CrudRepository<PostReaction, Long> {
}