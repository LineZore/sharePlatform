package entity;

public class user {
	private int userID;
	private String userName;
	private String userPassword;
	private String userType;
	private String userEmail;
	private float userIntegral;
	private int isValue;
	
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
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public float getUserIntegral() {
		return userIntegral;
	}
	public void setUserIntegral(float userIntegral) {
		this.userIntegral = userIntegral;
	}
	
	public int getIsValue() {
		return isValue;
	}
	public void setIsValue(int isValue) {
		this.isValue = isValue;
	}
	@Override
	public String toString() {
		return "user [userID=" + userID + ", userName=" + userName + ", userPassword=" + userPassword + ", userType="
				+ userType + ", userEmail=" + userEmail + ", userIntegral=" + userIntegral + ", isValue=" + isValue
				+ "]";
	}
	
	
}
