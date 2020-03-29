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

  @OneToMany(cascade = CascadeType.ALL)
  private List<TimeRecord> availableTimeRecords;

  private User() {
    // for Jackson
  }

  public User(String id, String name, URL photo, String photoContentType) {
    this.id = id;
    this.name = name;
    this.photo = photo;
    this.photoContentType = photoContentType;
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

  @JsonIgnore
  public List<FeelingRecord> getFeelingRecords() {
    if (feelingRecords == null) {
      feelingRecords = new ArrayList<>();
    }
    return feelingRecords;
  }

  @Transient
  @JsonIgnore
  public void addTimeRecord(TimeRecord timeRecord) {
    getAvailableTimeRecords().add(timeRecord);
  }

  @Transient
  @JsonIgnore
  public void addFeelings(FeelingRecord feelingRecord) {
    getFeelingRecords().add(feelingRecord);
  }

  @JsonIgnore
  public List<TimeRecord> getAvailableTimeRecords() {
    if (availableTimeRecords == null) {
      availableTimeRecords = new ArrayList<>();
    }
    return availableTimeRecords;
  }

  @JsonIgnore
  public void setAvailableTimeRecords(List<TimeRecord> availableTimeRecords) {
    this.availableTimeRecords = availableTimeRecords;
  }

  @Transient
  public TimeRecord getTimeRecord() {
    return getAvailableTimeRecords().stream()
      .max(Comparator.comparing(TimeRecord::getTime))
      .orElse(null);
  }

  public String getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public URL getPhoto() {
    return photo;
  }

  public String getPhotoContentType() {
    return photoContentType;
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
