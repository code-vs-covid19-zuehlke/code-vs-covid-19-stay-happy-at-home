package org.codevscovid19.stayhappyathome.service;

import org.codevscovid19.stayhappyathome.dto.ReactionSummaryDto;
import org.codevscovid19.stayhappyathome.entity.Post;
import org.codevscovid19.stayhappyathome.entity.PostReaction;
import org.codevscovid19.stayhappyathome.entity.Reply;
import org.codevscovid19.stayhappyathome.entity.ReplyReaction;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.login.HansNotFoundException;
import org.codevscovid19.stayhappyathome.repository.PostReactionRepository;
import org.codevscovid19.stayhappyathome.repository.PostRepository;
import org.codevscovid19.stayhappyathome.repository.ReplyReactionRepository;
import org.codevscovid19.stayhappyathome.repository.ReplyRepository;
import org.codevscovid19.stayhappyathome.repository.UserRepository;
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

  public ReactionSummaryDto getReactionSummaryReceived(String userId){
    User user = userRepository.findById(userId).orElseThrow(() ->new HansNotFoundException("User", userId));

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
    User user = userRepository.findById(userId).orElseThrow(() ->new HansNotFoundException("User", userId));
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
}
