package firstex.dao;

import org.springframework.data.repository.CrudRepository;

import firstex.model.Account;

public interface AccountRepository extends CrudRepository<Account, String>{
	
}
