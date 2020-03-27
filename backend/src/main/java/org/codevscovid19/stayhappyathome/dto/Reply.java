package org.codevscovid19.stayhappyathome.dto;

public class Reply {
	private Integer id;

	private Reply() {
		// for Jackson
	}

	public Reply(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}
}
