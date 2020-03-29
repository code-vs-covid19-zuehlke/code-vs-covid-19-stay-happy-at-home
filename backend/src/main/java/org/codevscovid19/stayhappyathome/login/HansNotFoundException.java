package org.codevscovid19.stayhappyathome.login;

public class HansNotFoundException extends RuntimeException {
  public HansNotFoundException(String entityName, Object id) {
    super(String.format("Could not find %s with id %s. Hans is sad :-(", entityName, id.toString()));
  }
}
