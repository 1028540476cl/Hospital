package cl.hospital.action;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import cl.hospital.dao.MessageDaoImpl;
import cl.hospital.main.Message;
import cl.hospital.main.Revert;
import cl.hospital.main.User;
import cl.hospital.util.PageModel;

import com.opensymphony.xwork2.ActionSupport;

public class MessageAction  extends ActionSupport implements ServletRequestAware{
	private static final long serialVersionUID = 1L;


	private HttpServletRequest request;
	private MessageDaoImpl mdao = new MessageDaoImpl();
	private  Message message = new Message();
	private List  mlist = new ArrayList();
	private Integer pageNo;
	PageModel pagemodel = new PageModel();
	private Integer mid;
	private Message mess = new Message();
	private Integer rid;



	
	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public PageModel getPagemodel() {
		return pagemodel;
	}

	public void setPagemodel(PageModel pagemodel) {
		this.pagemodel = pagemodel;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public List getMlist() {
		return mlist;
	}

	public void setMlist(List mlist) {
		this.mlist = mlist;
	}
	public Message getMess() {
		return mess;
	}

	public void setMess(Message mess) {
		this.mess = mess;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public MessageDaoImpl getMdao() {
		return mdao;
	}

	public void setMdao(MessageDaoImpl mdao) {
		this.mdao = mdao;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}
	/**
	 * 跳转到留言板界面,默认显示我的留言列表
	 */
	public String execute()throws Exception{
		
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		int uid = user.getTypeid();
		int muid = user.getUserid();
		if(uid==0){
			request.setAttribute("mainPage", "/jsp/message/listMessage.jsp");
			String hql = " where muid=?";
			Object[] queryParams = {muid};
			pagemodel = mdao.find("Message", pageNo, 3, hql, queryParams);
			request.setAttribute("dlist", pagemodel);
			return "success";
		}else if(uid==2){//这是后台超级管理员界面
			request.setAttribute("adminmainPage", "/jsp/message/listMessage.jsp");
			pagemodel = mdao.find("Message", pageNo, 2);
			
			request.setAttribute("dlist", pagemodel);
			return "adminsuccess";
		}else{//这是医生后台界面
			request.setAttribute("adminmainPage", "/jsp/message/listMessage.jsp");
			pagemodel = mdao.find("Message", pageNo, 2);
			
			request.setAttribute("dlist", pagemodel);
			return "adminsuccess";
		}
	}
	/***
	 * 保存留言
	 * @return
	 * @throws Exception
	 */
	public String saveMessage()throws Exception{

		request.setAttribute("mainPage", "/jsp/message/save.jsp");
		String datetime = new SimpleDateFormat("yyyy-MM-dd EEEE")
		.format(Calendar.getInstance().getTime()); //获取系统时间。格式是年月日 星期
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");	
		mess.setMuid(user.getUserid());

		mess.setCretaTime(datetime);
		boolean count ;
		if(mess.getMid()==null){
			count = mdao.saveObject(mess);
		}else{
			count = mdao.updateObject(mess);
		}
		if(count){
			request.setAttribute("save", "保存成功，正在跳转至我的留言列表...");
			return "success";
		}else{
			request.setAttribute("save", "保存失败，请重新加留言..");
			return "error";
		}
	}
	/***
	 * 增加留言界面
	 * @return
	 * @throws Exception
	 */
	public String addMessage()throws Exception{
		request.setAttribute("mainPage", "/jsp/message/addMessage.jsp");
		return"success";
	}
	/***
	 * 修改留言
	 * @return
	 * @throws Exception
	 */
	public String updateMessage()throws Exception{
		request.setAttribute("mainPage", "/jsp/message/addMessage.jsp");
		message = mdao.finObjectById("cl.hospital.main.Message", mid);
		request.setAttribute("message", message);
		return"success";
	}
	
	/***
	 * 删除留言
	 * @return
	 * @throws Exception
	 */
	public String delMessage()throws Exception{
		request.setAttribute("mainPage", "/jsp/message/save.jsp");
		boolean count;
		message = mdao.finObjectById("cl.hospital.main.Message", mid);
		count = mdao.delObject(message);
		if(count){
			request.setAttribute("save", "删除成功，正在跳转至我的留言列表···");
			return "success";
		}else{
			request.setAttribute("save", "删除失败，请重试···");
			return "error";
		}
	}
	/***
	 * 医生回复留言
	 * @return
	 * @throws Exception
	 */
	public String saveRevert()throws Exception{
		request.setAttribute("adminmainPage", "/jsp/message/save.jsp");
		HttpSession session=request.getSession();
		Revert re =  (Revert) session.getAttribute("re");
		message = mdao.finObjectById("cl.hospital.main.Message", mid);
		message.setRevert(re);
		request.getSession().removeAttribute("re");
		boolean count;
		count = mdao.updateObject(message);
		if(count){
			request.setAttribute("save", "正在跳转,请稍后...");
			request.getSession().removeAttribute("re");
			request.removeAttribute("mid");
			return "adminsuccess";
		}else{
			request.setAttribute("save", "保存失败，请重新加留言..");
			return "error";
		} 
	}
	/***
	 * 删除回复（先删除外键联系）
	 * @return
	 * @throws Exception
	 */
	public String upRevert() throws Exception{
		request.setAttribute("adminmainPage", "/jsp/revert/save.jsp");
		message = mdao.finObjectById("cl.hospital.main.Message", mid);
		//System.out.println(message);
		message.setRevert(null);
		//System.out.println(message);
		boolean count;
		count = mdao.updateObject(message);
		if(count){
			request.setAttribute("rid", rid);
			request.setAttribute("save", "请稍候...");
			return "adminsuccess";
		}else{
			request.setAttribute("save", "请稍候...");
			return "error";
		}
	
	}
	/***
	 * 医生修改留言
	 * @return
	 * @throws Exception
	 */
	public String updateRevert()throws Exception{
		request.setAttribute("adminmainPage", "/jsp/revert/updateRevert.jsp");
		message = mdao.finObjectById("cl.hospital.main.Message", mid);
		request.setAttribute("message", message);
		return "adminsuccess";
	}
/*	后台跟前台的分割线----------------------------------------------------------------------------------------------------
*/
	/***
	 * 后台管理
	 * @return
	 * @throws Exception
	 */
	public String adminexecute()throws Exception{
		
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		int uid = user.getTypeid();
		if(uid==1){/*这个是科室医生*/
			request.setAttribute("adminmainPage", "/jsp/message/listMessage.jsp");
			pagemodel = mdao.find("Message", pageNo, 2);
			
			request.setAttribute("dlist", pagemodel);
			return "adminsuccess";
		}else{/*超级管理员*/
			request.setAttribute("adminmainPage", "/jsp/message/listMessage.jsp");
			pagemodel = mdao.find("Message", pageNo, 2);
			
			request.setAttribute("dlist", pagemodel);
			return "adminsuccess";
		}
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}


}
