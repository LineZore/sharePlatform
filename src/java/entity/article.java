package entity;

import java.util.Date;

public class article {
	private int articleID;
	private int userID;
	private String articleTitle;
	private String articleContent;
	private java.sql.Date publishTime;
	private String checkStatus;
	private float articlePrice;
	private String userName;
	
	public java.sql.Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(java.sql.Date publishTime) {
		this.publishTime = publishTime;
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
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public String getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}
	public float getArticlePrice() {
		return articlePrice;
	}
	public void setArticlePrice(float articlePrice) {
		this.articlePrice = articlePrice;
	}
	@Override
	public String toString() {
		return "article [articleID=" + articleID + ", userID=" + userID + ", articleTitle=" + articleTitle
				+ ", articleContent=" + articleContent + ", publishTime=" + publishTime + ", checkStatus=" + checkStatus
				+ ", articlePrice=" + articlePrice + ", userName=" + userName + "]";
	}
	
	
}
