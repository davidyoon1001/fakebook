package com.david.restAPI.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.david.restAPI.models.Comment;
import com.david.restAPI.repositories.CommentRepository;

@Service
public class CommentService {
	private final CommentRepository commentRepository;
	
	public CommentService(CommentRepository commentRepository) {
		this.commentRepository = commentRepository;
	}
	
	public List<Comment> allComments(){
		return commentRepository.findAll();
	}
	
	public Comment createComment(Comment comment) {
		return commentRepository.save(comment);
	}
	
	public Comment findComment(Long id) {
		Optional<Comment> optionalComment = commentRepository.findById(id);
		if(optionalComment.isPresent()) {
			return optionalComment.get();
		}else {
			return null;
		}
	}
	
	public Comment updateComment(Comment comment) {
		return commentRepository.save(comment);
	}
	
	public void deleteComment(Comment comment) {
		commentRepository.delete(comment); 
	}
}
