package cl.hospital.dao;

import java.util.List;
import java.util.Map;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import cl.hospital.util.PageModel;




public class DateDaoImpl<T>  {
	public SessionFactory sessionFactory  ;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/**
	 * 查找一组数据语句查询
	 * @param hql
	 * @return
	 */
	public T findObjectByString(String hql){
		Session session=null;
		session = sessionFactory.openSession();//获取session
		session.beginTransaction();//开启事物

		@SuppressWarnings("unchecked")
		T t = (T) session.createQuery(hql);
		session.getTransaction().commit();
		return t ;
	}
	/**
	 *  按照id查找
	 * @param T
	 * @param uid
	 * @return
	 */

	@SuppressWarnings("unchecked")
	public T finObjectById(String T, int uid ){
		Session  session = null;
		session = sessionFactory.openSession();//获取session
		session.beginTransaction();//开启事物
		T t = null;
		try {
			t = (T) session.get(Class.forName(T), uid);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			session.flush();//刷新
			session.close();//关闭
		}
		return t;
	}
	/**
	 * 查找全部信息
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> findAllObject(String hql) {
		Session session = null;
		List<T> list =null;
		try{		
			session = sessionFactory.openSession();//获取session
			session.beginTransaction();//开启事物

			list = session.createQuery(hql).list();//查询所有的图书

			session.getTransaction().commit();

		}catch(Exception e){
			e.printStackTrace();//出错将回滚事物
		}finally{
			session.flush();//刷新
			session.close();//关闭
		}

		return list;
	}
	/**
	 * 语句精确查找信息
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> findQueObject(String hql ,String par ) {
		Session session = null;
		List<T> list =null;
		try{		
			session = sessionFactory.openSession();//获取session
			session.beginTransaction();//开启事物

			list =  session.createQuery(hql)
					.setParameter(0, par)
					.list();//精确查询图书

			session.getTransaction().commit();

		}catch(Exception e){
			e.printStackTrace();//出错将回滚事物
		}finally{
			session.flush();//刷新
			session.close();//关闭
		}

		return list;
	}

	/**
	 * 保存一组数据
	 * @param t
	 * @return
	 */
	public boolean saveObject(T t){
		Session session = null;
		boolean count =false;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(t);
			session.getTransaction().commit();
			count=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.flush();//刷新
			session.close();//关闭
		}
		return count;
	}
	/**
	 * 删除一组数据()
	 * @param t
	 * @return
	 */
	public boolean delObject(T t){
		Session session = null;
		boolean count =false;

		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			session.delete(t);
			session.getTransaction().commit();
			count=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.flush();//刷新
			session.close();//关闭
		}
		return count;
	}
	/**
	 * 更新一组数据
	 * @param t
	 * @return
	 */
	public boolean updateObject(T t){
		Session session = null;
		boolean count =false;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			session.update(t);
			session.getTransaction().commit();
			count=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.flush();//刷新
			session.close();//关闭
		}
		return count;
	}

	/**
	 * 登录(适用于User)
	 * @param username
	 * @param password
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public T findUser(String username,String password){
		Session session = null;
		T t =null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			String hql = "from User u where u.username = ? and u.password=?";
			Query query = session.createQuery(hql)
					.setParameter(0, username)
					.setParameter(1, password);
			t = (T) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.flush();//刷新
			session.close();//关闭
		}
		return t;
	}
	/**
	 * 普通分页查询
	 * @param className
	 * @param pageNo
	 * @param maxResult
	 * @return
	 */

	public PageModel<T> find(String className,final int pageNo, int maxResult) {
		return find(className,null, null, null, pageNo, maxResult);
	}
	/**
	 * 搜索分页查询
	 * @param className
	 * @param pageNo
	 * @param maxResult
	 * @param orderby
	 * @return
	 */
	public PageModel<T> find(String className,int pageNo, int maxResult,
			Map<String, String> orderby) {
		return find(className,null, null, orderby, pageNo, maxResult);
	}
	/**
	 * 排序分页查询
	 * @param className
	 * @param pageNo
	 * @param maxResult
	 * @param where
	 * @param queryParams
	 * @return
	 */
	public PageModel<T> find(String className,int pageNo, int maxResult, String where,
			Object[] queryParams) {
		return find(className,where, queryParams, null, pageNo, maxResult);
	}
	/**
	 * 按条件分页并排序查询
	 * @param where 查询条件
	 * @param queryParams hql参数值
	 * @param orderby 排序
	 * @param pageNo 第几页
	 * @param maxResult 返回记录数量
	 * return PageModel
	 */
	@SuppressWarnings("unchecked")
	public PageModel<T> find(String className,final String where, final Object[] queryParams,
			final Map<String, String> orderby, final int pageNo,
			final int maxResult) {
		Session session=null;
		session = sessionFactory.openSession();//获取session
		session.beginTransaction();//开启事物
		final PageModel<T> pageModel = new PageModel<T>();//实例化分页对象
		pageModel.setPageNo(pageNo);//设置当前页数
		pageModel.setPageSize(maxResult);//设置每页显示记录数
		String hql = new StringBuffer().append("from ")//添加form字段
		.append(className)//添加对象类型
		.append(" ")//添加空格
		.append(where == null ? "" : where)//如果where为null就添加空格,反之添加where
		.append(createOrderBy(orderby))//添加排序条件参数
		.toString();//转化为字符串
		Query query = session.createQuery(hql);//执行查询
		setQueryParams(query,queryParams);//为参数赋值
		List<T> list = null;//定义List对象
		// 如果maxResult<0，则查询所有	
		if(maxResult < 0 && pageNo < 0){
		list = query.list();//将查询结果转化为List对象
		}else{
		list = query.setFirstResult(getFirstResult(pageNo, maxResult))//设置分页起始位置
				.setMaxResults(maxResult)//设置每页显示的记录数
				.list();//将查询结果转化为List对象
		//定义查询总记录数的hql语句
		hql = new StringBuffer().append("select count(*) from ")//添加hql语句
					.append(className)//添加对象类型
					.append(" ")//添加空格
					.append(where == null ? "" : where)//如果where为null就添加空格,反之添加where
					.toString();//转化为字符串
		query = session.createQuery(hql);//执行查询
		setQueryParams(query,queryParams);//设置hql参数
		int totalRecords = ((Long) query.uniqueResult()).intValue();//类型转换
		pageModel.setTotalRecords(totalRecords);//设置总记录数
		}
		pageModel.setList(list);//将查询的list对象放入实体对象中
		
		return pageModel;//返回分页的实体对象
		
	}
	/**
	 * 对query中的参数赋值
	 * @param query
	 * @param queryParams
	 */
	protected void setQueryParams(Query query, Object[] queryParams){
		if(queryParams!=null && queryParams.length>0){
			for(int i=0; i<queryParams.length; i++){
				query.setParameter(i, queryParams[i]);
			}
		}
	}
		/**
	 * 创建排序hql语句
	 * @param orderby
	 * @return 排序字符串
	 */
	protected String createOrderBy(Map<String, String> orderby){
		StringBuffer sb = new StringBuffer("");
		if(orderby != null && orderby.size() > 0){
			sb.append(" order by ");
			for(String key : orderby.keySet()){
				sb.append(key).append(" ").append(orderby.get(key)).append(",");
			}
			sb.deleteCharAt(sb.length() - 1);
		}
		return sb.toString();
	}
	/**
	 * 获取分页查询中结果集的起始位置
	 * @param pageNo 第几页
	 * @param maxResult 页面显示的记录数
	 * @return 起始位置
	 */
	protected int getFirstResult(int pageNo,int maxResult){
		int firstResult = (pageNo-1) * maxResult;
		return firstResult < 0 ? 0 : firstResult;
	}
}
