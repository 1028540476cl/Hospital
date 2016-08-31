package cl.hospital.util;

import java.util.List;

public class PageModel <T>{
	
	private int totalRecords;//总记录数
	private List<T> list;//结果集合
	private int pageNo;//当前页码
	private int pageSize;//每页显示的数据数
	/*private int nextPageNo;//下一页
	private int bottomPageNo;//尾页
	private int previousPageNo;//上一页
	private int topPageNo; //首页
	private int totalPages; //总记录数
*/	
	
	 /*
	  *  获取第一页
	  */
	 
	public int getTopPageNo(){
		return 1;
	}
	
	 /*
	  *  取得上一页
	  */
	 
	public int getPreviousPageNo(){
		if(pageNo<=1){
			return 1;
		}
		return pageNo-1;
	}
	
	 /*
	  *  获取下一页
	  */
	 
	public int getNextPageNo(){
		if(pageNo>=getTotalPages()){
			return getTotalPages()==0?1:getTotalPages();
		}
		return pageNo+1;
	}
	
	/*
	 *  获取最后一页
	 */
	 
	public int getBottomPageNo(){
		return getTotalPages()==0?1:getTotalPages();
	}
	
	 /*
	  * 获取总页数 
	  */
	 
	public int getTotalPages(){
		return (totalRecords + pageSize-1)/pageSize;
	}
	
	/**
	 * get set 方法
	 * @return
	 */
	
	public int getTotalRecords() {
		return totalRecords;
	}

	/*public void setPreviousPageNo(int previousPageNo) {
		this.previousPageNo = previousPageNo;
	}

	public void setTopPageNo(int topPageNo) {
		this.topPageNo = topPageNo;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}

	public void setBottomPageNo(int bottomPageNo) {
		this.bottomPageNo = bottomPageNo;
	}*/
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	

}
