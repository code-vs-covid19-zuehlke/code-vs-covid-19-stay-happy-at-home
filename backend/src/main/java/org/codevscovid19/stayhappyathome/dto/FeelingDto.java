package org.codevscovid19.stayhappyathome.dto;

import org.codevscovid19.stayhappyathome.entity.Emoji;

public class FeelingDto {
	private Long id;
	private Emoji emoji;

	private FeelingDto() {
		// for Jackson
	}

	public FeelingDto(Long id, Emoji emoji) {
		this.id = id;
		this.emoji = emoji;
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
