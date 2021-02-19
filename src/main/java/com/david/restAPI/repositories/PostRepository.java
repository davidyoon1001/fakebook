package com.david.restAPI.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.david.restAPI.models.Post;

@Repository
public interface PostRepository extends CrudRepository<Post, Long>{
	List<Post> findAll();
	
	List<Post> findByTitleContaining(String search);
	
	Long countByTitleContaining(String search);
	
	Long deleteByTitleStartingWith(String search);
	
	void delete(Post post);
}
