package org.codevscovid19.stayhappyathome.dto;

import org.codevscovid19.stayhappyathome.entity.Emoji;

public class PostReactionDto {
  private Long id;
  private Emoji emoji;

  private PostReactionDto() {
    // for Jackson
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Emoji getEmoji() {
    return emoji;
  }

  public void setEmoji(Emoji emoji) {
    this.emoji = emoji;
  }
}
