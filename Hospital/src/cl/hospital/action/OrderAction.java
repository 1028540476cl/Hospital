package cl.hospital.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import cl.hospital.dao.OrderDaoImpl;
import cl.hospital.dao.UserDaoImpl;
import cl.hospital.main.Department;
import cl.hospital.main.Order;
import cl.hospital.main.Time;
import cl.hospital.main.User;
import cl.hospital.util.PageModel;

import com.opensymphony.xwork2.ActionSupport;


public class OrderAction  extends ActionSupport implements ServletRequestAware {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;
	
	private Order torder = new Order();
	private OrderDaoImpl dorder = new OrderDaoImpl();
	private List tlist= new ArrayList();
	PageModel pagemodel = new PageModel();
	private Order od;
	private Integer oid;
	private float price;
	private Integer uid;
	private Integer pageNo;
	private String date;
	

	
	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}



	public Integer getUid() {
		return uid;
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



	public void setUid(Integer uid) {
		this.uid = uid;
	}



	public float getPrice() {
		return price;
	}



	public void setPrice(float price) {
		this.price = price;
	}



	public Integer getOid() {
		return oid;
	}



	public void setOid(Integer oid) {
		this.oid = oid;
	}



	public Order getTorder() {
		return torder;
	}



	public void setTorder(Order torder) {
		this.torder = torder;
	}



	public HttpServletRequest getRequest() {
		return request;
	}



	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public Order getOd() {
		return od;
	}



	public void setOd(Order od) {
		this.od = od;
	}



	public OrderDaoImpl getDorder() {
		return dorder;
	}



	public void setDorder(OrderDaoImpl dorder) {
		this.dorder = dorder;
	}



	public List getTlist() {
		return tlist;
	}



	public void setTlist(List tlist) {
		this.tlist = tlist;
	}
	/**
	 * 确定并提交订单
	 * @return
	 * @throws Exception
	 */
	public String orderTrue()throws Exception{
			request.setAttribute("ord", od);
			return "order";
	
	}
	/**
	 * 查看订单详细情况，并生成订单
	 * @return
	 * @throws Exception
	 */
	public String orderList()throws Exception{
		boolean count ;
			HttpSession session=request.getSession();
			User user = (User) session.getAttribute("user");
			od.setTid(user.getUserid());
			Time time1 = (Time) request.getSession().getAttribute("time");
			od.setTimeid(time1.getTimeid());
			count = dorder.saveObject(od);
			if(count){
				request.setAttribute("oid", 7);
				request.getSession().setAttribute("stoid", od.getOid());
				return "orderlist";
			}else{
			request.setAttribute("save", "订单生成失败，请重试！！！");
			return "error";
		}	
	}
	/**
	 * 付费
	 * @return
	 * @throws Exception
	 */
	public String orderPay()throws Exception{
	torder=	dorder.finObjectById("cl.hospital.main.Order", oid);
		request.setAttribute("order", torder);
		return "pay";
	}
	/**
	 * 付费成功
	 * @return
	 * @throws Exception
	 */
	public String orderPaysuccess()throws Exception{
		request.setAttribute("oid", 0);
		request.setAttribute("save", "付费成功，3秒后跳转至首页，请稍后···");
		return "orderlist";
	}
	/**
	 * 查看我已经预约过的信息
	 * @return
	 * @throws Exception
	 */
	public String ordercheck()throws Exception{
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		int id = user.getUserid();
		String hql = " where tid = ?";
		
		Object[] queryParams = {id};
		
		pagemodel = dorder.find("Order", pageNo, 2, hql, queryParams);
		request.setAttribute("dlist", pagemodel);
		return"check";
	}
	/***
	 * 用户删除预约订单
	 * @return
	 * @throws Exception
	 */
	public String delOreder()throws Exception{
		torder = dorder.finObjectById("cl.hospital.main.Order", uid);
	 int timeid = torder.getTimeid();
	 request.getSession().setAttribute("timeid", timeid);
		boolean count=dorder.delObject(torder);
		if(count){
			request.setAttribute("oid", 98);
			
			return "orderlist";
		}else{
			return "error";
		}
		
	}
	/***
	 * 验证该用户是否已经预约过今天的号
	 * @return
	 * @throws Exception
	 */
	public String onlyOrder()throws Exception{
		date=new String(date.getBytes("iso-8859-1"),"UTF-8");
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		int id = user.getUserid();
		String hql = "from Order where tid = "+id;
		tlist = dorder.findAllObject(hql);
		
		boolean count = false;
		for(int i=0;i<tlist.size();i++){
			Order ordercheck =  (Order) tlist.get(i);
			if(date.equals(ordercheck.getOtime())){
				count = true;
				break;
			}
		}
		if(count){
			request.setAttribute("save", "你已经预约过这天的号，请先去就诊或者预约其他日期的号。正在为您跳转回全部医生界面···");
		
			request.setAttribute("oid", 580);
			return "orderlist";
		}else{
			request.getSession().setAttribute("date", date);
			request.getSession().setAttribute("did", oid);
			request.setAttribute("oid", 581);
			return "orderlist";
		}
	}
/*------------------------------后台分割线--------------------------
*/
	/***
	 * 后台管理员查看全部预约信息
	 * @return
	 * @throws Exception
	 */
	public String checkOrder()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/order/orderList.jsp");
		pagemodel = dorder.find("Order", pageNo, 2);
		request.setAttribute("dlist", pagemodel);
		return"adminsuccess";
	}
	/***
	 * 后台医生查看全部预约信息
	 * @return
	 * @throws Exception
	 */
	public String DcheckOrder()throws Exception{
		request.setAttribute("adminmainPage", "/adminjsp/order/orderList.jsp");
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		int depid = user.getDeid();
		tlist =  (List) request.getSession().getAttribute("list");
		String name="null";
		for(int i=0;i<tlist.size();i++){
			Department department = (Department) tlist.get(i);
			if(department.getId()==depid){
				name = department.getName();
				break;
			}
		}
			String hql = " where kesi = ?";
		
		Object[] queryParams = {name};
		
		pagemodel = dorder.find("Order", pageNo, 2, hql, queryParams);
		request.setAttribute("dlist", pagemodel);
		
		return"adminsuccess";
	}
	/***
	 * 后台设置为已经就诊，删除订单
	 * @return
	 * @throws Exception
	 */
	 public String admindelOreder()throws Exception{
		 request.setAttribute("adminmainPage", "/adminjsp/order/save.jsp"); 
		 torder = dorder.finObjectById("cl.hospital.main.Order", uid);
		 int timeid = torder.getTimeid();
		 request.getSession().setAttribute("timeid", timeid);
			boolean count=dorder.delObject(torder);
			if(count){
				request.setAttribute("oid", 0);
				return "adminsuccess";
			}else{
				return "error";
			}
	 }
	public void setServletRequest(HttpServletRequest request) {
		
		this.request = request;
		
	}

}
