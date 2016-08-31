package cl.hospital.action;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import cl.hospital.dao.DepartmentDaoimpl;
import cl.hospital.main.Department;
 
import com.opensymphony.xwork2.ActionSupport;

public class DepartmentAction  extends ActionSupport implements ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public HttpServletRequest request;
	public static DepartmentDaoimpl ddao = new DepartmentDaoimpl();
	public Department department = new Department();
	public  static List list = new ArrayList();
	public Department de;
	public HttpServletResponse respose;
	public int deid;
	
	
	
	public int getDeid() {
		return deid;
	}


	public void setDeid(int deid) {
		this.deid = deid;
	}


	public HttpServletResponse getRespose() {
		return respose;
	}


	public void setRespose(HttpServletResponse respose) {
		this.respose = respose;
	}


	public Department getDe() {
		return de;
	}


	public void setDe(Department de) {
		this.de = de;
	}


	public HttpServletRequest getRequest() {
		return request;
	}


	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public DepartmentDaoimpl getDdao() {
		return ddao;
	}


	public void setDdao(DepartmentDaoimpl ddao) {
		this.ddao = ddao;
	}


	public Department getDepartment() {
		return department;
	}


	public void setDepartment(Department department) {
		this.department = department;
	}


	public String execute()throws Exception{

		
		String hql = "from Department ";
	
		 list= ddao.findAllObject(hql);
		HttpSession session = request.getSession();
		session.setAttribute("list", list);
	
		return "listsuccess";
	}

	/*
	 * 用户跳转注册界面
	 */
	public String reg()throws Exception{
		return "reg";
	}
	/*
	 * 用户跳转流程界面
	 */
	public String pro()throws Exception{
		return "pro";
	}
	/*
	 * 用户跳转特色科室界面
	 */
	public String cha()throws Exception{
		return "cha";
	}
	/*
	 * 跳转到医院概况界面
	 */
	public String hos()throws Exception{
		return "hos";
	}
	/*
	 * 跳转到招才纳贤界面
	 */
	public String re()throws Exception{
		return "re";
	}
/*	---------------------------后台管理分界线--------------------------
*/
	/***
	 * 后台管理员查看全部的部门
	 * @return
	 * @throws Exception
	 */
	public String allDepater()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/department/Delist.jsp");
		String hql = "from Department";
		list = ddao.findAllObject(hql);
		request.getSession().removeAttribute("list");
		request.getSession().setAttribute("list", list);
		return "adminsuccess";
	}
	/***
	 * 查找更新的部门信息
	 * @return
	 * @throws Exception
	 */
	public String upfind()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/department/uplist.jsp");
		department = ddao.finObjectById("cl.hospital.main.Department", deid);
		request.setAttribute("department", department);
		return "adminsuccess";
		
	}
	/***
	 * 后台管理员更新部门名字
	 * @return
	 * @throws Exception
	 */
	public String upDepart()throws Exception{
		boolean count;
		count = ddao.updateObject(de);
		if(count){
			request.setAttribute("save", "更新部门成功···");
		
			return allDepater();
		}else{
			request.setAttribute("save", "更新部门失败，请重试···");
		
			return"error";
		}
	}
	/***
	 * 后台管理员增加部门
	 * @return
	 * @throws Exception
	 */
	public String addDepart()throws Exception{
		boolean count;
		count=ddao.saveObject(de);
		if(count){
			request.setAttribute("save", "增加部门成功···");
			
			return allDepater();
		}else{
			request.setAttribute("save", "增加部门失败，请重试···");
	
			return"error";
		}
		
	}
	/***
	 * 后台管理员删除部门
	 * @return
	 * @throws Exception
	 */
	public String delDepart()throws Exception{
		boolean count;
		department = ddao.finObjectById("cl.hospital.main.Department", deid);
		count=ddao.delObject(department);
		if(count){
			request.setAttribute("save", "删除部门成功···");
		
			return allDepater();
		}else{
			request.setAttribute("save", "删除部门失败，请先删除部门医生信息，请重试···");
		
			return"error";
		}
		
	}
	@Override
public void setServletRequest(HttpServletRequest request) {
		
		this.request = request;
		
	}

}
