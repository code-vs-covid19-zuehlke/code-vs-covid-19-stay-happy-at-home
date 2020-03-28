package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/user")
public class UserResource {

    @Autowired
    public UserResource() {
    }

    @GetMapping(produces = "application/json")
    public ResponseEntity<User> getUsers() {
        return ResponseEntity.ok(new User("Hans12"));
    }

    @GetMapping(path = "/{name}", produces = "application/json")
    public ResponseEntity<User> getPost(@PathVariable("name") String name) {
        return ResponseEntity.ok(new User(name));
    }

    @PostMapping(produces = "application/json")
    public ResponseEntity<User> createUser(@RequestBody User user) {
        return ResponseEntity.ok(user);
    }

    @PostMapping(path = "/{name}/feeling", produces = "application/json")
    public ResponseEntity<Feeling> createReaction(@RequestBody Feeling feeling) {
        return ResponseEntity.ok(feeling);
    }
}
