package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.dto.FeelingDto;
import org.codevscovid19.stayhappyathome.dto.ReactionSummaryDto;
import org.codevscovid19.stayhappyathome.dto.TimeRecordDto;
import org.codevscovid19.stayhappyathome.dto.UserDto;
import org.codevscovid19.stayhappyathome.entity.Feeling;
import org.codevscovid19.stayhappyathome.entity.FeelingRecord;
import org.codevscovid19.stayhappyathome.entity.TimeRecord;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.login.HansNotFoundException;
import org.codevscovid19.stayhappyathome.repository.FeelingRepository;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
import org.codevscovid19.stayhappyathome.service.PhotoService;
import org.codevscovid19.stayhappyathome.service.ReactionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.codevscovid19.stayhappyathome.login.Contants.USER_ID_HEADER_NAME;

@RestController
@RequestMapping("/api/v1/user")
public class UserResource {

  private static final Logger logger = LoggerFactory.getLogger(UserResource.class);

  private final UserRepository userRepository;
  private final FeelingRepository feelingRepository;
  private final PhotoService photoService;
  private final ReactionService reactionService;

  @Autowired
  public UserResource(UserRepository userRepository, FeelingRepository feelingRepository, PhotoService photoService, ReactionService reactionService) {
    this.userRepository = userRepository;
    this.feelingRepository = feelingRepository;
    this.photoService = photoService;
    this.reactionService = reactionService;
  }

  @GetMapping(path = "/{id}", produces = "application/json")
  public ResponseEntity<User> getUser(@PathVariable("id") String id) {
    Optional<User> user = userRepository.findById(id);
    return user.map(ResponseEntity::ok)
      .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
  }

  @GetMapping(produces = "application/json")
  public ResponseEntity<List<User>> getUsers() {
    return ResponseEntity.ok(userRepository.findAll());
  }

  @PostMapping(consumes = "application/json", produces = "application/json")
  public ResponseEntity<User> createUser(@RequestBody UserDto userDto) throws IOException {
    URL photoUrl = photoService.writeBytesToStorage("user-" + userDto.getId(), userDto.getPhoto(), userDto.getPhotoContentType());

    User user = new User(userDto.getId(), userDto.getName(), photoUrl, userDto.getPhotoContentType());
    return ResponseEntity.ok(userRepository.save(user));
  }

  @PutMapping(path = "/{id}/time", consumes = "application/json", produces = "application/json")
  public ResponseEntity<Void> addAvailableTime(@PathVariable String id, @RequestBody TimeRecordDto timeRecordDto) {
    User user = userRepository.findById(id).orElseThrow(() -> new HansNotFoundException("User", id));
    TimeRecord timeRecord = new TimeRecord(timeRecordDto.getAvailableTime());
    user.addTimeRecord(timeRecord);
    userRepository.save(user);
    return ResponseEntity.ok().build();
  }

  @PutMapping(path = "/{id}/feeling", consumes = "application/json", produces = "application/json")
  public ResponseEntity<Void> addFeelings(@PathVariable String id, @RequestBody List<FeelingDto> feelingDtos) {
    User user = userRepository.findById(id).orElseThrow(() -> new HansNotFoundException("User", id));

    List<Feeling> feelings = feelingDtos.stream()
      .map(feelingDto -> new Feeling(feelingDto.getEmoji()))
      .collect(Collectors.toList());
    FeelingRecord feelingRecord = new FeelingRecord(feelings);
    user.addFeelings(feelingRecord);
    User saved = userRepository.save(user);
    logger.debug("user after save: " + saved);
    return ResponseEntity.ok().build();
  }

  @GetMapping(path = "/{id}/feeling", produces = "application/json")
  public ResponseEntity<List<Feeling>> getFeelings(@PathVariable String id) {
    Optional<User> userEntity = userRepository.findById(id);
    List<Feeling> latestFeelings = userEntity.get().getFeelings();
    return ResponseEntity.ok(latestFeelings);
  }

  @GetMapping(path = "/reactions/received")
  public ResponseEntity<ReactionSummaryDto> getReactionSummaryReceived(@RequestHeader(name = USER_ID_HEADER_NAME) String userId){
    ReactionSummaryDto reactionSummary = reactionService.getReactionSummaryReceived(userId);
    return ResponseEntity.ok(reactionSummary);
  }

  @GetMapping(path = "/reactions/given")
  public ResponseEntity<ReactionSummaryDto> getReactionSummaryGiven(@RequestHeader(name = USER_ID_HEADER_NAME) String userId){
    ReactionSummaryDto reactionSummary = reactionService.getReactionSummaryGiven(userId);
    return ResponseEntity.ok(reactionSummary);
  }
}
