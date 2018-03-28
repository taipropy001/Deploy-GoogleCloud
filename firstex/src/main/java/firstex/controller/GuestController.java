package firstex.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import firstex.model.Account;
import firstex.model.Listpage;
import firstex.service.AccountService;
import firstex.service.ListpageService;
import firstex.service.WebpageService;

@Controller
public class GuestController {

	@Autowired
	private WebpageService webpageService;

	@Autowired
	private ListpageService listpageService;
	
	@Autowired
	private AccountService accountService;
	
	
	@GetMapping("/")
	public String home(HttpServletRequest request){
		
		request.setAttribute("slidelist", listpageService.findTime());
		request.setAttribute("webpage", webpageService.findWebpage(1));
		request.setAttribute("mode", "MODE_HOME");
		return "guest";
	}
	
	@GetMapping("/login")
	public String login(HttpServletRequest request){	
		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("user") != null)
		{
			request.setAttribute("mode", "MODE_MAIN");
			return "admin";
		}
		
		request.setAttribute("mode", "MODE_LOG");
		return "guest";
	}
	
	@GetMapping("/check-login")
	public String checklg(@ModelAttribute Account account, HttpServletRequest request){		
		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("user") != null)
		{
			request.setAttribute("mode", "MODE_MAIN");
			return "admin";
		}
		
		request.setAttribute("mode", "MODE_LOG");
		return "guest";
	}
	
	@PostMapping("/check-login")
	public String check(@ModelAttribute Account account, HttpServletRequest request){
		
		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("user") != null)
		{
			request.setAttribute("mode", "MODE_MAIN");
			return "admin";
		}
		
		Account check = accountService.findAccount(account.getIdu());
			
		if (check == null){
			request.setAttribute("err", "ERR_USER");
			request.setAttribute("acc", account);
			request.setAttribute("mode", "MODE_LOG");
			return "guest";
		}
		
		if (check.getPass().compareTo(account.getPass()) != 0){
			request.setAttribute("err", "ERR_PASS");
			request.setAttribute("acc", account);
			request.setAttribute("mode", "MODE_LOG");
			return "guest";
		}

		session.setAttribute("user", check);
		request.setAttribute("mode", "MODE_MAIN");
		return "admin";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request){	
		HttpSession session = request.getSession(false);
		if ( session != null){
			session.invalidate();
		}
		request.setAttribute("mode", "MODE_LOG");
		return "guest";
	}
	@GetMapping("/about")
	public String about(@RequestParam int id,HttpServletRequest request){
		request.setAttribute("webpage", webpageService.findWebpage(id));
		request.setAttribute("mode", "MODE_VIEW");
		return "guest";
	}
	

	@GetMapping("/listdata")
	public String listdata(@RequestParam int type, HttpServletRequest request){
		request.setAttribute("ldocument", listpageService.findAll());
		request.setAttribute("type", type);
		request.setAttribute("mode", "MODE_LIST");
		return "guest";
	}
	
	@GetMapping("/content")
	public String content(@RequestParam int id,@RequestParam int type, HttpServletRequest request){
		request.setAttribute("contentPage", listpageService.findListpage(id));
		request.setAttribute("tp", type);
		request.setAttribute("mode", "MODE_CONT");
		return "guest";
	}

}
