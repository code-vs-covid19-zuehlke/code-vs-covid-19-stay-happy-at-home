package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "FEELING_RECORD")
public class FeelingRecord {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @OneToMany(cascade = CascadeType.ALL)
  private Set<Feeling> feelings;

  @Column(name = "time")
  private LocalDateTime time;

  public FeelingRecord() {
    // for Jackson
  }

  public FeelingRecord(Set<Feeling> feelings) {
    this.feelings = feelings;
    this.time = LocalDateTime.now();
  }

  public Long getId() {
    return id;
  }

  public Set<Feeling> getFeelings() {
    return feelings;
  }

  public void setFeelings(Set<Feeling> feelings) {
    this.feelings = feelings;
  }

  public LocalDateTime getTime() {
    return time;
  }

  public void setTime(LocalDateTime time) {
    this.time = time;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    FeelingRecord that = (FeelingRecord) o;
    return Objects.equals(id, that.id) &&
      Objects.equals(feelings, that.feelings) &&
      Objects.equals(time, that.time);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, feelings, time);
  }
}
