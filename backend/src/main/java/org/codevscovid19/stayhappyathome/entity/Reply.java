package org.codevscovid19.stayhappyathome.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.net.URL;
import java.util.ArrayList;
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

  @Column(name = "picture")
  private URL picture;

  @Column(name = "photo_content_type")
  private String photoContentType;

  @ManyToOne
  private User user;

  @OneToMany
  private List<ReplyReaction> replyReactions;

  @ManyToOne
  @JoinColumn(name = "replies")
  private Post post;

  private Reply() {
    // for Jackson
  }

  public Reply(String title, String description, URL link, URL picture, User user, List<ReplyReaction> replyReactions, String photoContentType) {
    this.title = title;
    this.description = description;
    this.link = link;
    this.picture = picture;
    this.user = user;
    this.replyReactions = replyReactions;
    this.photoContentType = photoContentType;
  }

  @JsonIgnore
  @Transient
  public void addReaction(ReplyReaction replyReaction) {
    if (replyReactions == null) {
      replyReactions = new ArrayList<>();
    }
    replyReactions.add(replyReaction);
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

  public URL getPicture() {
    return picture;
  }

  public void setPicture(URL picture) {
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

  public String getPhotoContentType() {
    return photoContentType;
  }

  public void setPhotoContentType(String photoContentType) {
    this.photoContentType = photoContentType;
  }

  @JsonIgnore
  public Post getPost() {
    return post;
  }

  @JsonIgnore
  public void setPost(Post post) {
    this.post = post;
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
      Objects.equals(picture, reply.picture) &&
      Objects.equals(photoContentType, reply.photoContentType) &&
      Objects.equals(user, reply.user) &&
      Objects.equals(replyReactions, reply.replyReactions) &&
      Objects.equals(post, reply.post);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, title, description, link, picture, photoContentType, user, replyReactions, post);
  }
}
