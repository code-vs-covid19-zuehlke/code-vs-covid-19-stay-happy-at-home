package org.codevscovid19.stayhappyathome.dto;

import java.net.URL;
import java.util.Set;

public class PostDto {
  private String title;
  private String description;
  private URL link;
  private byte[] picture;
  private Set<TargetFeelingDto> targetFeelings;
  private String photoContentType;
  private Integer requiredTime;

  private PostDto() {
    // for Jackson
  }

  public PostDto(String title, String description, URL link, byte[] picture, Set<TargetFeelingDto> targetFeelings, String photoContentType, Integer requiredTime) {
    this.title = title;
    this.description = description;
    this.link = link;
    this.picture = picture;
    this.targetFeelings = targetFeelings;
    this.photoContentType = photoContentType;
    this.requiredTime = requiredTime;
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

  public void setPhotoContentType(String photoContentType) {
    this.photoContentType = photoContentType;
  }

  public Integer getRequiredTime() {
    return requiredTime;
  }

  public void setRequiredTime(Integer requiredTime) {
    this.requiredTime = requiredTime;
  }
}
