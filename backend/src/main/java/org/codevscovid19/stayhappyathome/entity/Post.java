package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "POSTS")
public class Post {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
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
  private List<PostReaction> postReactions;

  private Post() {
    // for Jackson
  }

  public Post(String title, String description, URL link, byte[] picture, User user) {
    this.title = title;
    this.description = description;
    this.link = link;
    this.picture = picture;
    this.user = user;
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

  public List<PostReaction> getPostReactions() {
    return postReactions;
  }

  public void setPostReactions(List<PostReaction> postReactions) {
    this.postReactions = postReactions;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Post post = (Post) o;
    return Objects.equals(id, post.id) &&
      Objects.equals(title, post.title) &&
      Objects.equals(description, post.description) &&
      Objects.equals(link, post.link) &&
      Arrays.equals(picture, post.picture) &&
      Objects.equals(user, post.user) &&
      Objects.equals(postReactions, post.postReactions);
  }

  @Override
  public int hashCode() {
    int result = Objects.hash(id, title, description, link, user, postReactions);
    result = 31 * result + Arrays.hashCode(picture);
    return result;
  }
}
