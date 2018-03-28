package firstex.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import firstex.model.Listpage;
import firstex.model.Webpage;
import firstex.service.AccountService;
import firstex.service.ListpageService;
import firstex.service.WebpageService;

@Controller
public class AdminColtroller {

	@Autowired
	private ListpageService listpageService;
	
	@Autowired
	private AccountService accountService;
	
	@GetMapping("/admin-home")
	public String home(HttpServletRequest request){
		
		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("user") == null)
		{
			request.setAttribute("mode", "MODE_LOG");
			return "guest";
		}
		
		request.setAttribute("mode", "MODE_MAIN");
		return "admin";
	}
	
	@GetMapping("/admin-all")
	public String view(@RequestParam int type, HttpServletRequest request){

		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("user") == null)
		{
			request.setAttribute("mode", "MODE_LOG");
			return "guest";
		}
		
		request.setAttribute("views", listpageService.findAll());
		request.setAttribute("tp", type);
		request.setAttribute("mode", "MODE_VIEW");
		return "admin";
	}
	
	
	@PostMapping("/admin-save")
	public String saveNews(@ModelAttribute Listpage view, BindingResult bindingResult, 
			@RequestParam int type,HttpServletRequest request){

		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("user") == null)
		{
			request.setAttribute("mode", "MODE_LOG");
			return "guest";
		}
		
		view.setDateCreated(new Date());
		view.setType(type);
		listpageService.save(view);
		request.setAttribute("views", listpageService.findAll());
		request.setAttribute("tp", type);
		request.setAttribute("mode", "MODE_VIEW");
		return "admin";
	}
	
	@GetMapping("/admin-new")
	public String newNew(HttpServletRequest request, @RequestParam int type){

		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("user") == null)
		{
			request.setAttribute("mode", "MODE_LOG");
			return "guest";
		}
		
		request.setAttribute("mode", "MODE_NEW");
		request.setAttribute("tp", type);
		return "admin";
	}

	@GetMapping("/admin-update")
	public String updateNew(@RequestParam int id,@RequestParam int type,HttpServletRequest request){

		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("user") == null)
		{
			request.setAttribute("mode", "MODE_LOG");
			return "guest";
		}
		
		request.setAttribute("view", listpageService.findListpage(id));
		request.setAttribute("tp", type);
		request.setAttribute("mode", "MODE_UPDATE");
		return "admin";
	}
	
	@GetMapping("/admin-delete")
	public String deleteNew(@RequestParam int id,@RequestParam int type, HttpServletRequest request){

		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("user") == null)
		{
			request.setAttribute("mode", "MODE_LOG");
			return "guest";
		}
		
		listpageService.delete(id);
		request.setAttribute("views", listpageService.findAll());
		request.setAttribute("tp", type);
		request.setAttribute("mode", "MODE_VIEW");
		return "admin";
	}
	
	@Autowired
	private WebpageService webpageService;
	
	@GetMapping("/admin-webpage")
	public String about(@RequestParam int id,HttpServletRequest request){

		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("user") == null)
		{
			request.setAttribute("mode", "MODE_LOG");
			return "guest";
		}
		
		request.setAttribute("webpage", webpageService.findWebpage(id));
		request.setAttribute("mode", "MODE_CONT");
		return "admin";
	}
	
	@PostMapping("/admin-change")
	public String saveNews(@ModelAttribute Webpage webpage,
			@RequestParam int id,HttpServletRequest request){	

		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("user") == null)
		{
			request.setAttribute("mode", "MODE_LOG");
			return "guest";
		}
		
		webpage.setIdw(id);
		webpageService.save(webpage);
		request.setAttribute("webpage", webpageService.findWebpage(id));
		request.setAttribute("mode", "MODE_CONT");
		return "admin";
	}

}
