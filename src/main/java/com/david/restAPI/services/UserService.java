package com.david.restAPI.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.david.restAPI.models.User;
import com.david.restAPI.repositories.UserRepository;

@Service
public class UserService {
	private final UserRepository userRepository;
	
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	public List<User> allUsers(){
		return userRepository.findAll();
	}
	
	public User createUser(User user) {
		return userRepository.save(user);
	}
	
	public User findUser(Long id) {
		Optional<User> optionalUser = userRepository.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}else {
			return null;
		}
	}
	
	public User updateUser(User user) {
		return userRepository.save(user);
	}
	
	public void deleteUser(User user) {
		userRepository.delete(user); 
	}
}
