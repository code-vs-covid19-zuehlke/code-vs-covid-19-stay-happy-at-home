package org.codevscovid19.stayhappyathome.entity;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import static org.codevscovid19.stayhappyathome.entity.Emoji.*;
import static org.codevscovid19.stayhappyathome.entity.Emotion.*;

public class FeelingMatcherMap {
  private static Map<Emoji, Set<Emotion>> emotionToEmotionMatrix = new HashMap<>() {
    {
      put(THINKING_FACE, Set.of(HAPPY, INFORMED, INSPIRED));
      put(GRINNING_FACE_WITH_SMILING_EYES, Set.of(Emotion.values()));
      put(SMILING_FACE_WITH_HEART_EYES, Set.of(HAPPY, RELAXED, AWWW, INSPIRED, ENTERTAINED));
      put(HEAR_NO_EVIL_MONKEY, Set.of(HAPPY, RELAXED, ACCOMPLISHED, ENERGIZED, AWWW, INSPIRED));
      put(YAWNING_FACE, Set.of(Emotion.values()));
      put(DROOLING_FACE, Set.of(HAPPY, ACCOMPLISHED, INSPIRED, ENTERTAINED));
      put(LOUDLY_CRYING_FACE, Set.of(HAPPY, RELAXED, ACCOMPLISHED, ENERGIZED, AWWW, INSPIRED));
      put(SLEEPING_FACE, Set.of(HAPPY, RELAXED, INFORMED, AWWW, ENTERTAINED));
      put(UNAMUSED_FACE, Set.of(Emotion.values()));
      put(FACE_WITH_TEARS_OF_JOY, Set.of(HAPPY, RELAXED, ACCOMPLISHED, ENERGIZED, AWWW, INSPIRED, ENTERTAINED));
      put(DOWNCAST_FACE_WITH_SWEAT, Set.of(HAPPY, RELAXED, AWWW, INSPIRED));
      put(POUTING_FACE, Set.of(HAPPY, RELAXED, AWWW, INSPIRED, ENTERTAINED));
      put(PILE_OF_POO, Set.of(HAPPY, RELAXED, ACCOMPLISHED, ENERGIZED, AWWW, INSPIRED, ENTERTAINED));
      put(NERD_FACE, Set.of(ACCOMPLISHED, INFORMED, ENTERTAINED));
      put(FACE_WITH_MEDICAL_MASK, Set.of(Emotion.values()));
      put(FACE_SCREAMING_IN_FEAR, Set.of(HAPPY, RELAXED, AWWW, ENTERTAINED));
      put(PANDA, Set.of(Emotion.values()));
      put(PERSON_IN_LOTUS_POSITION, Set.of(HAPPY, RELAXED, AWWW, INSPIRED));
      put(PERSON_LIFTING_WEIGHTS, Set.of(ACCOMPLISHED, ENERGIZED, INSPIRED));
      put(EXPLODING_HEAD, Set.of(RELAXED, AWWW));
    }
  };

  public static Map<Emoji, Set<Emotion>> getEmotionToEmotionMatrix() {
    return emotionToEmotionMatrix;
  }
}
