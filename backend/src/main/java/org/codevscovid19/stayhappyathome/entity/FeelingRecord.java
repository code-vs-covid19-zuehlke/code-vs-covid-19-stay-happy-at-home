package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "FEELING_RECORD")
public class FeelingRecord {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @OneToMany
  private Set<Feeling> feelings;

  @Column(name = "time")
  private LocalDateTime time;

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
}
