package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User, String> {
}
