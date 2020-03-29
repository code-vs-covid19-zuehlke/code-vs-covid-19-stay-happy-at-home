package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.dto.TimeRecordDto;
import org.codevscovid19.stayhappyathome.dto.UserDto;
import org.codevscovid19.stayhappyathome.entity.TimeRecord;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.login.HansNotFoundException;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
import org.codevscovid19.stayhappyathome.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/user")
public class UserResource {

  private final UserRepository userRepository;
  private final PhotoService photoService;

  @Autowired
  public UserResource(UserRepository userRepository, PhotoService photoService) {
    this.userRepository = userRepository;
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

  @PutMapping(path = "/{id}/time", consumes = "application/json", produces = "application/json")
  public ResponseEntity<Void> addAvailableTime(@PathVariable String id, @RequestBody TimeRecordDto timeRecordDto) {
    User user = userRepository.findById(id).orElseThrow(() -> new HansNotFoundException("User", id));
    TimeRecord timeRecord = new TimeRecord(timeRecordDto.getAvailableTime());
    user.addTimeRecord(timeRecord);
    userRepository.save(user);
    return ResponseEntity.ok().build();
  }

}
