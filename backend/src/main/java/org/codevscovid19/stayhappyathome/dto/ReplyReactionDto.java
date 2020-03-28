package org.codevscovid19.stayhappyathome.dto;

public class ReplyReactionDto {
  private Long id;

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
}
