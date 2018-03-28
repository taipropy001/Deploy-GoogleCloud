package firstex.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import firstex.dao.WebpageRepository;
import firstex.model.Webpage;

@Service
@Transactional
public class WebpageService {

	private final WebpageRepository webpageRepository;

	public WebpageService(WebpageRepository webpageRepository) {	
		this.webpageRepository = webpageRepository;
	}
	
	public List<Webpage> findAll(){
		List<Webpage> webpages = new ArrayList<>();
		for(Webpage webpage : webpageRepository.findAll()){
			webpages.add(webpage);
		}
		return webpages;
	}
	
	public Webpage findWebpage(int id){
		return webpageRepository.findOne(id);
	}
	
	public void save(Webpage webpage) {
		webpageRepository.save(webpage);
	}
	
	public void delete(int idw) {
		webpageRepository.delete(idw);
	}
}
