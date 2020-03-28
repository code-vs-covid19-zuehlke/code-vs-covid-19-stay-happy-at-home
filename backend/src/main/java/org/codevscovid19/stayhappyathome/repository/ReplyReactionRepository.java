package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.ReplyReaction;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReplyReactionRepository extends CrudRepository<ReplyReaction, Long> {
}
