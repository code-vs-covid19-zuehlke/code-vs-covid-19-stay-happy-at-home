package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.dto.Post;
import org.codevscovid19.stayhappyathome.dto.Reaction;
import org.codevscovid19.stayhappyathome.dto.Reply;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class PostResource {

	@GetMapping(path = "/post", produces = "application/json")
	public ResponseEntity<List<Post>> getPosts(){
		return ResponseEntity.ok(List.of(new Post(1)));
	}

	@PostMapping(path = "/post", produces = "application/json", consumes = "application/json")
	public ResponseEntity<Post> createPosts(@RequestBody Post post){
		return ResponseEntity.ok(post);
	}

	@GetMapping(path = "/post/{id}", produces = "application/json")
	public ResponseEntity<Post> getPost(@PathVariable("id") Integer id){
		return ResponseEntity.ok(new Post(id));
	}

	@PostMapping(path = "/post/{postId}/reply", produces = "application/json", consumes = "application/json")
	public ResponseEntity<Reply> createReply(@PathVariable("postId") Integer postId, @RequestBody Reply reply){
		return ResponseEntity.ok(reply);
	}

	@PostMapping(path = "/post/{postId}/reaction", produces = "application/json", consumes = "application/json")
	public ResponseEntity<Reaction> createPostReaction(@PathVariable("postId") Integer postId, @RequestBody Reaction reaction){
		return ResponseEntity.ok(reaction);
	}

	@PostMapping(path = "/post/{postId}/reply/{replyId}/reaction", produces = "application/json", consumes = "application/json")
	public ResponseEntity<Reaction> createReplyReaction(@PathVariable("postId") Integer postId, @PathVariable("replyId") Integer replyId, @RequestBody Reaction reaction){
		return ResponseEntity.ok(reaction);
	}
}
