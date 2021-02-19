package com.david.restAPI.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.david.restAPI.models.Post;
import com.david.restAPI.repositories.PostRepository;

@Service
public class PostService {
	private final PostRepository postRepository;
	
	public PostService(PostRepository postRepository) {
		this.postRepository = postRepository;
	}
	
	public List<Post> allPosts(){
		return postRepository.findAll();
	}
	
	public Post createPost(Post post) {
		return postRepository.save(post);
	}
	
	public Post findPost(Long id) {
		Optional<Post> optionalPost = postRepository.findById(id);
		if(optionalPost.isPresent()) {
			return optionalPost.get();
		}else {
			return null;
		}
	}
	
	public Post updatePost(Post post) {
		return postRepository.save(post);
	}
	
	public void deletePost(Post post) {
		postRepository.delete(post); 
	}

	public void deleteAll(List<Post> posts) {
		// TODO Auto-generated method stub
		postRepository.deleteAll(posts);
	}
	public void delete(Post post) {
		postRepository.delete(post);
	}
}
