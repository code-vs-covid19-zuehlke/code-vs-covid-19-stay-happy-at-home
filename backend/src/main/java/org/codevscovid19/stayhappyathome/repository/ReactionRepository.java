package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.Reaction;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReactionRepository extends CrudRepository<Reaction, Long> {
}
