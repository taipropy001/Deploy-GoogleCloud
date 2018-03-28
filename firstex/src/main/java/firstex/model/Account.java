package firstex.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="t_users")
public class Account implements Serializable{

	@Id
	private String idu;
	private String pass;
	
	public Account(){}
	
	public Account(String idu, String pass) {
		super();
		this.idu = idu;
		this.pass = pass;
	}
	
	public String getIdu() {
		return idu;
	}
	
	public void setIdu(String idu) {
		this.idu = idu;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public String toString() {
		return "Account [idu=" + idu + ", pass=" + pass + "]";
	}
	
}
