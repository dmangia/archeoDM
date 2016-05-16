package com.archeodm.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
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
public class FO_Controller {
	
	@Autowired
	PostsDao service;

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();

		model.addObject("articoli",service.getByCategory("grecia"));
		model.addObject("title", "ArcheoDM");
		model.addObject("category", "La Magna Grecia in Sicilia");
		model.addObject("utente", getUsername());
		model.setViewName("home");
		return model;

	}
	
	@RequestMapping(value = "/dettaglio/{id}", method=RequestMethod.GET)
	public ModelAndView dettaglioArticolo(@PathVariable Integer id) {
		Posts articolo = service.getPostDetail(id);
	return new ModelAndView("FO/articoloDettaglio","articolo",articolo);
	}

	@RequestMapping(value = "/listaPost/{category}", method=RequestMethod.GET)
	public ModelAndView listaArticoli(@PathVariable String category) {
		
		ModelAndView model = new ModelAndView();
		
		model.addObject("articoli",service.getByCategory(category));
		//model.addObject("articoli",service.getByUser("alex"));
		model.addObject("title", "ArcheoDM");
		model.addObject("utente", getUsername());
		if(category.contains("grecia")) model.addObject("category", "La Magna Grecia in Sicilia");
		if(category.contains("egitto")) model.addObject("category", "Antico Egitto: storia e misteri");
		if(category.contains("news")) model.addObject("category", "Le ultime scoperte di archeologia");
		
		model.setViewName("home");
		return model;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully!");
			model.addObject("articoli",service.getByUser("alex"));
			model.addObject("title", "ArcheoDM");
			model.addObject("utente", null);
			model.addObject("category", "La Magna Grecia in Sicilia");
			model.setViewName("home");
			return model;
		}
		model.setViewName("FO/login");

		return model;

	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login?logout";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String newRegistration(ModelMap model) {
		Users utente = new Users();
		model.addAttribute("users", utente);
		return "FO/enroll";
	}


	@RequestMapping(value="/register",method = RequestMethod.POST)
	public String saveRegistration(@Valid @ModelAttribute("student")Users user,BindingResult result,ModelMap model) {

		if (result.hasErrors()) {
			
			return "FO/enroll";
		}
		
		model.addAttribute("success", "Dear " + user.getUsername()
				+ " , your Registration completed successfully");
		return "FO/success";
	}
	
	
	// ERROR PAGE: for 403 access denied page
		@RequestMapping(value = "/403", method = RequestMethod.GET)
		public ModelAndView accesssDenied(Principal user) {

			ModelAndView model = new ModelAndView();

			if (user != null) {
				model.addObject("accessmsg", "Mi spiace " + user.getName() 
				+ ", non hai il permesso di accedere a questa pagina!");
			} else {
				model.addObject("accessmsg", 
				"Non hai il permesso di accedere a questa pagina!");
			}

			model.setViewName("403");
			return model;

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
				return null;
		}
	
}
