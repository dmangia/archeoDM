package com.archeodm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.archeodm.model.Posts;
import com.archeodm.model.Users;
import com.archeodm.repository.PostsDao;

@Controller
public class BO_Controller {

	@Autowired
	PostsDao service;

	@RequestMapping(value = { "/cmsmain" }, method = RequestMethod.GET)
	public ModelAndView mydefaultPage() {

		ModelAndView model = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			String utente = userDetail.getUsername();
			model.addObject("articoli", service.getByUser(utente));

		}

		model.addObject("title", "CMS ArcheoDM");
		model.setViewName("/BO/cms_main");
		return model;

	}

	@RequestMapping(value = "/addPost", method = RequestMethod.GET)
	public String addPost(ModelMap model) {

		model.addAttribute("title", "CMS ArcheoDM");
		return "BO/addPost";

	}

	@RequestMapping(value = "/addPost", method = RequestMethod.POST)
	public ModelAndView saveRegistration(
			@Valid @ModelAttribute("newpost") Posts post, BindingResult result,
			@RequestParam("user_id") String user_id, ModelMap model) {

		if (result.hasErrors()) {

			return new ModelAndView("BO/addPost"); // ricarica il form
		}
		
		Users utente = new Users();
		utente.setUsername(user_id);
		post.setUsers(utente);
		Integer id = service.insertRow(post);
		System.out.println("Inserito un nuovo post, id=" + id);
		return new ModelAndView("redirect:/cmsmain", "msg",
				"Articolo aggiunto correttamente!"); 
	}

	@RequestMapping(value = "/deletePost/{id}", method = RequestMethod.GET)
	public String deletePost(@PathVariable Integer id, ModelMap model) {

		service.deleteRow(id);
		System.out.println("Cancellato un post, id=" + id);
		model.addAttribute("msg", "Articolo cancellato correttamente!");
		return "redirect:/cmsmain"; // vai all'url cmsmain
	}

	@RequestMapping(value = "/editPost/{id}", method = RequestMethod.GET)
	public String modifyPost(@PathVariable Integer id, ModelMap model) {

		Posts articolo = service.getPostDetail(id);

		model.addAttribute("title", "CMS ArcheoDM");
		model.addAttribute("id", id);
		model.addAttribute("username", getUsername());
		model.addAttribute("modpost", articolo);
		return "BO/editPost";
	}

	@RequestMapping("update")
	public String updatePost(@Valid @ModelAttribute("modpost") Posts post,
			BindingResult result, @RequestParam("user_id") String user_id,
			ModelMap model) {

		if (result.hasErrors()) {

			return "BO/editPost"; // ricarica il form
		}
		Users utente = new Users();
		utente.setUsername(user_id);
		post.setUsers(utente);
		model.addAttribute("title", "CMS ArcheoDM");
		service.updateRow(post);
		return "redirect:cmsmain";
	}

	@RequestMapping("viewPost/{id}")
	public String viewPost(@PathVariable Integer id, ModelMap model) {
		model.addAttribute("title", "CMS ArcheoDM >");
        model.addAttribute("articolo",service.getPostDetail(id));
		return "BO/viewPost";
	}

	
	
	
	
	
	@ModelAttribute("categories")
	public List<String> initializecategorie() {

		List<String> categorie = new ArrayList<String>();
		categorie.add("egitto");
		categorie.add("grecia");
		categorie.add("news");
		return categorie;
	}

	@ModelAttribute("username")
	public String getUsername() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();

			String utente = userDetail.getUsername();
			return utente;

		} else
			return "";
	}

}
