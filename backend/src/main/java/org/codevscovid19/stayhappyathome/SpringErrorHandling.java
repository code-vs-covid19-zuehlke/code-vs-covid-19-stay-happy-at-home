package org.codevscovid19.stayhappyathome;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class SpringErrorHandling {
  private static final Logger logger = LoggerFactory.getLogger(SpringErrorHandling.class);

  @ExceptionHandler(Exception.class)
  public ResponseEntity<Void> handleCallFailure(Exception e) {
    logger.error("An error occurred!", e);
    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
  }
}
