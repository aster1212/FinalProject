package ksm.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ksm.admin.dao.AdminMemberDAO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Resource(name="adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;
	
	public List<Map<String, Object>> adminMemberList(Map<String,Object> map) throws Exception
	{
		return adminMemberDAO.adminMemberList(map);
	}
	public List<Map<String, Object>> adminMemberSearchList(Map<String,Object> map) throws Exception
	{
		return adminMemberDAO.adminMemberSearchList(map);
	}
	public List<Map<String, Object>> adminMemberSearchList2(Map<String,Object> map) throws Exception
	{
		return adminMemberDAO.adminMemberSearchList2(map);
	}
	@Override
	public void adminCouponCreate(Map<String,Object> map) throws Exception
	{
		adminMemberDAO.adminCouponCreate(map);
	}
	
	public List<Map<String,Object>> adminCouponList(Map<String, Object> map) throws Exception
	{
		return adminMemberDAO.adminCouponList(map);
	}
	public List<Map<String,Object>> adminSearchCouponList(Map<String, Object> map) throws Exception
	{
		return adminMemberDAO.adminSearchCouponList(map);
	}
	
	@Override
	public void insertCouponInfo(Map<String,Object> map) throws Exception
	{
		adminMemberDAO.insertCouponInfo(map);
	}
	
	@Override
	public Map<String,Object> couponInfo(Map<String,Object> map) throws Exception
	{
		return adminMemberDAO.couponInfo(map);
	}
	
	public List<Map<String,Object>> delgb_y_list(Map<String,Object> map) throws Exception
	{
		return adminMemberDAO.delgb_y_list(map);
	}
	public List<Map<String,Object>> delgb_y_list2(Map<String,Object> map) throws Exception
	{
		return adminMemberDAO.delgb_y_list2(map);
	}
	
	@Override
	public void deleteMem(Map<String,Object> map) throws Exception
	{
		adminMemberDAO.deleteMem(map);
	}
	
	@Override
	public void deleteAll(Map<String,Object> map) throws Exception
	{
		adminMemberDAO.deleteAll(map);
	}
	
	@Override
	public void saveMember(Map<String,Object> map) throws Exception
	{
		adminMemberDAO.saveMember(map);
	}
	
	@Override
	public void coupondelete(Map<String,Object> map) throws Exception
	{
		adminMemberDAO.coupondelete(map);
	}

}
