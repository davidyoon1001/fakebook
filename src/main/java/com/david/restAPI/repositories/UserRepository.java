package com.david.restAPI.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.david.restAPI.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	List<User> findAll();
	
	List<User> findByNameContaining(String search);
	
	Long countByNameContaining(String search);
	
	Long deleteByNameStartingWith(String search);
	
	
	void delete(User user);
}
