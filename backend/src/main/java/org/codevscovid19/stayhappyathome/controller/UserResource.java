package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.entity.Feeling;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.repository.FeelingRepository;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping(path = "/{name}", produces = "application/json")
    public ResponseEntity<User> getUser(@PathVariable("name") String name) {
        Optional<User> user = userRepository.findById(name);
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

    @PostMapping(path = "/{name}/feeling", consumes = "application/json", produces = "application/json")
    public ResponseEntity<Feeling> createFeeling(@PathVariable String name, @RequestBody Feeling feeling) {
        Optional<User> userEntity = userRepository.findByName(name);
        userEntity.ifPresent(user -> user.addFeeling(feeling));
        return ResponseEntity.ok(feelingRepository.save(feeling));
    }

    @GetMapping(path = "/{name}/feeling", produces = "application/json")
    public ResponseEntity<Set<Feeling>> getFeeling(@PathVariable String name) {
        Optional<User> userEntity = userRepository.findByName(name);
        return ResponseEntity.ok(userEntity.get().getFeelings());
    }
}
