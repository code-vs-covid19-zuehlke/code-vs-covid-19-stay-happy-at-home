package org.codevscovid19.stayhappyathome;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/v1/user")
public class UserResource {

  @GetMapping
  public ResponseEntity<List<String>> getAllUsers() {
    return ResponseEntity.ok(new ArrayList<>());
  }
}
