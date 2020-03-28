package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.Feeling;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FeelingRepository extends CrudRepository<Feeling, Long> {
}
