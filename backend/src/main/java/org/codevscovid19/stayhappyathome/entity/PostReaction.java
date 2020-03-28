package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import java.util.Objects;

@Entity
@Table(name = "REACTIONS")
public class PostReaction {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne
	private Post post;
	@ManyToOne
	private User user;

	private PostReaction() {
		// for Jackson
	}

	public PostReaction(Post post, User user) {
		this.post = post;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		PostReaction that = (PostReaction) o;
		return Objects.equals(id, that.id) &&
				Objects.equals(post, that.post) &&
				Objects.equals(user, that.user);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, post, user);
	}
}
