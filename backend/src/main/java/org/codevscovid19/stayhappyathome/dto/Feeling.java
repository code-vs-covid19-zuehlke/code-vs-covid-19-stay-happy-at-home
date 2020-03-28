package org.codevscovid19.stayhappyathome.dto;

public class Feeling {
    private Integer id;

    private Feeling() {
        // for Jackson
    }

    public Feeling(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }
}
