package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.Emotion;
import org.codevscovid19.stayhappyathome.entity.TargetFeeling;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TargetFeelingRepository extends CrudRepository<TargetFeeling, Long> {
  Optional<List<TargetFeeling>> findAllByEmotion(Emotion emotion);
}
