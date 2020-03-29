package org.codevscovid19.stayhappyathome.dto;

import java.net.URL;
import java.util.Set;

public class PostDto {
  private Long id;
  private String title;
  private String description;
  private URL link;
  private byte[] picture;
  private Set<TargetFeelingDto> targetFeelings;
  private String photoContentType;

  private PostDto() {
    // for Jackson
  }

  public PostDto(String title, String description, URL link, byte[] picture, Set<TargetFeelingDto> targetFeelings, String photoContentType) {
    this.title = title;
    this.description = description;
    this.link = link;
    this.picture = picture;
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

  public byte[] getPicture() {
    return picture;
  }

  public void setPicture(byte[] picture) {
    this.picture = picture;
  }

  public void setTargetFeelings(Set<TargetFeelingDto> targetFeelings) {
    this.targetFeelings = targetFeelings;
  }

  public Set<TargetFeelingDto> getTargetFeelings() {
    return this.targetFeelings;
  }

  public String getPhotoContentType() {
    return photoContentType;
  }
}
