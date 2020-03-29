package org.codevscovid19.stayhappyathome.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "REACTIONS")
public class PostReaction {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "post_reaction_sequence_generator")
  @SequenceGenerator(name = "post_reaction_sequence_generator", sequenceName = "post_reaction_id_sequence")
  private Long id;

  @ManyToOne
  private User user;

  @ManyToOne
  @JoinColumn(name = "postReactions")
  private Post post;

  private Emoji emoji;

  private PostReaction() {
    // for Jackson
  }

  public PostReaction(User user, Emoji emoji) {
    this.user = user;
    this.emoji = emoji;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  @JsonIgnore
  public Post getPost() {
    return post;
  }

  @JsonIgnore
  public void setPost(Post post) {
    this.post = post;
  }

  public Emoji getEmoji() {
    return emoji;
  }

  public void setEmoji(Emoji emoji) {
    this.emoji = emoji;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    PostReaction that = (PostReaction) o;
    return Objects.equals(id, that.id) &&
      Objects.equals(user, that.user) &&
      Objects.equals(post, that.post) &&
      emoji == that.emoji;
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, user, post, emoji);
  }
}
