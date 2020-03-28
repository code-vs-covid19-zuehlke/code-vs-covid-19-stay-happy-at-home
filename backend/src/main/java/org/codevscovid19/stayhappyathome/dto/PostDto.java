package org.codevscovid19.stayhappyathome.dto;

import java.net.URL;

public class PostDto {
  private Long id;
  private String title;
  private String description;
  private URL link;
  private byte[] picture;

  private PostDto() {
    // for Jackson
  }

  public PostDto(String title, String description, URL link, byte[] picture) {
    this.title = title;
    this.description = description;
    this.link = link;
    this.picture = picture;
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
}
