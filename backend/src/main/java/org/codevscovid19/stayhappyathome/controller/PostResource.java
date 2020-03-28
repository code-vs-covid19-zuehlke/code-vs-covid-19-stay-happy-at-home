package org.codevscovid19.stayhappyathome.controller;

import org.codevscovid19.stayhappyathome.entity.Post;
import org.codevscovid19.stayhappyathome.entity.Reaction;
import org.codevscovid19.stayhappyathome.entity.Reply;
import org.codevscovid19.stayhappyathome.entity.User;
import org.codevscovid19.stayhappyathome.repository.PostRepository;
import org.codevscovid19.stayhappyathome.repository.ReactionRepository;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/post")
public class PostResource {

    private final PostRepository postRepository;
    private final ReplyRepository replyRepository;
    private final ReactionRepository reactionRepository;
    private final UserRepository userRepository;
    private final PostService postService;

    @Autowired
    public PostResource(PostRepository postRepository, ReplyRepository replyRepository, ReactionRepository reactionRepository,
                        UserRepository userRepository, PostService postService) {
        this.postRepository = postRepository;
        this.replyRepository = replyRepository;
        this.reactionRepository = reactionRepository;
        this.userRepository = userRepository;
        this.postService = postService;
    }

    @GetMapping(path = "/user/{id}", produces = "application/json")
    public ResponseEntity<ResponseEntity<List<Post>>> getPosts(@PathVariable("id") String id) {
        //		service.getPosts(user)
        // rausfinden welche feelings user hat -> Record: 1..3 Feelings & timestamp

        Optional<User> user = userRepository.findById(id);
        if (user.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(postService.getPostsForUser(user.get()));
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
    public ResponseEntity<Reaction> createPostReaction(@PathVariable("postId") Integer postId, @RequestBody Reaction reaction) {
        Reaction newReaction = reactionRepository.save(reaction);
        return ResponseEntity.ok(newReaction);
    }

    @PostMapping(path = "/{postId}/reply/{replyId}/reaction", produces = "application/json", consumes = "application/json")
    public ResponseEntity<Reaction> createReplyReaction(@PathVariable("postId") Integer postId, @PathVariable("replyId") Integer replyId, @RequestBody Reaction reaction) {
        Reaction newReaction = reactionRepository.save(reaction);
        return ResponseEntity.ok(newReaction);
    }
}
