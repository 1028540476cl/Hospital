package cl.hospital.main;

import java.io.Serializable;

public class Order implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer oid;
	private Integer tid;
	private Integer timeid;
	private String oname;
	private String dname;
	private String otime;
	private String kesi;
	private Float oprice;
	private String ophone;
	private String onumber;
	private User user;
	private Time time;
	
	
	
	public Integer getTimeid() {
		return timeid;
	}
	public void setTimeid(Integer timeid) {
		this.timeid = timeid;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getOtime() {
		return otime;
	}
	public void setOtime(String otime) {
		this.otime = otime;
	}
	public String getKesi() {
		return kesi;
	}
	public void setKesi(String kesi) {
		this.kesi = kesi;
	}
	public Float getOprice() {
		return oprice;
	}
	public void setOprice(Float oprice) {
		this.oprice = oprice;
	}
	public String getOphone() {
		return ophone;
	}
	public void setOphone(String ophone) {
		this.ophone = ophone;
	}
	public String getOnumber() {
		return onumber;
	}
	public void setOnumber(String onumber) {
		this.onumber = onumber;
	}
	
	
}
