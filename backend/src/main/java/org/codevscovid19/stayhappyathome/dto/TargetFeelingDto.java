package org.codevscovid19.stayhappyathome.dto;

import org.codevscovid19.stayhappyathome.entity.Emotion;

public class TargetFeelingDto {
  private Emotion emotion;

  public TargetFeelingDto() {
    //for Jackson
  }

  public TargetFeelingDto(Emotion emotion) {
    this.emotion = emotion;
  }

  public Emotion getEmotion() {
    return emotion;
  }

  public void setEmotion(Emotion emotion) {
    this.emotion = emotion;
  }
}
