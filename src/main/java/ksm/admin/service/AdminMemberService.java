package ksm.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminMemberService {
	
	List<Map<String, Object>> adminMemberList(Map<String,Object> map) throws Exception;
	List<Map<String, Object>> adminMemberSearchList(Map<String,Object> map) throws Exception;
	List<Map<String, Object>> adminMemberSearchList2(Map<String,Object> map) throws Exception;
	List<Map<String, Object>> adminCouponList(Map<String,Object> map) throws Exception;
	List<Map<String, Object>> adminSearchCouponList(Map<String,Object> map) throws Exception;
	void adminCouponCreate(Map<String,Object> map) throws Exception;
	void insertCouponInfo(Map<String,Object> map) throws Exception;
	Map<String,Object> couponInfo(Map<String, Object> map) throws Exception;
	List<Map<String,Object>> delgb_y_list(Map<String,Object> map) throws Exception;
	List<Map<String,Object>> delgb_y_list2(Map<String,Object> map) throws Exception;
	void deleteMem(Map<String,Object> map) throws Exception;
	void deleteAll(Map<String,Object> map) throws Exception;
	void saveMember(Map<String,Object> map) throws Exception;
	void coupondelete(Map<String,Object> map) throws Exception;

}
