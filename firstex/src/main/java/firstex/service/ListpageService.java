package firstex.service;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import firstex.dao.ListpageRepository;
import firstex.model.Listpage;


@Service
@Transactional
public class ListpageService {

	private final ListpageRepository listpageRepository;

	public ListpageService(ListpageRepository listpageRepository) {
		this.listpageRepository = listpageRepository;
	}
	
	public List<Listpage> findAll(){
		List<Listpage> listpages = new ArrayList<>();
		for(Listpage listpage : listpageRepository.findAll()){
			listpages.add(listpage);
		}
		
		return listpages;
	}
	

	
	public List<Listpage> findTime(){
		List<Listpage> listpages = new ArrayList<>();

		int i = 0;
		
		for(Listpage listpage : listpageRepository.findAll()){
			if (i < 4){
				listpages.add(listpage);
				i++;
			}
			else {
				listpages.add(listpage);
				listpages.remove(0);
			}		
		}
		return listpages;
	}
	
	
	public Listpage findListpage(int idn){
		return listpageRepository.findOne(idn);
	}
	
	public void save(Listpage listpage) {
		listpageRepository.save(listpage);
	}
	
	public void delete(int idn) {
		listpageRepository.delete(idn);
	}

}
