package cl.hospital.main;
/*
 * 个人信息
 */
/**
 * @author acer
 *
 */
public class User {
	private Integer userid;
	private Integer typeid;
	private String username;
	private String password;
	private String answer;
	private String question;
	private String sex;
	private String number;
	private String phone;
	private String mail;
	private String address;
	private Integer deid;
	/*private Department department;
	
	
	
	
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	*/
	
	public Integer getTypeid() {
		return typeid;
	}

	public Integer getDeid() {
		return deid;
	}

	public void setDeid(Integer deid) {
		this.deid = deid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	

}
