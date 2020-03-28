package org.codevscovid19.stayhappyathome.entity;

public enum Emoji {
  THINKING_FACE("U+1F914"),
  GRINNING_FACE_WITH_SMILING_EYES("U+1F604"),
  SMILING_FACE_WITH_HEART_EYES("U+1F60D"),
  HEAR_NO_EVIL_MONKEY("U+1F649"),
  UNAMUSED_FACE("U+1F612"),
  DROOLING_FACE("U+1F924"),
  LOUDLY_CRYING_FACE("U+1F62D"),
  SLEEPING_FACE("U+1F634"),
  YAWNING_FACE("U+1F971"),
  FACE_WITH_TEARS_OF_JOY("U+1F602"),
  DOWNCAST_FACE_WITH_SWEAT("U+1F613"),
  POUTING_FACE("U+1F621"),
  PILE_OF_POO("U+1F4A9"),
  NERD_FACE("U+1F913"),
  FACE_WITH_MEDICAL_MASK("U+1F637"),
  FACE_SCREAMING_IN_FEAR("U+1F631"),
  PANDA("U+1F43C"),
  PERSON_IN_LOTUS_POSITION("U+1F9D8"),
  PERSON_LIFTING_WEIGHTS("U+1F3CB"),
  EXPLODING_HEAD("U+1F92F");

  private String unicode;

  Emoji(String unicode) {
    this.unicode = unicode;
  }

  public String getUnicode() {
    return unicode;
  }

  @Override
  public String toString() {
    return "Emoji{" +
      "unicode='" + unicode + '\'' +
      '}';
  }
}
