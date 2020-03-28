package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "USERS")
public class User {
    @Id
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany
    private Set<Feeling> feelings;

    private User() {
        // for Jackson
    }

    public User(String id, String name) {
        this.id = id;
        this.name = name;
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
}
