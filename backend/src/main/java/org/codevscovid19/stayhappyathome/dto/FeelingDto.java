package org.codevscovid19.stayhappyathome.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

public class FeelingDto {
	private Long id;

	private FeelingDto() {
		// for Jackson
	}

	public FeelingDto(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}
}
