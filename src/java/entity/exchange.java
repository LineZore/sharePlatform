package entity;

public class exchange {
	private int exchangeID;
	private int userID;
	private String userName;
	private int articleID;
	
	
	public int getExchangeID() {
		return exchangeID;
	}
	public void setExchangeID(int exchangeID) {
		this.exchangeID = exchangeID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getArticleID() {
		return articleID;
	}
	public void setArticleID(int articleID) {
		this.articleID = articleID;
	}
	@Override
	public String toString() {
		return "exchange [exchangeID=" + exchangeID + ", userID=" + userID + ", userName=" + userName + ", articleID="
				+ articleID + "]";
	}
	
}
