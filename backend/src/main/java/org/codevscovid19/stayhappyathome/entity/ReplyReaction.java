package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "REACTIONS")
public class ReplyReaction {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reply_reaction_sequence_generator")
  @SequenceGenerator(name = "reply_reaction_sequence_generator", sequenceName = "reply_reaction__id_sequence")
  private Long id;

  @ManyToOne
  private User user;

  private ReplyReaction() {
    // for Jackson
  }

  public ReplyReaction(User user) {
    this.user = user;
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

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    ReplyReaction that = (ReplyReaction) o;
    return Objects.equals(id, that.id) &&
      Objects.equals(user, that.user);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, user);
  }
}
