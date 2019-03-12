package ksm.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ksm.common.dao.AbstractDAO;

@Repository("adminMemberDAO")
public class AdminMemberDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> adminMemberList(Map<String,Object> map) throws Exception
	{
		return (List<Map<String, Object>>)selectList("admin.adminMemberList");
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> adminMemberSearchList(Map<String,Object> map) throws Exception
	{
		return (List<Map<String, Object>>)selectList("admin.adminMemberSearchList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> adminMemberSearchList2(Map<String,Object> map) throws Exception
	{
		return (List<Map<String, Object>>)selectList("admin.adminMemberSearchList2",map);
	}
	
	public void adminCouponCreate(Map<String,Object> map) throws Exception
	{
		insert("admin.adminCouponCreate",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> adminCouponList(Map<String,Object> map) throws Exception
	{
		return (List<Map<String,Object>>)selectList("admin.adminCouponList");
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> adminSearchCouponList(Map<String,Object> map) throws Exception
	{
		return (List<Map<String,Object>>)selectList("admin.adminSearchCouponList",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> couponInfo(Map<String,Object> map) throws Exception
	{
		return (Map<String,Object>)selectOne("admin.couponInfo",map);
	}
	
	public void insertCouponInfo(Map<String,Object> map) throws Exception
	{
		insert("admin.insertCouponInfo",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> delgb_y_list(Map<String,Object> map) throws Exception
	{
		return (List<Map<String,Object>>)selectList("admin.delgb_y_list");
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> delgb_y_list2(Map<String,Object> map) throws Exception
	{
		return (List<Map<String,Object>>)selectList("admin.delgb_y_list2",map);
	}
	
	public void deleteMem(Map<String,Object> map) throws Exception
	{
		delete("admin.deleteMem",map);
	}
	
	public void deleteAll(Map<String,Object> map) throws Exception
	{
		delete("admin.deleteAll",map);
	}
	public void saveMember(Map<String,Object> map) throws Exception
	{
		update("admin.saveMember",map);
	}
	public void coupondelete(Map<String,Object> map) throws Exception
	{
		delete("admin.coupondelete",map);
	}
}
