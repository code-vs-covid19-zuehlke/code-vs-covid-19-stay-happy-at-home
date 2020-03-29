package org.codevscovid19.stayhappyathome.dto;

import org.codevscovid19.stayhappyathome.entity.Emoji;

public class FeelingDto {
  private Emoji emoji;

  private FeelingDto() {
    // for Jackson
  }

  public FeelingDto(Emoji emoji) {
    this.emoji = emoji;
  }

  public Emoji getEmoji() {
    return emoji;
  }

  public void setEmoji(Emoji emoji) {
    this.emoji = emoji;
  }
}
