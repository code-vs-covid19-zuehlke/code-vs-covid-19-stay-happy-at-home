package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.dto.FeelingDto;
import org.codevscovid19.stayhappyathome.dto.UserDto;
import org.codevscovid19.stayhappyathome.entity.Feeling;
import org.codevscovid19.stayhappyathome.entity.FeelingRecord;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.repository.FeelingRepository;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/user")
public class UserResource {

  private final UserRepository userRepository;
  private final FeelingRepository feelingRepository;

  @Autowired
  public UserResource(UserRepository userRepository, FeelingRepository feelingRepository) {
    this.userRepository = userRepository;
    this.feelingRepository = feelingRepository;
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
  public ResponseEntity<User> createUser(@RequestBody UserDto userDto) {
    User user = new User(userDto.getId(), userDto.getName(), userDto.getPhoto());
    return ResponseEntity.ok(userRepository.save(user));
  }

  @PutMapping(path = "/{id}/feeling", consumes = "application/json", produces = "application/json")
  public ResponseEntity<Void> addFeelings(@PathVariable String id, @RequestBody List<FeelingDto> feelingDtos) {
    Optional<User> userEntity = userRepository.findById(id);
    if (userEntity.isPresent()) {
      User user = userEntity.get();
      user.addFeelings(new FeelingRecord(
          feelingDtos.stream().map(feelingDto -> new Feeling(feelingDto.getEmoji()))
              .collect(Collectors.toList())));
      userRepository.save(user);
      return ResponseEntity.ok().build();
    }
    return ResponseEntity.notFound().build();
  }

  @GetMapping(path = "/{id}/feeling", produces = "application/json")
  public ResponseEntity<List<Feeling>> getFeelings(@PathVariable String id) {
    Optional<User> userEntity = userRepository.findById(id);
    List<FeelingRecord> feelingRecords = userEntity.get().getFeelingRecords();
    List<Feeling> latestFeelings = feelingRecords.stream()
        .max(Comparator.comparing(FeelingRecord::getTime))
        .map(FeelingRecord::getFeelings)
        .orElse(Collections.emptyList());
    return ResponseEntity.ok(latestFeelings);
  }
}
