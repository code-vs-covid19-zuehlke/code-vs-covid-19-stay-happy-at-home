package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class UserResource {

	@Autowired
	public UserResource() {
	}

	@GetMapping(path = "/user", produces = "application/json")
	public ResponseEntity<User> getUser() {
		return ResponseEntity.ok(new User("Hans12"));
	}
}
