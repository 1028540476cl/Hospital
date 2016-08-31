package cl.hospital.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import cl.hospital.dao.RevertDaoImpl;
import cl.hospital.main.Revert;
import cl.hospital.main.User;

import com.opensymphony.xwork2.ActionSupport;

public class RevertAction  extends ActionSupport implements ServletRequestAware{
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private RevertDaoImpl redao = new RevertDaoImpl();
	private Revert revert = new Revert();
	private Revert re = new Revert();
	private int mid;
	private String contert;
	private Integer rid;
	
	
	
	
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
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public Revert getRe() {
		return re;
	}
	public void setRe(Revert re) {
		this.re = re;
	}
	public RevertDaoImpl getRedao() {
		return redao;
	}
	public void setRedao(RevertDaoImpl redao) {
		this.redao = redao;
	}
	public Revert getRevert() {
		return revert;
	}
	public void setRevert(Revert revert) {
		this.revert = revert;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	/***
	 * 回复留言
	 * @return
	 * @throws Exception
	 */
	public String saveRevert()throws Exception{ 
		contert=new String(contert.getBytes("iso-8859-1"),"UTF-8");//解决action中url传值得乱码问题
		//System.out.println(contert);
		re.setContert(contert);
		request.setAttribute("adminmainPage", "/jsp/revert/save.jsp");
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		String datetime = new SimpleDateFormat("yyyy-MM-dd EEEE")
		.format(Calendar.getInstance().getTime()); //获取系统时间。格式是年月日 星期
		re.setRevertTime(datetime);
		re.setRname(user.getUsername());
		boolean count;
		count = redao.saveObject(re);
		if(count){
			request.setAttribute("save", "回复成功，正在跳转至留言列表...");
			request.getSession().setAttribute("re", re);
			request.setAttribute("mid", mid);
			return "adminsuccess";
		}else{
			request.setAttribute("save", "保存失败，请重新加留言..");
			return "error";
		}
	}
	/***
	 * 更新医生的回复
	 * @return
	 * @throws Exception
	 */
	public String updateRevert()throws Exception{
		request.setAttribute("adminmainPage", "/jsp/revert/save.jsp");
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		String datetime = new SimpleDateFormat("yyyy-MM-dd EEEE")
		.format(Calendar.getInstance().getTime()); //获取系统时间。格式是年月日 星期
		re.setRevertTime(datetime);
		re.setRname(user.getUsername());
		boolean count;
		count = redao.updateObject(re);
		if(count){
			request.setAttribute("save", "回复成功，正在跳转至留言列表...");
			request.getSession().setAttribute("re", re);
			request.setAttribute("mid", mid);
			return "adminsuccess";
		}else{
			request.setAttribute("save", "保存失败，请重新加留言..");
			return "error";
		}
		}
	/**
	 * 医生删除回复
	 * @return
	 * @throws Exception
	 */
	public String delRevert()throws Exception{
		request.setAttribute("adminmainPage", "/jsp/message/save.jsp");
		revert = redao.finObjectById("cl.hospital.main.Revert", rid);
		boolean count;
		count = redao.delObject(revert);
		if(count){
			request.setAttribute("save", "删除成功，正在跳转回留言列表...");
			return "adminsuccess";
		}else{
			request.setAttribute("save", "删除失败，请重试..");
			return "error";
		}
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
		
	}

}
