package org.codevscovid19.stayhappyathome.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Entity
@Table(name = "USERS")
public class User {

  @Id
  private String id;
  @Column(name = "name")
  private String name;
  @Column(name = "photo")
  private URL photo;
  @Column(name = "photo_content_type")
  private String photoContentType;

  @OneToMany(cascade = CascadeType.ALL)
  private List<FeelingRecord> feelingRecords;

  private User() {
    // for Jackson
  }

  public User(String id, String name, URL photo, String photoContentType) {
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

  @JsonIgnore
  public List<FeelingRecord> getFeelingRecords() {
    return Optional.ofNullable(feelingRecords).orElse(new ArrayList<>());
  }

  @Transient
  public List<Feeling> getFeelings() {
    List<FeelingRecord> feelingRecords = getFeelingRecords();
    return feelingRecords.stream()
      .filter(Objects::nonNull)
      .filter(feelingRecord -> feelingRecord.getTime() != null)
      .max(Comparator.comparing(FeelingRecord::getTime))
      .map(FeelingRecord::getFeelings)
      .orElse(Collections.emptyList());
  }

  public URL getPhoto() {
    return photo;
  }

  public String getPhotoContentType() {
    return photoContentType;
  }

  public void addFeelings(FeelingRecord feelingRecord) {
    feelingRecords.add(feelingRecord);
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    User user = (User) o;
    return Objects.equals(id, user.id) &&
      Objects.equals(name, user.name) &&
      Objects.equals(photo, user.photo) &&
      Objects.equals(photoContentType, user.photoContentType) &&
      Objects.equals(feelingRecords, user.feelingRecords);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, name, photo, photoContentType, feelingRecords);
  }

  @Override
  public String toString() {
    return "User{" +
      "id='" + id + '\'' +
      ", name='" + name + '\'' +
      ", feelingRecords=" + feelingRecords +
      '}';
  }
}
