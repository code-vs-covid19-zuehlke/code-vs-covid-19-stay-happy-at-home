package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.Reply;
import org.codevscovid19.stayhappyathome.entity.ReplyReaction;
import org.codevscovid19.stayhappyathome.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyReactionRepository extends CrudRepository<ReplyReaction, Long> {
  List<ReplyReaction> findAllByUserEquals(User user);

  List<ReplyReaction> findAllByReplyEquals(Reply reply);
}
