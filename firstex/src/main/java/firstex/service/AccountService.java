package firstex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import firstex.dao.AccountRepository;
import firstex.model.Account;


@Service
@Transactional
public class AccountService {

	private final AccountRepository accountRepository;
	
	public AccountService(AccountRepository accountRepository) {
		this.accountRepository = accountRepository;
	}

	public Account findAccount(String idu){
		return accountRepository.findOne(idu);
	}

}
