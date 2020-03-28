package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FEELINGS")
public class Feeling {
    @Id
    private Long id;

    private Feeling() {
        // for Jackson
    }

    public Feeling(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
