package org.codevscovid19.stayhappyathome.entity;

import javax.persistence.*;

@Entity
@Table(name = "TARGET_FEELINGS")
public class TargetFeeling {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;

  @ManyToOne(cascade = CascadeType.ALL)
  private Post post;

  @Column
  private Emotion emotion;

  public TargetFeeling() {
//for Jackson
  }

  public TargetFeeling(Post post, Emotion emotion) {
    this.post = post;
    this.emotion = emotion;
  }

  public Post getPost() {
    return post;
  }

  public void setPost(Post post) {
    this.post = post;
  }

  public Emotion getEmotion() {
    return emotion;
  }

  public void setEmotion(Emotion emotion) {
    this.emotion = emotion;
  }
}
