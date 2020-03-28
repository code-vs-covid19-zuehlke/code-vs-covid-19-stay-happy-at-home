package org.codevscovid19.stayhappyathome.dto;

public class ReplyReactionDto {
  private Long id;
  private String userId;

  private ReplyReactionDto() {
    // for Jackson
  }

  public ReplyReactionDto(Long id, String userId) {
    this.id = id;
    this.userId = userId;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }
}
