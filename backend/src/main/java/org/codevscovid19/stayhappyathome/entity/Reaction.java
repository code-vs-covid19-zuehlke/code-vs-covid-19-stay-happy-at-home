package org.codevscovid19.stayhappyathome.entity;

public class Reaction {
	private Integer id;

	private Reaction() {
		// for Jackson
	}

	public Reaction(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}
}
