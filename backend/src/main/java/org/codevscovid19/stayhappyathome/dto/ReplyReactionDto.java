package org.codevscovid19.stayhappyathome.dto;

import org.codevscovid19.stayhappyathome.entity.Emoji;

public class ReplyReactionDto {
  private Long id;
  private Emoji emoji;

  private ReplyReactionDto() {
    // for Jackson
  }

  public ReplyReactionDto(Long id) {
    this.id = id;
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
