package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.dto.PostDto;
import org.codevscovid19.stayhappyathome.dto.PostReactionDto;
import org.codevscovid19.stayhappyathome.dto.ReplyDto;
import org.codevscovid19.stayhappyathome.dto.ReplyReactionDto;
import org.codevscovid19.stayhappyathome.entity.Post;
import org.codevscovid19.stayhappyathome.entity.PostReaction;
import org.codevscovid19.stayhappyathome.entity.Reply;
import org.codevscovid19.stayhappyathome.entity.ReplyReaction;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.repository.PostReactionRepository;
import org.codevscovid19.stayhappyathome.repository.PostRepository;
import org.codevscovid19.stayhappyathome.repository.ReplyReactionRepository;
import org.codevscovid19.stayhappyathome.repository.ReplyRepository;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
import org.codevscovid19.stayhappyathome.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import static org.codevscovid19.stayhappyathome.login.Contants.USER_ID_HEADER_NAME;

@RestController
@RequestMapping("/api/v1/post")
public class PostResource {

  private final PostRepository postRepository;
  private final ReplyRepository replyRepository;
  private final UserRepository userRepository;
  private final PostService postService;
  private final PostReactionRepository postReactionRepository;
  private final ReplyReactionRepository replyReactionRepository;

  @Autowired
  public PostResource(PostRepository postRepository, ReplyRepository replyRepository,
                      PostReactionRepository postReactionRepository, ReplyReactionRepository replyReactionRepository,
                      UserRepository userRepository, PostService postService) {
    this.postRepository = postRepository;
    this.replyRepository = replyRepository;
    this.userRepository = userRepository;
    this.postService = postService;
    this.postReactionRepository = postReactionRepository;
    this.replyReactionRepository = replyReactionRepository;
  }

  @GetMapping(path = "", produces = "application/json")
  public ResponseEntity<Set<Post>> getPosts(@RequestHeader(name = USER_ID_HEADER_NAME) String userId) {
    User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("Could not find User"));

    return ResponseEntity.ok(postService.getPostsForUser(user));
  }

  @PostMapping(path = "", produces = "application/json", consumes = "application/json")
  public ResponseEntity<Post> createPosts(@RequestHeader(name = USER_ID_HEADER_NAME) String userId, @RequestBody PostDto postDto) {
    User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("Could not find User"));

    Post post = new Post(postDto.getTitle(), postDto.getDescription(), postDto.getLink(), postDto.getPicture(), user, Collections.emptyList());

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
  public ResponseEntity<Reply> createReply(@RequestHeader(name = USER_ID_HEADER_NAME) String userId, @PathVariable("postId") Long postId, @RequestBody ReplyDto replyDto) {
    User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("Could not find User"));
    Reply reply = new Reply(replyDto.getTitle(), replyDto.getDescription(), replyDto.getLink(), replyDto.getPicture(), user, Collections.emptyList());

    Reply newReply = replyRepository.save(reply);
    return ResponseEntity.ok(newReply);
  }

  @PostMapping(path = "/{postId}/reaction", produces = "application/json", consumes = "application/json")
  public ResponseEntity<PostReaction> createPostReaction(@RequestHeader(name = USER_ID_HEADER_NAME) String userId, @PathVariable("postId") Long postId, @RequestBody PostReactionDto reactionDto) {
    Post post = postRepository.findById(postId).orElseThrow(() -> new RuntimeException("Could not find Post"));
    User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("Could not find User"));

    // TODO: add reaction to post
    PostReaction postReaction = new PostReaction(user);

    PostReaction newPostReaction = postReactionRepository.save(postReaction);
    return ResponseEntity.ok(newPostReaction);
  }

  @PostMapping(path = "/{postId}/reply/{replyId}/reaction", produces = "application/json", consumes = "application/json")
  public ResponseEntity<ReplyReaction> createReplyReaction(@RequestHeader(name = USER_ID_HEADER_NAME) String userId, @PathVariable("postId") Long postId, @PathVariable("replyId") Long replyId, @RequestBody ReplyReactionDto reactionDto) {
    Reply reply = replyRepository.findById(replyId).orElseThrow(() -> new RuntimeException("Could not find Reply"));
    User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("Could not find User"));

    // TODO: add reaction to reaction
    ReplyReaction replyReaction = new ReplyReaction(user);

    ReplyReaction newReplyReaction = replyReactionRepository.save(replyReaction);
    return ResponseEntity.ok(newReplyReaction);
  }
}
