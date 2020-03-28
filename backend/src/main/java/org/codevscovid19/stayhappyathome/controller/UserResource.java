package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.entity.Feeling;
import org.codevscovid19.stayhappyathome.entity.FeelingRecord;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.repository.FeelingRepository;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.*;
import java.util.HashSet;
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

  @PostMapping(produces = "application/json")
  public ResponseEntity<User> createUser(@RequestBody User user) {
    return ResponseEntity.ok(userRepository.save(user));
  }

  @PostMapping(path = "/{id}/feeling", consumes = "application/json", produces = "application/json")
  public ResponseEntity<Void> addFeelings(@PathVariable String id, @RequestBody Set<Feeling> feelings) {
    Optional<User> userEntity = userRepository.findById(id);
    if (userEntity.isPresent()) {
      User user = userEntity.get();
      user.addFeelings(new FeelingRecord(feelings));
      userRepository.save(user);
      return ResponseEntity.ok().build();
    }
    return ResponseEntity.notFound().build();
  }

  @GetMapping(path = "/{id}/feeling", produces = "application/json")
  public ResponseEntity<Set<Feeling>> getFeelings(@PathVariable String id) {
    Optional<User> userEntity = userRepository.findById(id);
    List<FeelingRecord> feelingRecords = userEntity.get().getFeelingRecords();
    Set<Feeling> latestFeelings = feelingRecords.stream()
        .max(Comparator.comparing(FeelingRecord::getTime))
        .map(FeelingRecord::getFeelings)
        .orElse(new HashSet<>());
    return ResponseEntity.ok(latestFeelings);
  }
}
