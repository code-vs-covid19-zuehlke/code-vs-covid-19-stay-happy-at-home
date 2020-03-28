package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "FEELINGS")
public class Feeling {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Column
    private Emoji emoji;

    private Feeling() {
        // for Jackson
    }

    public Feeling(Emoji emoji) {
        this.emoji = emoji;
    }

    public Long getId() {
        return id;
    }

    public Emoji getEmoji() {
        return emoji;
    }

    public void setEmoji(Emoji emoji) {
        this.emoji = emoji;
    }
}
