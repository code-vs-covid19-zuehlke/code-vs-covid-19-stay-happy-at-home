package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "REACTIONS")
public class Reaction {
	@Id
	private Long id;

	private Reaction() {
		// for Jackson
	}

	public Reaction(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}
}
