package firstex.dao;

import org.springframework.data.repository.CrudRepository;

import firstex.model.Webpage;

public interface WebpageRepository extends CrudRepository<Webpage, Integer> {

}
