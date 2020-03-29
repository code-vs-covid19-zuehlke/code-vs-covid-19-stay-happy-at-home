package org.codevscovid19.stayhappyathome.entity;

import java.util.Set;

public enum Emotion {
  HAPPY, RELAXED, ACCOMPLISHED, INFORMED, ENERGIZED, AWWW, INSPIRED, ENTERTAINED;

  public static Set<Emotion> getAll() {
    return Set.of(HAPPY, RELAXED, ACCOMPLISHED, INFORMED, ENERGIZED, AWWW, INSPIRED, ENTERTAINED);
  }
}
