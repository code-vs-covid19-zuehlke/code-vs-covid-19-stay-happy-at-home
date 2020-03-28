package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "FEELING_RECORD")
public class FeelingRecord {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "feeling_record_sequence_generator")
  @SequenceGenerator(name = "feeling_record_sequence_generator", sequenceName = "feeling_record_id_sequence")
  private Long id;

  @OneToMany(cascade = CascadeType.ALL)
  private List<Feeling> feelings;

  @Column(name = "time")
  private LocalDateTime time;

  public FeelingRecord() {
    // for Jackson
  }

  public FeelingRecord(List<Feeling> feelings) {
    this.feelings = feelings;
    this.time = LocalDateTime.now();
  }

  public Long getId() {
    return id;
  }

  public List<Feeling> getFeelings() {
    return feelings;
  }

  public void setFeelings(List<Feeling> feelings) {
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

  @Override
  public String toString() {
    return "FeelingRecord{" +
      "id=" + id +
      ", feelings=" + feelings +
      ", time=" + time +
      '}';
  }
}
