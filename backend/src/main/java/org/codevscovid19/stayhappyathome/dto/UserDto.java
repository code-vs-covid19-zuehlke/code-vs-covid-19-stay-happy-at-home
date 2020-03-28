package org.codevscovid19.stayhappyathome.dto;

public class UserDto {
  private String id;
  private String name;
  private byte[] photo;
  private String photoContentType;

  private UserDto() {
    // for Jackson
  }

  public UserDto(String id, String name, byte[] photo, String photoContentType) {
    this.id = id;
    this.name = name;
    this.photo = photo;
    this.photoContentType = photoContentType;
  }

  public String getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public byte[] getPhoto() {
    return photo;
  }

  public String getPhotoContentType() {
    return photoContentType;
  }
}
