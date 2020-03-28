package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.entity.Feeling;
import org.codevscovid19.stayhappyathome.entity.Post;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.repository.FeelingRepository;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

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

    @PostMapping(path = "/{name}/feeling", produces = "application/json")
    public ResponseEntity<Feeling> createReaction(@RequestBody Feeling feeling) {
        return ResponseEntity.ok(feelingRepository.save(feeling));
    }
}
