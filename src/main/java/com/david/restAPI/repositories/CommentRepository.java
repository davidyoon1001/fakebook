package com.david.restAPI.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.david.restAPI.models.Comment;

@Repository
public interface CommentRepository extends CrudRepository<Comment, Long>{
	List<Comment> findAll();
	
	List<Comment> findByContextContaining(String search);
	
	Long countByContextContaining(String search);
	
	Long deleteByContextStartingWith(String search);
	
	void delete(Comment comment);
}
