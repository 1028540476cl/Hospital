package cl.hospital.action;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;

import cl.hospital.dao.TimeDaoImpl;
import cl.hospital.main.Doctor;
import cl.hospital.main.Time;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author acer
 *
 */
public class TimeAction  extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	
	private Time time = new  Time();
	private Integer did;
	private TimeDaoImpl dtime = new TimeDaoImpl();
	private List tlist= new ArrayList();
	private Time time1 = new  Time();
	private Time time2 = new  Time();
	private Time timeid = new Time();
	private Doctor doc = new Doctor(); 
	private String date;
	private Integer sgin;
	
	
	
	
	
	public Integer getSgin() {
		return sgin;
	}
	public void setSgin(Integer sgin) {
		this.sgin = sgin;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Doctor getDoc() {
		return doc;
	}
	public void setDoc(Doctor doc) {
		this.doc = doc;
	}
	public Time getTimeid() {
		return timeid;
	}
	public void setTimeid(Time timeid) {
		this.timeid = timeid;
	}
	public Time getTime1() {
		return time1;
	}
	public void setTime1(Time time1) {
		this.time1 = time1;
	}
	public Time getTime2() {
		return time2;
	}
	public void setTime2(Time time2) {
		this.time2 = time2;
	}
	public List getTlist() {
		return tlist;
	}
	public void setTlist(List tlist) {
		this.tlist = tlist;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public TimeDaoImpl getDtime() {
		return dtime;
	}
	public void setDtime(TimeDaoImpl dtime) {
		this.dtime = dtime;
	}
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}

	/**
	 * 查看医生工作时间表。并且预约
	 * 
	 */
	public String checkTime()throws Exception{
		String hql="from Time where doctorid= "+did;
		tlist  = dtime.findAllObject(hql);
		request.setAttribute("dlist",tlist);
		return "success";
		
	}
	/**
	 * 查看预约信息，并且确定订单
	 * @return
	 * @throws Exception
	 */
	public String orderTime()throws Exception{
		int did = (Integer) request.getSession().getAttribute("did");
		request.getSession().removeAttribute("did");
		String  date = (String) request.getSession().getAttribute("date");
		request.getSession().removeAttribute("date");
		time = dtime.finObjectById("cl.hospital.main.Time", did);
		request.setAttribute("checktime", time);
		request.setAttribute("date", date);
		request.getSession().setAttribute("time", time);
		return "time";
	}
	/***
	 * 确认订单，预约号减一并跳转到收费界面
	 * @return
	 * @throws Exception
	 */
	public String orderTrue()throws Exception{
		time1 = (Time) request.getSession().getAttribute("time");
		request.removeAttribute("time");
		int soid = (Integer) request.getSession().getAttribute("stoid");
		request.removeAttribute("stoid");
		time1.setNumber(time1.getNumber()-1);
		dtime.updateObject(time1);
		request.setAttribute("save", "订单已经生成，1秒后跳转至付费界面，请稍后···");
		request.setAttribute("oid", soid);
		return "order";
		
	}
	/***
	 * 删除预约订单，预约号加一并跳转到列表界面
	 * @return
	 * @throws Exception
	 */
	public String orderdel()throws Exception{
		int time1 = (Integer) request.getSession().getAttribute("timeid");
		request.removeAttribute("timeid");
		time = dtime.finObjectById("cl.hospital.main.Time", time1);
		time.setNumber(time.getNumber()+1);
		dtime.updateObject(time);
		request.setAttribute("save", "删除成功，3秒后跳转回订单列表，请稍后···");
		request.setAttribute("oid", "null");
		return "order";
		
	}
/*	------------------------后台分割线--------------------------
*/	
	/***
	 * 后台管理员查看时间表
	 * @return
	 * @throws Exception
	 */
	public String admincheckTime()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/doctor/checkDoctor.jsp");
		String hql="from Time where doctorid= "+did;
		tlist  = dtime.findAllObject(hql);
		
		Time time = null;
		for(int i=0;i<1;i++){
			 time =  (Time) tlist.get(i);
			
		}
		Doctor doctor=time.getDoctor();
		request.getSession().setAttribute("doc", doctor);
		request.setAttribute("dlist",tlist);
		return "adminsuccess";
		
	}
	/***
	 * 后台删除预约订单，预约号加一
	 * @return
	 * @throws Exception
	 */
	public String adminorderdel()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/order/save.jsp"); 
		int time1 = (Integer) request.getSession().getAttribute("timeid");
		request.removeAttribute("timeid");
		time = dtime.finObjectById("cl.hospital.main.Time", time1);
		time.setNumber(time.getNumber()+1);
		dtime.updateObject(time);
		request.setAttribute("oid", 1);
		request.setAttribute("save", "已就诊，清除预约订单成功，3秒后跳转回订单列表，请稍后···");
		return "adminsuccess";
		
	}
	/***
	 * 后台管理员添加医生的时间表
	 * @return
	 * @throws Exception
	 */
	public String admingAddTime()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/doctor/save.jsp");
		Doctor doctor = (Doctor) request.getSession().getAttribute("doc");
		time1.setDoctor(doctor);
		time2.setDoctor(doctor);
		
		boolean count = dtime.saveObject(time1);
		 count = dtime.saveObject(time2);
		 if(count){
			 request.getSession().removeAttribute("doc");
			 request.setAttribute("save", "医生及他的排班表添加成功····3秒后跳转至全部医生界面,请稍候···");
			 return "adminsuccess";
		 }else{
			 return"error";
		 }
			}
	/***
	 * 后台管理员更新医生及排班信息
	 * @return
	 * @throws Exception
	 */
	public String adminUpDoctor()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/doctor/upTime.jsp");
		String hql="from Time where doctorid= "+did;
		if(sgin==1){
			request.getSession().setAttribute("doc", doc);
		}else{
			Doctor doctor = (Doctor) request.getSession().getAttribute("doc");
			request.getSession().removeAttribute("doc");
			request.getSession().setAttribute("doc", doctor);
		}
		
		tlist  = dtime.findAllObject(hql);
		request.setAttribute("dlist",tlist);
		return "adminsuccess";
	}
	/***
	 * 更改时间表成功
	 * @return
	 * @throws Exception
	 */
	public String upDoctorsuccess()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/doctor/save.jsp");
		boolean count ;
		Doctor doctor = (Doctor) request.getSession().getAttribute("doc");
		Time dtime1 = (Time) request.getSession().getAttribute("time1");
		request.getSession().removeAttribute("doc");
		request.getSession().removeAttribute("time1");
		Time dtime2 = (Time) request.getSession().getAttribute("time2");
		request.getSession().removeAttribute("time2");
		dtime1.setDoctor(doctor);
		dtime2.setDoctor(doctor);
		if(dtime1.getTimeid()==null||dtime2.getTimeid()==null){
			count = dtime.saveObject(dtime1);
			 count = dtime.saveObject(dtime2);
		}else{
			 count = dtime.updateObject(dtime1);
			 count = dtime.updateObject(dtime2);
		}
		
		if(count){
			request.setAttribute("save", "更新成功···3秒后跳转至全部医生界面,请稍候···");
			return "adminsuccess";
		}else{
			return "error";
		}

	}
	/***
	 * 
	 */
	public String delTime()throws Exception{
		boolean count = false;
		request.setAttribute("adminmainPage", "/adminjsp/doctor/delsave.jsp");
		String hql="from Time where doctorid= "+did;
		request.getSession().setAttribute("doc", doc);
		tlist  = dtime.findAllObject(hql);
		if(tlist.size()!=0){
			for(int i=0;i<tlist.size();i++){
				time = (Time) tlist.get(i);
				count = dtime.delObject(time);
				}if(count){
					request.setAttribute("type", did);
					return "adminsuccess";
					
				}else{
					return "error";
				}
			}else{
				request.setAttribute("type", did);
				return "adminsuccess";
		}
	}
	public void setServletRequest(HttpServletRequest request) {
		
		this.request = request;
		
	}
}
