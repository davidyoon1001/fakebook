package com.david.restAPI.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.david.restAPI.models.Post;
//import com.david.restAPI.models.Post;
import com.david.restAPI.models.User;
import com.david.restAPI.services.PostService;
import com.david.restAPI.services.UserService;

@Controller
public class UserController {
	private final UserService userService;
	private final PostService postService;
	public UserController(UserService userService, PostService postService ) {
		this.userService = userService;
		this.postService = postService;
	}
	
	@RequestMapping("/")
	public String domain(@ModelAttribute("user") User user) {
		return "domain.jsp";
	}
	
	@RequestMapping("/main")
	public String main(Model model, HttpSession session) {
		List<User> users = userService.allUsers();
		List<Post> posts = postService.allPosts();
		model.addAttribute("users", users);
		model.addAttribute("posts", posts);
		return "main.jsp";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String create(@ModelAttribute(value="user") User user, HttpSession session ) {
		User usr = userService.createUser(user);
		session.setAttribute("loginUser", usr);
		return "redirect:/main";
	}
	
	
	@RequestMapping("/users/{id}/edit")
	public String editUser(@PathVariable("id") Long id, Model model) {
		User user = userService.findUser(id);
		model.addAttribute("user", user);
		return "editUser.jsp";
	}
	
	@RequestMapping(value="/users/{id}/update", method=RequestMethod.PUT)
	public String updateUser(@ModelAttribute("user") User user) {
		userService.updateUser(user);
		return "redirect:/main";
	}
	
	@RequestMapping(value="users/{id}/delete", method=RequestMethod.DELETE)
	public String deleteUser(@PathVariable("id") Long id) {
		User user = userService.findUser(id);
		userService.deleteUser(user);
		return "redirect:/main";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/users/{id}/post")
	public String userPost(@ModelAttribute("post") Post post, Model model) {
		
		return "userPost.jsp";
	}
	
	@RequestMapping(value="/post", method=RequestMethod.POST)
	public String create(@ModelAttribute(value="post") Post post, HttpSession session ) {
		postService.createPost(post);
		
		return "redirect:/main";
	}
	
	@RequestMapping("/users/{id}/posts")
	public String userposts(@PathVariable("id") Long id, Model model) {
		User user = userService.findUser(id);
		model.addAttribute("user", user);
		model.addAttribute("posts", user.getPosts());
		return "userPostList.jsp";
	}
	
	@RequestMapping(value="posts/{id}/delete", method=RequestMethod.DELETE)
	public String deletePost(@PathVariable("id") Long id) {
		Post post = postService.findPost(id);
		postService.deletePost(post);
		return "redirect:/main";
	}
	
//	@RequestMapping(value="posts/{id}/post")
//	public String viewPost(@PathVariable("id") Long id, Model model,@ModelAttribute(value="comment" Comment comment)) {
//		Post post = postService.findPost(id);
//		model.addAttribute("post", post);
//		return "viewPost.jsp";
//	}
}
