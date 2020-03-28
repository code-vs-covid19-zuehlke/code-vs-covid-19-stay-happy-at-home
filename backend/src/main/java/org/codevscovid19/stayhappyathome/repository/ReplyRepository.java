package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.Reply;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReplyRepository extends CrudRepository<Reply, Long> {
}
