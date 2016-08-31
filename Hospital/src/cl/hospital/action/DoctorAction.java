package cl.hospital.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import cl.hospital.dao.DoctorDaoImpl;
import cl.hospital.main.Doctor;
import cl.hospital.main.Time;
import cl.hospital.main.User;
import cl.hospital.util.PageModel;

import com.opensymphony.xwork2.ActionSupport;

public class DoctorAction  extends ActionSupport implements ServletRequestAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	DoctorDaoImpl dodao = new DoctorDaoImpl();
	Doctor doctor = new Doctor() ;
	private Integer  typeid;
	private List dlist = new ArrayList();
	String departmentName;
	private Integer condition;
	PageModel pagemodel = new PageModel();
	private Integer pageNo;
	private Time dtime = new Time();
	private Integer type;
	private String key;
	private Doctor doc = new Doctor();
	private Time time1= new Time();
	private Time time2= new Time();
	
	
	

	
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
	public Doctor getDoc() {
		return doc;
	}
	public void setDoc(Doctor doc) {
		this.doc = doc;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Time getDtime() {
		return dtime;
	}
	public void setDtime(Time dtime) {
		this.dtime = dtime;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public PageModel getPagemodel() {
		return pagemodel;
	}
	public void setPagemodel(PageModel pagemodel) {
		this.pagemodel = pagemodel;
	}
	public Integer getCondition() {
		return condition;
	}
	public void setCondition(Integer condition) {
		this.condition = condition;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public List getDlist() {
		return dlist;
	}
	public void setDlist(List dlist) {
		this.dlist = dlist;
	}
	
	public Integer getTypeid() {
		return typeid;
	}
	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	public DoctorDaoImpl getDodao() {
		return dodao;
	}
	public void setDodao(DoctorDaoImpl dodao) {
		this.dodao = dodao;
	}
	public Doctor getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}
	/**
	 * 点击选择查询该科室的医生信息
	 * @return
	 * @throws Exception
	 */
	public String findDepartment()throws Exception{
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			request.setAttribute("mainPage", "/jsp/doctor/clickdoctor.jsp");
			String hql = " where d.typeid = ?";
			Object[] queryParams = {typeid};
			pagemodel = dodao.find("Doctor as d", pageNo, 3, hql, queryParams);
			request.setAttribute("dlist", pagemodel);
			request.setAttribute("sign", 1);
			request.setAttribute("typeid", typeid);
			return "success";
		}else if(user.getTypeid()==2){
			request.setAttribute("adminmainPage", "/jsp/doctor/clickdoctor.jsp");
			String hql = " where d.typeid = ?";
			Object[] queryParams = {typeid};
			pagemodel = dodao.find("Doctor as d", pageNo, 3, hql, queryParams);
			request.setAttribute("dlist", pagemodel);
			request.setAttribute("sign", 1);
			request.setAttribute("typeid", typeid);
			return "adminsuccess";
		}else {
			request.setAttribute("mainPage", "/jsp/doctor/clickdoctor.jsp");
			String hql = " where d.typeid = ?";
			Object[] queryParams = {typeid};
			pagemodel = dodao.find("Doctor as d", pageNo, 3, hql, queryParams);
			request.setAttribute("dlist", pagemodel);
			request.setAttribute("typeid", typeid);
			request.setAttribute("sign", 1);
			return "success";
		}
		
	}
	/**
	 * 选择查询该科室的医生信息
	 * @return
	 * @throws Exception
	 */
	public String checkDepartment()throws Exception{
		request.setAttribute("mainPage", "/jsp/doctor/clickdoctor.jsp");
		String hql = " where d.typeid = ?";
		Object[] queryParams = {condition};	
		pagemodel = dodao.find("Doctor as d", pageNo, 3, hql, queryParams);
		request.setAttribute("dlist", pagemodel);
		request.setAttribute("typeid", condition);
		request.setAttribute("sign", 1);
		
		return "success";
	}
	/**
	 * 查看全部医生信息
	 * @return
	 * @throws Exception
	 */
	public String findAllDepartment() throws Exception{
		request.setAttribute("mainPage", "/jsp/doctor/checkdoctor.jsp");
		pagemodel = dodao.find("Doctor", pageNo, 3);
		request.setAttribute("dlist", pagemodel);
		request.setAttribute("sign", 0);
		return "success";
	}
	/**
	 * 搜索科室的医生
	 * @return
	 * @throws Exception
	 */
	public String searchDepartment() throws Exception{
		if(type==0){
			if (key.equals(new String(key.getBytes("iso-8859-1"), "iso-8859-1"))){
				key=new String(key.getBytes("iso-8859-1"),"UTF-8");
			}
			request.setAttribute("key", key);
			request.setAttribute("mainPage", "/jsp/doctor/checkdoctor.jsp");
			String hql = " where  d.dname like ?";
			key="%"+key+"%";
			Object[] queryParams = {key};
			pagemodel = dodao.find("Doctor as d", pageNo, 3, hql, queryParams);
			request.setAttribute("dlist", pagemodel);
			request.setAttribute("typeid", 0);
			
			request.setAttribute("sign", 2);
			return "success";
		}
		else if(key.equals("")){
			request.setAttribute("mainPage", "/jsp/doctor/clickdoctor.jsp");
			String hql = " where d.typeid = ? ";
			Object[] queryParams = {type};
			pagemodel = dodao.find("Doctor as d", pageNo, 3, hql, queryParams);
			request.setAttribute("dlist", pagemodel);
			request.setAttribute("typeid", type);
			request.setAttribute("sign", 1);
			return "success";
			
		}else{
			if (key.equals(new String(key.getBytes("iso-8859-1"), "iso-8859-1"))){
				key=new String(key.getBytes("iso-8859-1"),"UTF-8");
			}
			request.setAttribute("key", key);
			request.setAttribute("mainPage", "/jsp/doctor/checkdoctor.jsp");
			String hql = " where d.typeid = ? and d.dname like ?";
			key="%"+key+"%";
			Object[] queryParams = {type,key};
			pagemodel = dodao.find("Doctor as d", pageNo, 3, hql, queryParams);
			request.setAttribute("dlist", pagemodel);
			request.setAttribute("typeid", type);
			request.setAttribute("sign", 2);
			return "success";
		}
			
	
	}
	/**
	 * 查看医生具体信息，并且预约
	 * @return
	 * @throws Exception
	 */
	public String findDoctor()throws Exception{
		doctor = dodao.finObjectById("cl.hospital.main.Doctor", typeid);
		request.setAttribute("dlist",doctor);
		return "find";
	}
	/*	---------------------------后台管理分界线--------------------------
	*/
	/***
	 * 后台管理员查看全部医生
	 * @return
	 * @throws Exception
	 */
	public String adminListDoctor()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/doctor/listDoctor.jsp");
		pagemodel = dodao.find("Doctor", pageNo, 3);
		request.setAttribute("dlist", pagemodel);
		return "adminsuccess";
	}
	
	/***
	 * 上一页查找医生信息
	 * @return
	 * @throws Exception
	 */
	public String adminDoctor()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/doctor/addDoctor.jsp");
		doctor = dodao.finObjectById("cl.hospital.main.Doctor", type);
		request.setAttribute("dor", doctor);
		return "adminsuccess";
	}
	/***
	 * 后台管理员增加医生信息
	 * @return
	 * @throws Exception
	 */
	public String adminAddDoctor()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/doctor/addDoctor.jsp");
		return "adminsuccess";
	}
	/***
	 * 保存医生信息并跳转到排班信息
	 * @return
	 * @throws Exception
	 */
	public String adminAddDoctorTime()throws Exception{
		boolean count;
		request.setAttribute("adminmainPage", "/adminjsp/doctor/addTime.jsp");
		String docdid  = String.valueOf(doc.getDid());
		if(docdid.equals("null")){
			count = dodao.saveObject(doc);
		}else{
			count = dodao.updateObject(doc);
		}
		if(count){
			request.getSession().setAttribute("doc", doc);
			return "adminsuccess";
		}else{
			return"error";
		}
			
		}
	/***
	 * 管理员更改医生信息成功
	 * @return
	 * @throws Exception
	 */
	public String updoctorSuccess()throws Exception{
		Doctor doctor = (Doctor) request.getSession().getAttribute("doc");
		boolean count = dodao.updateObject(doctor);
		if(count){
			request.getSession().setAttribute("time1", time1);
			request.getSession().setAttribute("time2", time2);
			return "upTime";
		}else{
			request.getSession().removeAttribute("doc");
			return "error";
		}
	
			
		}
	/***
	 * 后台管理员更新医生信息
	 * @return
	 * @throws Exception
	 */
	public String adminUpDoctor()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/doctor/upDoctor.jsp");
		doctor = dodao.finObjectById("cl.hospital.main.Doctor", type);
		request.setAttribute("dor", doctor);
		return "adminsuccess";
	}
	/***
	 * 
	 * @return
	 * @throws Exception
	 */
	public String upDoctor()throws Exception{
		
		return "adminsuccess";
	}
	
	/***
	 * 后台管理员删除医生信息
	 * @return
	 * @throws Exception
	 */
	public String adminDlDoctor()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/doctor/save.jsp");
		doctor = dodao.finObjectById("cl.hospital.main.Doctor", type);
		boolean count= dodao.delObject(doctor);
		if(count){			
			request.setAttribute("save", "删除成功···3秒后跳转至全部医生界面,请稍候···");
			return "adminsuccess";
			
		}else{
			return"error";
		}
		
	}
	/***
	 * 后台管理员取消医生的添加
	 * @return
	 * @throws Exception
	 */
	public String adminQuDoctor()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/doctor/save.jsp");
		doctor = dodao.finObjectById("cl.hospital.main.Doctor", type);
		boolean count= dodao.delObject(doctor);
		if(count){			
			request.setAttribute("save", " ");
			return "adminsuccess";
			
		}else{
			return"error";
		}
		
	}
public void setServletRequest(HttpServletRequest request) {
	
		this.request = request;
		
	}
}
