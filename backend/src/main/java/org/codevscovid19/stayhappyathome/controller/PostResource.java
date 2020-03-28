package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.entity.Post;
import org.codevscovid19.stayhappyathome.entity.PostReaction;
import org.codevscovid19.stayhappyathome.entity.Reply;
import org.codevscovid19.stayhappyathome.entity.ReplyReaction;
import org.codevscovid19.stayhappyathome.repository.PostRepository;
import org.codevscovid19.stayhappyathome.repository.PostReactionRepository;
import org.codevscovid19.stayhappyathome.repository.ReplyReactionRepository;
import org.codevscovid19.stayhappyathome.repository.ReplyRepository;
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
@RequestMapping("/api/v1/post")
public class PostResource {

	private final PostRepository postRepository;
	private final ReplyRepository replyRepository;
	private final PostReactionRepository postReactionRepository;
	private final ReplyReactionRepository replyReactionRepository;

	@Autowired
	public PostResource(PostRepository postRepository, ReplyRepository replyRepository, PostReactionRepository postReactionRepository, ReplyReactionRepository replyReactionRepository) {
		this.postRepository = postRepository;
		this.replyRepository = replyRepository;
		this.postReactionRepository = postReactionRepository;
		this.replyReactionRepository = replyReactionRepository;
	}

	@GetMapping(path = "", produces = "application/json")
	public ResponseEntity<List<Post>> getPosts() {
		return ResponseEntity.ok(postRepository.findAll());
	}

	@PostMapping(path = "", produces = "application/json", consumes = "application/json")
	public ResponseEntity<Post> createPosts(@RequestBody Post post) {
		Post newPost = postRepository.save(post);
		return ResponseEntity.ok(newPost);
	}

	@GetMapping(path = "/{id}", produces = "application/json")
	public ResponseEntity<Post> getPost(@PathVariable("id") Long id) {
		Optional<Post> post = postRepository.findById(id);
		return post.map(ResponseEntity::ok)
				.orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
	}

	@PostMapping(path = "/{postId}/reply", produces = "application/json", consumes = "application/json")
	public ResponseEntity<Reply> createReply(@PathVariable("postId") Integer postId, @RequestBody Reply reply) {
		Reply newReply = replyRepository.save(reply);
		return ResponseEntity.ok(newReply);
	}

	@PostMapping(path = "/{postId}/reaction", produces = "application/json", consumes = "application/json")
	public ResponseEntity<PostReaction> createPostReaction(@PathVariable("postId") Integer postId, @RequestBody PostReaction reaction) {
		PostReaction newPostReaction = postReactionRepository.save(reaction);
		return ResponseEntity.ok(newPostReaction);
	}

	@PostMapping(path = "/{postId}/reply/{replyId}/reaction", produces = "application/json", consumes = "application/json")
	public ResponseEntity<ReplyReaction> createReplyReaction(@PathVariable("postId") Integer postId, @PathVariable("replyId") Integer replyId, @RequestBody ReplyReaction reaction) {
		ReplyReaction newReplyReaction = replyReactionRepository.save(reaction);
		return ResponseEntity.ok(newReplyReaction);
	}
}
