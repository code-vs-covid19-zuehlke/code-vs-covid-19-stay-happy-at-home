package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "USERS")
public class User {
    @Id
    private String name;

    public User() {
        // for Jackson
    }

    public User(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
