package org.codevscovid19.stayhappyathome.entity;

public class Post {
	private Integer id;

	private Post() {
		// for Jackson
	}

	public Post(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}
}
