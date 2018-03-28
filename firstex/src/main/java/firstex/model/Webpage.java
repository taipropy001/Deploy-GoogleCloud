package firstex.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="t_webpages")
public class Webpage implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idw;
	private String webcontent;

	public Webpage(){}
	
	public Webpage(String webcontent) {
		super();
		this.webcontent = webcontent;
	}
	
	public int getIdw() {
		return idw;
	}
	public void setIdw(int idw) {
		this.idw = idw;
	}
	public String getWebcontent() {
		return webcontent;
	}
	public void setWebcontent(String webcontent) {
		this.webcontent = webcontent;
	}

	@Override
	public String toString() {
		return "Webpage [idw=" + idw + ", webcontent=" + webcontent + "]";
	}

}
