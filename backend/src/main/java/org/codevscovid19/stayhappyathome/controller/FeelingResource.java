package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.dto.FeelingDto;
import org.codevscovid19.stayhappyathome.entity.Feeling;
import org.codevscovid19.stayhappyathome.entity.FeelingRecord;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.login.HansNotFoundException;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.codevscovid19.stayhappyathome.login.Contants.USER_ID_HEADER_NAME;

@RestController
@RequestMapping("/api/v1/feeling")
public class FeelingResource {

  private static final Logger logger = LoggerFactory.getLogger(FeelingResource.class);

  private final UserRepository userRepository;

  @Autowired
  public FeelingResource(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  @PutMapping(path = "", consumes = "application/json", produces = "application/json")
  public ResponseEntity<Void> addFeelings(@RequestHeader(name = USER_ID_HEADER_NAME) String userId, @RequestBody List<FeelingDto> feelingDtos) {
    User user = userRepository.findById(userId).orElseThrow(() -> new HansNotFoundException("User", userId));

    List<Feeling> feelings = feelingDtos.stream()
      .map(feelingDto -> new Feeling(feelingDto.getEmoji()))
      .collect(Collectors.toList());
    FeelingRecord feelingRecord = new FeelingRecord(feelings);
    user.addFeelings(feelingRecord);
    User saved = userRepository.save(user);
    logger.debug("user after save: " + saved);
    return ResponseEntity.ok().build();
  }

  @GetMapping(path = "", produces = "application/json")
  public ResponseEntity<List<Feeling>> getFeelings(@RequestHeader(name = USER_ID_HEADER_NAME) String userId) {
    Optional<User> userEntity = userRepository.findById(userId);
    List<Feeling> latestFeelings = userEntity.get().getFeelings();
    return ResponseEntity.ok(latestFeelings);
  }
}
