package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.dto.ReplyDto;
import org.codevscovid19.stayhappyathome.dto.ReplyReactionDto;
import org.codevscovid19.stayhappyathome.entity.Post;
import org.codevscovid19.stayhappyathome.entity.Reply;
import org.codevscovid19.stayhappyathome.entity.ReplyReaction;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.login.HansNotFoundException;
import org.codevscovid19.stayhappyathome.repository.PostRepository;
import org.codevscovid19.stayhappyathome.repository.ReplyReactionRepository;
import org.codevscovid19.stayhappyathome.repository.ReplyRepository;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
import org.codevscovid19.stayhappyathome.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URL;
import java.util.Collections;

import static org.codevscovid19.stayhappyathome.login.Contants.USER_ID_HEADER_NAME;

@RestController
@RequestMapping("/api/v1/reply")
public class ReplyResource {

  private final PostRepository postRepository;
  private final ReplyRepository replyRepository;
  private final UserRepository userRepository;
  private final ReplyReactionRepository replyReactionRepository;
  private final PhotoService photoService;

  @Autowired
  public ReplyResource(PostRepository postRepository, ReplyRepository replyRepository,
                       ReplyReactionRepository replyReactionRepository,
                       UserRepository userRepository, PhotoService photoService) {
    this.postRepository = postRepository;
    this.replyRepository = replyRepository;
    this.userRepository = userRepository;
    this.replyReactionRepository = replyReactionRepository;
    this.photoService = photoService;
  }

  @PostMapping(path = "/post/{postId}", produces = "application/json", consumes = "application/json")
  public ResponseEntity<Reply> createReply(@RequestHeader(name = USER_ID_HEADER_NAME) String userId,
                                           @PathVariable("postId") Long postId,
                                           @RequestBody ReplyDto replyDto) throws IOException {
    User user = userRepository.findById(userId).orElseThrow(() -> new HansNotFoundException("User", userId));
    Post post = postRepository.findById(postId).orElseThrow(() -> new HansNotFoundException("Post", postId));
    Reply reply = new Reply(replyDto.getTitle(), replyDto.getDescription(), replyDto.getLink(), user, Collections.emptyList());
    Reply newReply = replyRepository.save(reply);

    newReply = associateReplyWithPhoto(replyDto, newReply);

    replyRepository.save(reply);
    post.addReply(reply);
    postRepository.save(post);
    return ResponseEntity.ok(newReply);
  }

  @PostMapping(path = "/{replyId}/reaction", produces = "application/json", consumes = "application/json")
  public ResponseEntity<ReplyReaction> createReplyReaction(@RequestHeader(name = USER_ID_HEADER_NAME) String userId,
                                                           @PathVariable("replyId") Long replyId,
                                                           @RequestBody ReplyReactionDto reactionDto) {
    Reply reply = replyRepository.findById(replyId).orElseThrow(() -> new HansNotFoundException("Reply", replyId));
    User user = userRepository.findById(userId).orElseThrow(() -> new HansNotFoundException("User", userId));

    ReplyReaction replyReaction = new ReplyReaction(user, reactionDto.getEmoji(), reply);
    ReplyReaction newReplyReaction = replyReactionRepository.save(replyReaction);
    reply.addReaction(newReplyReaction);
    replyRepository.save(reply);
    return ResponseEntity.ok(newReplyReaction);
  }

  private Reply associateReplyWithPhoto(ReplyDto replyDto, Reply newReply) throws IOException {
    byte[] picture = replyDto.getPicture();
    String photoContentType = replyDto.getPhotoContentType();

    if (picture != null && photoContentType != null) {
      URL photoUrl = photoService.writeBytesToStorage("reply-" + newReply.getId(), picture, photoContentType);
      newReply.updatePhoto(photoUrl, photoContentType);
    }
    return newReply;
  }
}
