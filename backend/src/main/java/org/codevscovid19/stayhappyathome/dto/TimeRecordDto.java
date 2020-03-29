package org.codevscovid19.stayhappyathome.dto;

import javax.validation.constraints.NotNull;

public class TimeRecordDto {

  private Integer availableTime;

  private TimeRecordDto() {
    // for Jackson
  }

  public Integer getAvailableTime() {
    return availableTime;
  }

  public void setAvailableTime(Integer availableTime) {
    this.availableTime = availableTime;
  }
}
