package org.codevscovid19.stayhappyathome.dto;

import org.codevscovid19.stayhappyathome.entity.Emoji;

public class PostReactionDto {
  private Emoji emoji;

  private PostReactionDto() {
    // for Jackson
  }

  public PostReactionDto(Emoji emoji) {
    this.emoji = emoji;
  }

  public Emoji getEmoji() {
    return emoji;
  }

  public void setEmoji(Emoji emoji) {
    this.emoji = emoji;
  }
}
