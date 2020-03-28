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
public class ReplyReaction {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne
	private Reply reply;
	@ManyToOne
	private User user;

	private ReplyReaction() {
		// for Jackson
	}

	public ReplyReaction(Reply reply, User user) {
		this.reply = reply;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
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
		ReplyReaction that = (ReplyReaction) o;
		return Objects.equals(id, that.id) &&
				Objects.equals(reply, that.reply) &&
				Objects.equals(user, that.user);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, reply, user);
	}
}
