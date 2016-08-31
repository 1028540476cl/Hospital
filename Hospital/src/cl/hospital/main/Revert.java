package cl.hospital.main;

import java.io.Serializable;

public class Revert implements Serializable{
	
	private Integer rid;
	private String contert;
	private String revertTime;
	private String rname;

	private Message message;
	
	

	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public String getContert() {
		return contert;
	}
	public void setContert(String contert) {
		this.contert = contert;
	}
	public String getRevertTime() {
		return revertTime;
	}
	public void setRevertTime(String revertTime) {
		this.revertTime = revertTime;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	
	

}
