package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.dto.PostDto;
import org.codevscovid19.stayhappyathome.dto.PostReactionDto;
import org.codevscovid19.stayhappyathome.dto.ReplyDto;
import org.codevscovid19.stayhappyathome.dto.ReplyReactionDto;
import org.codevscovid19.stayhappyathome.entity.*;
import org.codevscovid19.stayhappyathome.login.HansNotFoundException;
import org.codevscovid19.stayhappyathome.repository.*;
import org.codevscovid19.stayhappyathome.service.PhotoService;
import org.codevscovid19.stayhappyathome.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URL;
import java.util.Collections;
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
  private final TargetFeelingRepository targetFeelingRepository;
  private final PhotoService photoService;

  @Autowired
  public PostResource(PostRepository postRepository, ReplyRepository replyRepository,
                      PostReactionRepository postReactionRepository, ReplyReactionRepository replyReactionRepository,
                      UserRepository userRepository, PostService postService, PhotoService photoService, TargetFeelingRepository targetFeelingRepository) {
    this.postRepository = postRepository;
    this.replyRepository = replyRepository;
    this.userRepository = userRepository;
    this.postService = postService;
    this.postReactionRepository = postReactionRepository;
    this.replyReactionRepository = replyReactionRepository;
    this.targetFeelingRepository = targetFeelingRepository;
    this.photoService = photoService;
  }

  @GetMapping(path = "", produces = "application/json")
  public ResponseEntity<Set<Post>> getPosts(@RequestHeader(name = USER_ID_HEADER_NAME) String userId) {
    User user = userRepository.findById(userId).orElseThrow(() -> new HansNotFoundException("User", userId));

    return ResponseEntity.ok(postService.getPostsForUser(user));
  }

  @PostMapping(path = "", produces = "application/json", consumes = "application/json")
  public ResponseEntity<Post> createPost(@RequestHeader(name = USER_ID_HEADER_NAME) String userId,
                                          @RequestBody PostDto postDto) throws IOException {
    User user = userRepository.findById(userId).orElseThrow(() -> new HansNotFoundException("User", userId));
    Post post = new Post(postDto.getTitle(), postDto.getDescription(), postDto.getLink(), user);

    postDto.getTargetFeelings().forEach(targetFeeling -> targetFeelingRepository.save(new TargetFeeling(post, targetFeeling.getEmotion())));

    Post newPost = postRepository.save(post);

    URL photoUrl = photoService.writeBytesToStorage("post-" + newPost.getId(), postDto.getPicture(), postDto.getPhotoContentType());
    newPost.updatePhoto(photoUrl, postDto.getPhotoContentType());
    postRepository.save(newPost);
    return ResponseEntity.ok(newPost);
  }

  @GetMapping(path = "/{id}", produces = "application/json")
  public ResponseEntity<Post> getPost(@PathVariable("id") Long id) {
    Optional<Post> post = postRepository.findById(id);
    return post.map(ResponseEntity::ok)
      .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).build());
  }

  @PostMapping(path = "/{postId}/reply", produces = "application/json", consumes = "application/json")
  public ResponseEntity<Reply> createReply(@RequestHeader(name = USER_ID_HEADER_NAME) String userId,
                                           @PathVariable("postId") Long postId,
                                           @RequestBody ReplyDto replyDto) throws IOException {
    User user = userRepository.findById(userId).orElseThrow(() -> new HansNotFoundException("User", userId));
    Post post = postRepository.findById(postId).orElseThrow(() -> new HansNotFoundException("Post", postId));
    Reply reply = new Reply(replyDto.getTitle(), replyDto.getDescription(), replyDto.getLink(), user, Collections.emptyList());
    Reply newReply = replyRepository.save(reply);

    URL photoUrl = photoService.writeBytesToStorage("reply-" + newReply.getId(), replyDto.getPicture(), replyDto.getPhotoContentType());
    newReply.updatePhoto(photoUrl, replyDto.getPhotoContentType());
    replyRepository.save(reply);

    post.addReply(reply);
    postRepository.save(post);
    return ResponseEntity.ok(newReply);
  }

  @PostMapping(path = "/{postId}/reaction", produces = "application/json", consumes = "application/json")
  public ResponseEntity<PostReaction> createPostReaction(@RequestHeader(name = USER_ID_HEADER_NAME) String userId,
                                                         @PathVariable("postId") Long postId,
                                                         @RequestBody PostReactionDto reactionDto) {
    Post post = postRepository.findById(postId).orElseThrow(() -> new HansNotFoundException("Post", postId));
    User user = userRepository.findById(userId).orElseThrow(() -> new HansNotFoundException("User", userId));

    PostReaction postReaction = new PostReaction(user, reactionDto.getEmoji());
    PostReaction newPostReaction = postReactionRepository.save(postReaction);
    post.addReaction(newPostReaction);
    postRepository.save(post);
    return ResponseEntity.ok(newPostReaction);
  }

  @PostMapping(path = "/{postId}/reply/{replyId}/reaction", produces = "application/json", consumes = "application/json")
  public ResponseEntity<ReplyReaction> createReplyReaction(@RequestHeader(name = USER_ID_HEADER_NAME) String userId,
                                                           @PathVariable("postId") Long postId,
                                                           @PathVariable("replyId") Long replyId,
                                                           @RequestBody ReplyReactionDto reactionDto) {
    Reply reply = replyRepository.findById(replyId).orElseThrow(() -> new HansNotFoundException("Reply", replyId));
    User user = userRepository.findById(userId).orElseThrow(() -> new HansNotFoundException("User", userId));

    ReplyReaction replyReaction = new ReplyReaction(user, reactionDto.getEmoji());
    ReplyReaction newReplyReaction = replyReactionRepository.save(replyReaction);
    reply.addReaction(newReplyReaction);
    replyRepository.save(reply);
    return ResponseEntity.ok(newReplyReaction);
  }
}
