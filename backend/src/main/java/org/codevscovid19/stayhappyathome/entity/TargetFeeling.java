package org.codevscovid19.stayhappyathome.entity;

import java.util.Set;

public enum TargetFeeling {
  HAPPY, RELAXED, ACCOMPLISHED, INFORMED, ENERGIZED, AWWW, INSPIRED, ENTERTAINED;

  public static Set<TargetFeeling> getAll() {
    return Set.of(HAPPY, RELAXED, ACCOMPLISHED, INFORMED, ENERGIZED, AWWW, INSPIRED, ENTERTAINED);
  }
}
