package entity;

public class means {
	private int meansID;
	private int articleID;
	private String meansName;
	private String meansType;
	private String meansURL;
	public int getMeansID() {
		return meansID;
	}
	public void setMeansID(int meansID) {
		this.meansID = meansID;
	}
	public int getArticleID() {
		return articleID;
	}
	public void setArticleID(int articleID) {
		this.articleID = articleID;
	}
	public String getMeansName() {
		return meansName;
	}
	public void setMeansName(String meansName) {
		this.meansName = meansName;
	}
	public String getMeansType() {
		return meansType;
	}
	public void setMeansType(String meansType) {
		this.meansType = meansType;
	}
	public String getMeansURL() {
		return meansURL;
	}
	public void setMeansURL(String meansURL) {
		this.meansURL = meansURL;
	}
	@Override
	public String toString() {
		return "means [meansID=" + meansID + ", articleID=" + articleID + ", meansName=" + meansName + ", meansType="
				+ meansType + ", meansURL=" + meansURL + "]";
	}
	
	
}
