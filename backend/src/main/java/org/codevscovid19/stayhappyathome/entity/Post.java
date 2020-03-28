package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "POSTS")
public class Post {
	@Id
	private Long id;

	private Post() {
		// for Jackson
	}

	public Post(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}
}
