package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import java.util.Arrays;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "USERS")
public class User {
	@Id
	private String id;

	@Column(name = "name")
	private String name;

	private byte[] photo;

	@OneToMany
	private Set<Feeling> feelings;

	private User() {
		// for Jackson
	}

	public User(String id, String name, byte[] photo) {
		this.id = id;
		this.name = name;
		this.photo = photo;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public Set<Feeling> getFeelings() {
		return feelings;
	}

	public void addFeeling(Feeling feeling) {
		this.feelings.add(feeling);
	}

	public byte[] getPhoto() {
		return photo;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		User user = (User) o;
		return Objects.equals(id, user.id) &&
				Objects.equals(name, user.name) &&
				Arrays.equals(photo, user.photo);
	}

	@Override
	public int hashCode() {
		int result = Objects.hash(id, name);
		result = 31 * result + Arrays.hashCode(photo);
		return result;
	}
}
