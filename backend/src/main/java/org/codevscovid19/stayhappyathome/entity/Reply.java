package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import java.net.URL;
import java.util.Arrays;
import java.util.Objects;

@Entity
@Table(name = "REPLYS")
public class Reply {
	@Id
	private Long id;
	@Column(name = "title", nullable = false)
	private String title;
	@Column(name = "description", nullable = false)
	private String description;
	@Column(name = "link")
	private URL link;

	private byte[] picture;

	private Reply() {
		// for Jackson
	}

	public Reply(Long id, String title, String description, URL link, byte[] picture) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.link = link;
		this.picture = picture;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public URL getLink() {
		return link;
	}

	public void setLink(URL link) {
		this.link = link;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Reply reply = (Reply) o;
		return Objects.equals(id, reply.id) &&
				Objects.equals(title, reply.title) &&
				Objects.equals(description, reply.description) &&
				Objects.equals(link, reply.link) &&
				Arrays.equals(picture, reply.picture);
	}

	@Override
	public int hashCode() {
		int result = Objects.hash(id, title, description, link);
		result = 31 * result + Arrays.hashCode(picture);
		return result;
	}
}
