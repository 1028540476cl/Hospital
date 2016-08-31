package cl.hospital.main;

import java.io.Serializable;

public class Time implements Serializable  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer timeid;
	private String timeo;
	private String timet;
	private String timetr;
	private String timef;
	private String timefi;
	private String times;
	private String timesi;
	private String remark;
	private Integer number;
	private Doctor doctor;
	
	
	public Doctor getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}
	public Integer getTimeid() {
		return timeid;
	}
	public void setTimeid(Integer timeid) {
		this.timeid = timeid;
	}
	public String getTimeo() {
		return timeo;
	}
	public void setTimeo(String timeo) {
		this.timeo = timeo;
	}
	public String getTimet() {
		return timet;
	}
	public void setTimet(String timet) {
		this.timet = timet;
	}
	public String getTimetr() {
		return timetr;
	}
	public void setTimetr(String timetr) {
		this.timetr = timetr;
	}
	public String getTimef() {
		return timef;
	}
	public void setTimef(String timef) {
		this.timef = timef;
	}
	public String getTimefi() {
		return timefi;
	}
	public void setTimefi(String timefi) {
		this.timefi = timefi;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public String getTimesi() {
		return timesi;
	}
	public void setTimesi(String timesi) {
		this.timesi = timesi;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	
	
	


}
