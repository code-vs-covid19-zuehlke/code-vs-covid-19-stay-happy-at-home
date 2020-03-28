package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.dto.FeelingDto;
import org.codevscovid19.stayhappyathome.dto.UserDto;
import org.codevscovid19.stayhappyathome.entity.Feeling;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.repository.FeelingRepository;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
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

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

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
  public ResponseEntity<Feeling> addFeeling(@PathVariable String id, @RequestBody FeelingDto feelingDto) {
    Feeling feeling = new Feeling(feelingDto.getEmoji());

    Optional<User> userEntity = userRepository.findById(id);
    //userEntity.ifPresent(user -> user.addFeeling(feeling));
    return ResponseEntity.ok(feelingRepository.save(feeling));
  }

  @GetMapping(path = "/{id}/feeling", produces = "application/json")
  public ResponseEntity<Set<Feeling>> getFeeling(@PathVariable String id) {
    Optional<User> userEntity = userRepository.findById(id);
    //        userEntity.get().getFeelings()
    return ResponseEntity.ok(new HashSet<>());
  }
}
