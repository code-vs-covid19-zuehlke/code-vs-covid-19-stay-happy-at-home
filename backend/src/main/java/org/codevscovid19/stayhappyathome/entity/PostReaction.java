package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "REACTIONS")
public class PostReaction {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;


	private PostReaction() {
		// for Jackson
	}

}
