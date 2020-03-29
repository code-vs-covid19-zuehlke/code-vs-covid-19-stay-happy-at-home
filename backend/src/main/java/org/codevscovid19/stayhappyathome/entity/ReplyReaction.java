package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import java.util.Objects;

@Entity
@Table(name = "REPLY_REACTIONS")
public class ReplyReaction {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reply_reaction_sequence_generator")
  @SequenceGenerator(name = "reply_reaction_sequence_generator", sequenceName = "reply_reaction__id_sequence")
  private Long id;

  @ManyToOne
  private User user;

  private Emoji emoji;

  private ReplyReaction() {
    // for Jackson
  }

  public ReplyReaction(User user, Emoji emoji) {
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
    ReplyReaction that = (ReplyReaction) o;
    return Objects.equals(id, that.id) &&
      Objects.equals(user, that.user) &&
      emoji == that.emoji;
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, user, emoji);
  }

  @Override
  public String toString() {
    return "ReplyReaction{" +
      "id=" + id +
      ", user=" + user +
      ", emoji=" + emoji +
      '}';
  }
}
