package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "REPLYS")
public class Reply {
	@Id
	private Long id;

	private Reply() {
		// for Jackson
	}

	public Reply(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}
}
