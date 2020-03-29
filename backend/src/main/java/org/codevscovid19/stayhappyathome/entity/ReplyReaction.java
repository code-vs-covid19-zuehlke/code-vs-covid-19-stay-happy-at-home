package org.codevscovid19.stayhappyathome.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "REPLY_REACTIONS")
public class ReplyReaction {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reply_reaction_sequence_generator")
  @SequenceGenerator(name = "reply_reaction_sequence_generator", sequenceName = "reply_reaction__id_sequence")
  private Long id;

  @JsonIgnore
  @ManyToOne
  @JoinColumn(name = "reply_id")
  private Reply reply;

  @ManyToOne
  private User user;

  private Emoji emoji;

  private ReplyReaction() {
    // for Jackson
  }

  public ReplyReaction(User user, Emoji emoji, Reply reply) {
    this.user = user;
    this.emoji = emoji;
    this.reply = reply;
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

  public Emoji getEmoji() {
    return emoji;
  }

  public void setEmoji(Emoji emoji) {
    this.emoji = emoji;
  }

  public Reply getReply() {
    return reply;
  }

  public void setReply(Reply reply) {
    this.reply = reply;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    ReplyReaction that = (ReplyReaction) o;
    return Objects.equals(id, that.id) &&
      Objects.equals(user, that.user) &&
      emoji == that.emoji &&
      Objects.equals(reply, that.reply);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, user, emoji, reply);
  }

  @Override
  public String toString() {
    return "ReplyReaction{" +
      "id=" + id +
      ", user=" + user +
      ", emoji=" + emoji +
      ", reply=" + reply +
      '}';
  }
}
