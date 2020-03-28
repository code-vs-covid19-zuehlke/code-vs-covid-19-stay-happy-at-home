package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Objects;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Feeling feeling = (Feeling) o;
        return Objects.equals(id, feeling.id) &&
            emoji == feeling.emoji;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, emoji);
    }
}
