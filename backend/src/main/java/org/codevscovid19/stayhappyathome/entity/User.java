package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "USERS")
public class User {
    @Id
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany(cascade = CascadeType.ALL)
    private List<FeelingRecord> feelingRecords;

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

    public List<FeelingRecord> getFeelingRecords() {
        return feelingRecords;
    }

    public void setFeelingRecords(List<FeelingRecord> feelingRecord) {
        this.feelingRecords = feelingRecord;
    }

    public void addFeelings(FeelingRecord feelingRecord) {
        feelingRecords.add(feelingRecord);
    }
}
