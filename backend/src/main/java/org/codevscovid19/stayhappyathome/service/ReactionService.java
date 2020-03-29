package org.codevscovid19.stayhappyathome.service;

import org.codevscovid19.stayhappyathome.dto.ReactionSummaryDto;
import org.codevscovid19.stayhappyathome.entity.*;
import org.codevscovid19.stayhappyathome.login.HansNotFoundException;
import org.codevscovid19.stayhappyathome.repository.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReactionService {
  private final UserRepository userRepository;
  private final PostRepository postRepository;
  private final ReplyRepository replyRepository;
  private final PostReactionRepository postReactionRepository;
  private final ReplyReactionRepository replyReactionRepository;

  public ReactionService(UserRepository userRepository,
                         PostRepository postRepository,
                         ReplyRepository replyRepository,
                         PostReactionRepository postReactionRepository,
                         ReplyReactionRepository replyReactionRepository) {
    this.userRepository = userRepository;
    this.postRepository = postRepository;
    this.replyRepository = replyRepository;
    this.postReactionRepository = postReactionRepository;
    this.replyReactionRepository = replyReactionRepository;
  }

  public ReactionSummaryDto getReactionSummaryReceived(String userId) {
    User user = userRepository.findById(userId).orElseThrow(() -> new HansNotFoundException("User", userId));

    List<Post> posts = postRepository.findAllByUserEquals(user);
    ReactionSummaryDto reactionSummary = new ReactionSummaryDto();
    for (Post post : posts) {
      for (PostReaction postReaction : post.getPostReactions()) {
        reactionSummary.addReaction(postReaction.getEmoji());
      }
    }

    List<Reply> replies = replyRepository.findAllByUserEquals(user);
    for (Reply reply : replies) {
      for (ReplyReaction replyReaction : reply.getReplyReactions()) {
        reactionSummary.addReaction(replyReaction.getEmoji());
      }
    }

    return reactionSummary;
  }

  public ReactionSummaryDto getReactionSummaryGiven(String userId) {
    User user = userRepository.findById(userId).orElseThrow(() -> new HansNotFoundException("User", userId));
    ReactionSummaryDto reactionSummary = new ReactionSummaryDto();

    List<ReplyReaction> replyReactions = replyReactionRepository.findAllByUserEquals(user);
    for (ReplyReaction replyReaction : replyReactions) {
      reactionSummary.addReaction(replyReaction.getEmoji());
    }

    List<PostReaction> postReactions = postReactionRepository.findAllByUserEquals(user);
    for (PostReaction postReaction : postReactions) {
      reactionSummary.addReaction(postReaction.getEmoji());
    }

    return reactionSummary;
  }

  public ReactionSummaryDto getReactionSummaryForPost(Long postId) {
    Post post = postRepository.findById(postId)
      .orElseThrow(() -> new RuntimeException(String.format("Post with id %d not found", postId)));
    ReactionSummaryDto reactionSummary = new ReactionSummaryDto();

    List<PostReaction> postReactions = postReactionRepository.findAllByPostEquals(post);
    for (PostReaction postReaction : postReactions) {
      reactionSummary.addReaction(postReaction.getEmoji());
    }

    return reactionSummary;
  }

  public ReactionSummaryDto getReactionSummaryForReply(Long replyId) {
    Reply reply = replyRepository.findById(replyId)
      .orElseThrow(() -> new HansNotFoundException("Reply", replyId));
    ReactionSummaryDto reactionSummary = new ReactionSummaryDto();

    List<ReplyReaction> replyReactions = replyReactionRepository.findAllByReplyEquals(reply);
    for (ReplyReaction replyReaction : replyReactions) {
      reactionSummary.addReaction(replyReaction.getEmoji());
    }

    return reactionSummary;
  }

  public Post enrichPostWithReactionSummary(Post post) {
    ReactionSummaryDto postReactionSummary = getReactionSummaryForPost(post.getId());
    post.setReactionSummary(postReactionSummary);
    List<Reply> replies = enrichRepliesWithReactionSummaries(post.getReplies());
    post.setReplies(replies);
    return post;
  }

  private List<Reply> enrichRepliesWithReactionSummaries(List<Reply> replies) {
    for (Reply reply : replies) {
      ReactionSummaryDto reactionSummary = getReactionSummaryForReply(reply.getId());
      reply.setReactionSummary(reactionSummary);
    }
    return replies;
  }
}
