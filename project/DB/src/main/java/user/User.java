package user;

public class User {
	private String userID;
	private String userPassword;
	private String userName;
	private String userGender;
	private String userEmail;

	public String getuserID() {
		return userID;
	}

	public void setuserID(String userID) {
		this.userID = userID;
	}

	public String getuserPassword() {
		return userPassword;
	}

	public void setuserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getuserName() {
		return userName;
	}

	public void setuserName(String userName) {
		this.userName = userName;
	}

	public String getuserGender() {
		return userGender;
	}

	public void setuserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getuserEmail() {
		return userEmail;
	}

	public void setuserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

}
