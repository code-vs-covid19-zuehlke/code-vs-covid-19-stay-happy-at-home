package org.codevscovid19.stayhappyathome.dto;

import org.codevscovid19.stayhappyathome.entity.Emoji;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

public class ReactionSummaryDto {

  private Map<Emoji, AtomicInteger> reactions = new HashMap<>();

  public ReactionSummaryDto() {

  }

  public void addReaction(Emoji emoji) {
    AtomicInteger atomicInteger = reactions.computeIfAbsent(emoji, (blub) -> new AtomicInteger(0));
    atomicInteger.incrementAndGet();
  }

  public Map<Emoji, AtomicInteger> getReactions() {
    return reactions;
  }

  @Override
  public String toString() {
    return "ReactionSummaryDto{" +
      "reactions=" + reactions +
      '}';
  }
}
