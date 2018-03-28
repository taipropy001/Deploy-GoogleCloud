package firstex.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name="t_news")
public class Listpage implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idn;
	private int type;
	private String title;
	private String image;
	private String content;
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	
	public Listpage(){}

	public Listpage(int type, String title, String image, String content, Date dateCreated) {
		super();
		this.type = type;
		this.title = title;
		this.image = image;
		this.content = content;
		this.dateCreated = dateCreated;
	}

	public int getIdn() {
		return idn;
	}

	public void setIdn(int idn) {
		this.idn = idn;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	
	
	@Override
	public String toString() {
		return "Listpage [idn=" + idn + ", type=" + type + ", title=" + title + ", image=" + image + ", content="
				+ content + ", dateCreated=" + dateCreated + "]";
	}
	
}
