package org.codevscovid19.stayhappyathome.repository;

import org.codevscovid19.stayhappyathome.entity.Post;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepository extends CrudRepository<Post, Long> {
	List<Post> getAll();
}
