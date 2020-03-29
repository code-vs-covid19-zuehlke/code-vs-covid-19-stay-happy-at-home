package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "TIME_RECORDS")
public class TimeRecord {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "time_record_sequence_generator")
  @SequenceGenerator(name = "time_record_sequence_generator", sequenceName = "time_record_id_sequence")
  private Long id;

  @Column
  private Integer availableMinutes;

  @Column(name = "time")
  private LocalDateTime time;

  public TimeRecord() {
    // for Jackson
  }

  public TimeRecord(Integer availableMinutes) {
    this.availableMinutes = availableMinutes;
    this.time = LocalDateTime.now();
  }

  public Long getId() {
    return id;
  }


  public LocalDateTime getTime() {
    return time;
  }

  public void setTime(LocalDateTime time) {
    this.time = time;
  }

  public Integer getAvailableMinutes() {
    return availableMinutes;
  }

  public void setAvailableMinutes(Integer availableMinutes) {
    this.availableMinutes = availableMinutes;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    TimeRecord that = (TimeRecord) o;
    return Objects.equals(id, that.id) &&
      Objects.equals(availableMinutes, that.availableMinutes) &&
      Objects.equals(time, that.time);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, availableMinutes, time);
  }

  @Override
  public String toString() {
    return "TimeRecord{" +
      "id=" + id +
      ", availableMinutes=" + availableMinutes +
      ", time=" + time +
      '}';
  }
}
