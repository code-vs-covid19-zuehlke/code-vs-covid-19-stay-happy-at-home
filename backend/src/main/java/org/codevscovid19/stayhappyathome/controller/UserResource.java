package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.dto.FeelingDto;
import org.codevscovid19.stayhappyathome.dto.UserDto;
import org.codevscovid19.stayhappyathome.entity.Feeling;
import org.codevscovid19.stayhappyathome.entity.FeelingRecord;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.repository.FeelingRepository;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.codevscovid19.stayhappyathome.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/user")
public class UserResource {

  private static final Logger logger = LoggerFactory.getLogger(UserResource.class);

  private final UserRepository userRepository;
  private final FeelingRepository feelingRepository;
  private final PhotoService photoService;

  @Autowired
  public UserResource(UserRepository userRepository, FeelingRepository feelingRepository, PhotoService photoService) {
    this.userRepository = userRepository;
    this.feelingRepository = feelingRepository;
    this.photoService = photoService;
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

  @PutMapping(path = "/{id}/feeling", consumes = "application/json", produces = "application/json")
  public ResponseEntity<Void> addFeelings(@PathVariable String id, @RequestBody List<FeelingDto> feelingDtos) {
    Optional<User> userEntity = userRepository.findById(id);
    if (userEntity.isPresent()) {
      User user = userEntity.get();
      List<Feeling> feelings = feelingDtos.stream()
        .map(feelingDto -> new Feeling(feelingDto.getEmoji()))
        .collect(Collectors.toList());
      FeelingRecord feelingRecord = new FeelingRecord(feelings);
      user.addFeelings(feelingRecord);
      User saved = userRepository.save(user);
      logger.debug("user after save: " + saved);
      return ResponseEntity.ok().build();
    }
    return ResponseEntity.notFound().build();
  }

  @GetMapping(path = "/{id}/feeling", produces = "application/json")
  public ResponseEntity<List<Feeling>> getFeelings(@PathVariable String id) {
    Optional<User> userEntity = userRepository.findById(id);
    List<Feeling> latestFeelings = userEntity.get().getFeelings();
    return ResponseEntity.ok(latestFeelings);
  }
}
