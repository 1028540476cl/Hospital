package cl.hospital.main;

import java.io.Serializable;

public class Message  implements Serializable{//留言实体类
	
	private static final long serialVersionUID = 1L;
	private Integer mid;
	private Integer muid;
	private String title;
	private String contert;
	private String cretaTime;
	private User user;		//与用户类是多对一	
	private Revert revert;
	
	

	public Revert getRevert() {
		return revert;
	}
	public void setRevert(Revert revert) {
		this.revert = revert;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	
	public Integer getMuid() {
		return muid;
	}
	public void setMuid(Integer muid) {
		this.muid = muid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContert() {
		return contert;
	}
	public void setContert(String contert) {
		this.contert = contert;
	}
	public String getCretaTime() {
		return cretaTime;
	}
	public void setCretaTime(String cretaTime) {
		this.cretaTime = cretaTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	

}
