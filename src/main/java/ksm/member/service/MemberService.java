package ksm.member.service;

import java.util.List;
import java.util.Map;


public interface MemberService {
	
	int selectMemberID(Map<String, Object> map) throws Exception;
	
	void insertMemberJoin(Map<String,Object> map) throws Exception;
	
	Map<String,Object> selectMemberInfo(Map<String,Object> map) throws Exception;
	
	String selectFindId(Map<String,Object> map) throws Exception;
	
	String selectFindPw(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> selectMemberInfoList(Map<String,Object> map) throws Exception;
	
	void updateMember(Map<String,Object> map) throws Exception;
	
	void updateMemDelete(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> memberCouponList(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> memberCouponList2(Map<String,Object> map) throws Exception;
	
	int memberCouponCount(Map<String,Object> map) throws Exception;
	
	void updateCouState(Map<String,Object> map) throws Exception;
	
	Map<String,Object> MemAlertPass(Map<String,Object> map) throws Exception;
	
	/*등급업 쿠폰부분*/
	
	Map<String,Object> memberGrade(Map<String,Object> map) throws Exception;
	void Coupon_Bronze(Map<String,Object> map) throws Exception;
	void Coupon_Silver(Map<String,Object> map) throws Exception;
	void Coupon_Gold(Map<String,Object> map) throws Exception;
	void Coupon_Diamond(Map<String,Object> map) throws Exception;
	void Coupon_Kingsman(Map<String,Object> map) throws Exception;
	List<Map<String,Object>> Coupon_check(Map<String,Object> map) throws Exception;
	List<Map<String,Object>> BirthDayCoupon(Map<String,Object> map) throws Exception;
	void Coupon_Birth(Map<String,Object> map) throws Exception;
	List<Map<String,Object>> memberpurchaseList(Map<String,Object> map) throws Exception;
	List<Map<String,Object>> nonmemberpurchaseList(Map<String,Object> map) throws Exception;
	/* order부분추가 */
	//추가된 부분들
		Map<String, Object> selectMemberInfoList2(Map<String, Object> map) throws Exception;	
		void updateMemberTotal(Map<String,Object> map) throws Exception;
		void updateCouponState(Map<String,Object> map) throws Exception;
		void updateMemberTotal2(Map<String,Object> map) throws Exception;
}
