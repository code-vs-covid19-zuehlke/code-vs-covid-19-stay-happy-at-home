package org.codevscovid19.stayhappyathome.dto;

public class PostReactionDto {
	private Long id;
	private String userId;

	private PostReactionDto() {
		// for Jackson
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
