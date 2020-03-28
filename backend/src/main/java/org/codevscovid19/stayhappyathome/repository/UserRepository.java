package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends CrudRepository<User, String> {
    List<User> findAll();

    Optional<User> findByName(String name);
}
