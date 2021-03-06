package org.codevscovid19.stayhappyathome.dto;

import java.net.URL;

public class ReplyDto {
  private String title;
  private String description;
  private URL link;
  private byte[] picture;
  private String photoContentType;

  private ReplyDto() {
    // for Jackson
  }

  public ReplyDto(String title, String description, URL link, byte[] picture, String photoContentType) {
    this.title = title;
    this.description = description;
    this.link = link;
    this.picture = picture;
    this.photoContentType = photoContentType;
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

  public String getPhotoContentType() {
    return photoContentType;
  }

  public void setPhotoContentType(String photoContentType) {
    this.photoContentType = photoContentType;
  }
}
