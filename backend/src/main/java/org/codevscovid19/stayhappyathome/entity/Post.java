package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import java.net.URL;
import java.util.List;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "POSTS")
public class Post {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "post_sequence_generator")
  @SequenceGenerator(name = "post_sequence_generator", sequenceName = "post_id_sequence")
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
  private List<PostReaction> postReactions;

  @NotNull
  @ElementCollection(targetClass = TargetFeeling.class)
  @CollectionTable(name = "target_feelings", joinColumns = @JoinColumn(name = "target_feeling_id"))
  @Column(name = "target_feeling")
  @Enumerated(EnumType.STRING)
  private Set<TargetFeeling> targetFeelings;

  private Post() {
    // for Jackson
  }

  public Post(String title, String description, URL link, URL picture, User user, Set<TargetFeeling> targetFeelings, String photoContentType) {
    this.title = title;
    this.description = description;
    this.link = link;
    this.picture = picture;
    this.user = user;
    this.targetFeelings = targetFeelings;
    this.photoContentType = photoContentType;
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

  public List<PostReaction> getPostReactions() {
    return postReactions;
  }

  public void setPostReactions(List<PostReaction> postReactions) {
    this.postReactions = postReactions;
  }

  public Set<TargetFeeling> getTargetFeelings() {
    return targetFeelings;
  }

  public void setTargetFeelings(Set<TargetFeeling> targetFeelings) {
    this.targetFeelings = targetFeelings;
  }

  public String getPhotoContentType() {
    return photoContentType;
  }

  public void setPhotoContentType(String photoContentType) {
    this.photoContentType = photoContentType;
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
      Objects.equals(picture, post.picture) &&
      Objects.equals(photoContentType, post.photoContentType) &&
      Objects.equals(user, post.user) &&
      Objects.equals(postReactions, post.postReactions);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, title, description, link, picture, photoContentType, user, postReactions);
  }
}
