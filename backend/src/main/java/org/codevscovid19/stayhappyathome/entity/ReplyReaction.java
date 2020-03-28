package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "REACTIONS")
public class ReplyReaction {
	@Id
	private Long id;


	private ReplyReaction() {
		// for Jackson
	}

}
