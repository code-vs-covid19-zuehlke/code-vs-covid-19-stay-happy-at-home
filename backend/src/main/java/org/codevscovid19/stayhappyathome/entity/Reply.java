package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;

import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "REPLIES")
public class Reply {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reply_sequence_generator")
  @SequenceGenerator(name = "reply_sequence_generator", sequenceName = "reply_id_sequence")
  private Long id;

  @Column(name = "title", nullable = false)
  private String title;

  @Column(name = "description", nullable = false)
  private String description;

  @Column(name = "link")
  private URL link;

  private byte[] picture;

  @ManyToOne
  private User user;

  @OneToMany
  private List<ReplyReaction> replyReactions;

  private Reply() {
    // for Jackson
  }

  public Reply(String title, String description, URL link, byte[] picture, User user, List<ReplyReaction> replyReactions) {
    this.title = title;
    this.description = description;
    this.link = link;
    this.picture = picture;
    this.user = user;
    this.replyReactions = replyReactions;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public URL getLink() {
    return link;
  }

  public void setLink(URL link) {
    this.link = link;
  }

  public byte[] getPicture() {
    return picture;
  }

  public void setPicture(byte[] picture) {
    this.picture = picture;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public List<ReplyReaction> getReplyReactions() {
    return replyReactions;
  }

  public void setReplyReactions(List<ReplyReaction> replyReactions) {
    this.replyReactions = replyReactions;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Reply reply = (Reply) o;
    return Objects.equals(id, reply.id) &&
      Objects.equals(title, reply.title) &&
      Objects.equals(description, reply.description) &&
      Objects.equals(link, reply.link) &&
      Arrays.equals(picture, reply.picture) &&
      Objects.equals(user, reply.user) &&
      Objects.equals(replyReactions, reply.replyReactions);
  }

  @Override
  public int hashCode() {
    int result = Objects.hash(id, title, description, link, user, replyReactions);
    result = 31 * result + Arrays.hashCode(picture);
    return result;
  }
}
