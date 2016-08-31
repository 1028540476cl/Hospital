package cl.hospital.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;


import cl.hospital.dao.UserDaoImpl;

import cl.hospital.main.User;
import cl.hospital.util.PageModel;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction  extends ActionSupport implements ServletRequestAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request;
	UserDaoImpl udao = new UserDaoImpl();
	User user = new User();
	User us  ;
	private Integer uid;
	private List ulist = new ArrayList();
	private PageModel pagemodel = new PageModel(); 
	private int pageNo;
	
	
	
	

	
	public PageModel getPagemodel() {
		return pagemodel;
	}

	public void setPagemodel(PageModel pagemodel) {
		this.pagemodel = pagemodel;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public List getUlist() {
		return ulist;
	}

	public void setUlist(List ulist) {
		this.ulist = ulist;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public UserDaoImpl getUdao() {
		return udao;
	}

	public void setUdao(UserDaoImpl udao) {
		this.udao = udao;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUs() {
		return us;
	}

	public void setUs(User us) {
		this.us = us;
	}
	/**
	 * 用户登录
	 */
	public String login()throws Exception{
		if(us==null){
			return "nologin";
		}else{
		user = udao.findUser(us.getUsername(), us.getPassword());
	//System.out.println(user);
		if(user !=null){
			if(user.getTypeid()==1){
				//将医生对象放入Session中，并跳转到医生的首页
				request.getSession().setAttribute("user", user);
				return "doctorlist";
			}else if(user.getTypeid()==0){
				//将用户对象放在Session，并跳转到用户的首页
				request.getSession().setAttribute("user", user);
				return "userlist";
			}else{
				//将管理员(最高权限)对象放入Session中，并跳转到医生的首页
				request.getSession().setAttribute("user", user);
				return "adminlist";
			}
		}else{
			//登录失败
			request.setAttribute("error", "用户名或者密码错误！！");
			return "userlist";
		}
	}
	}
	/**
	 * 注销用户
	 * @return
	 * @throws Exception
	 */
	public String loginout()throws Exception{
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		return "loginout";
	}
	/**
	 * 查看资料,先跳转到回答问题界面
	 * @return
	 * @throws Exception
	 */
	public String answerlogin()throws Exception{
		user = udao.finObjectById("cl.hospital.main.User", uid);
		return "answer";
	}
	/**
	 * 回答问题界面正确，跳转到修改资料界面
	 * @return
	 * @throws Exception
	 */
	public String searchlogin()throws Exception{
		user = udao.finObjectById("cl.hospital.main.User", uid);
		if(us.getAnswer().equals(user.getAnswer())){
			return "search";
		}else{
			request.setAttribute("error", "你回答的问题出错，请重新回答!!");
			return "answer";
		}
		
	}

	/**
	 * 用户注册
	 * @return
	 * @throws Exception
	 */
	public String saveUser()throws Exception{
		String hql = "from User u where u.number = ?";
		ulist=  udao.findQueObject(hql, ""+us.getNumber()+"");
		if(ulist==null||ulist.size()==0){
			boolean count = false;
			count = udao.saveObject(us);
			if(count){
				request.getSession().removeAttribute("user");
				request.setAttribute("save", "注册成功,返回首页登录");
				return "save";
			}else{
			request.setAttribute("serror", "注册失败，请重新注册！！");
				return "saveerror";
				
			}
		}else{
			request.setAttribute("serror", "此身份证号码已注册过！！");
			return "error";
		}
		
		
	}
	/**
	 * 用户更新资料
	 */
	public String updatelogin()throws Exception{
		boolean count = false;
		count =udao.updateObject(us);
		if(count){
			
			request.getSession().removeAttribute("user");
			request.setAttribute("save", "更新资料成功，请返回首页重新登录");
			return "save";
		}else{
			return "save";
		}
		
	}
	/*-------------------------------后台分割线------------------------------*/
	/***
	 * 跳转到后台首页
	 * @return
	 * @throws Exception
	 */
	public String defaultjsp()throws Exception{
		User user = (User) request.getSession().getAttribute("user");
		request.setAttribute("user", user);
		return "adminsuccess";
	}
	/***
	 * 超级管理员查找全部用户
	 * @return
	 * @throws Exception
	 */
	public String listuser()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/user/userlist.jsp");
		pagemodel = udao.find("User", pageNo, 2);
		request.setAttribute("dlist", pagemodel);
		User user = (User) request.getSession().getAttribute("user");
		request.setAttribute("user", user);
		return "adminsuccess";
	}
	/***
	 * 超级管理员删除注册用户
	 * @return
	 * @throws Exception
	 */
public String deluser()throws Exception{
	request.setAttribute("adminmainPage", "/adminjsp/user/save.jsp");
	boolean count;
	us = udao.finObjectById("cl.hospital.main.User", uid);
	count = udao.delObject(us);
	if(count){
		User user = (User) request.getSession().getAttribute("user");
		request.setAttribute("user", user);
		request.setAttribute("save", "删除成功，跳转至列表···");
		return "adminsuccess";
	}else{
		request.setAttribute("save", "删除失败，请重试···");
		return "error";
	}
	
}
	@Override
public void setServletRequest(HttpServletRequest request) {
		
		
		
		this.request = request;
		
	}
}
