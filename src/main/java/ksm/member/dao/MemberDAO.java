package ksm.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ksm.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public int selectMemberID(Map<String, Object> map) throws Exception
	{
		Map<String,Object> resultMap = (Map<String,Object>)selectOne("member.selectMemberID",map);
		
		int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
		
		return result;
	}
	
	public void insertMemberJoin(Map<String,Object> map) throws Exception
	{
		insert("member.insertMemberJoin",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectMemberInfo(Map<String,Object> map) throws Exception
	{
		return (Map<String,Object>)selectOne("member.selectMemberInfo",map);
	}
	
	public String selectFindId(Map<String,Object> map) throws Exception
	{
		return (String)selectOne("member.selectFindId",map);
	}
	
	public String selectFindPw(Map<String,Object> map) throws Exception
	{
		return (String)selectOne("member.selectFindPw",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMemberInfoList(Map<String,Object> map) throws Exception
	{
		return (List<Map<String,Object>>)selectList("member.selectMemberInfoList",map);
	}
	
	public void updateMember(Map<String,Object> map) throws Exception
	{
		update("member.updateMember",map);
	}
	
	public void updateMemDelete(Map<String,Object> map) throws Exception
	{
		update("member.updateMemDelete",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> memberCouponList(Map<String,Object> map) throws Exception
	{
		return (List<Map<String,Object>>)selectList("member.memberCouponList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> memberCouponList2(Map<String,Object> map) throws Exception
	{
		return (List<Map<String,Object>>)selectList("member.memberCouponList2",map);
	}
	
	@SuppressWarnings("unchecked")
	public int memberCouponCount(Map<String,Object> map) throws Exception
	{
		Map<String,Object> resultMap = (Map<String,Object>)selectOne("member.memberCouponCount",map);

		int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
		
		return result;
	}
	
	public void updateCouState(Map<String,Object> map) throws Exception
	{
		update("member.updateCouState",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> MemAlertPass(Map<String,Object> map) throws Exception
	{
		return (Map<String,Object>)selectOne("member.MemAlertPass",map);
	}
	
	/*등급업쿠폰시작*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> memberGrade(Map<String,Object> map) throws Exception
	{
		return (Map<String,Object>)selectOne("member.memberGrade",map);
	}
	public void Coupon_Bronze(Map<String,Object> map) throws Exception
	{
		insert("grade.Coupon_Bronze",map);
	}
	public void Coupon_Silver(Map<String,Object> map) throws Exception
	{
		insert("grade.Coupon_Silver",map);
	}
	public void Coupon_Gold(Map<String,Object> map) throws Exception
	{
		insert("grade.Coupon_Gold",map);
	}
	public void Coupon_Diamond(Map<String,Object> map) throws Exception
	{
		insert("grade.Coupon_Diamond",map);
	}
	public void Coupon_Kingsman(Map<String,Object> map) throws Exception
	{
		insert("grade.Coupon_Kingsman",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> Coupon_check(Map<String,Object> map) throws Exception
	{
		return (List<Map<String,Object>>)selectList("grade.Coupon_check",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> BirthDayCoupon(Map<String,Object> map) throws Exception
	{
		return (List<Map<String,Object>>)selectList("grade.BirthDayCoupon",map);
	}
	public void Coupon_Birth(Map<String,Object> map) throws Exception
	{
		insert("grade.Coupon_Birth",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> memberpurchaseList(Map<String,Object> map) throws Exception
	{
		return (List<Map<String,Object>>)selectList("member.memberpurchaseList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> nonmemberpurchaseList(Map<String,Object> map) throws Exception
	{
		return (List<Map<String,Object>>)selectList("member.nonmemberpurchaseList",map);
	}
	
	/* order부분 추가 */
	//추가된 부분들
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectMemberInfoList2(Map<String,Object> map) throws Exception
	{
		return (Map<String,Object>)selectOne("member.selectMemberInfoList2",map);
	}
	public void updateMemberTotal(Map<String,Object> map) throws Exception
	{
		update("member.updateMemberTotal",map);
	}
	
	public void updateCouponState(Map<String,Object> map) throws Exception
	{
		update("member.updateCouponState",map);
	}
	
	public void updateMemberTotal2(Map<String,Object> map) throws Exception
	{
		update("member.updateMemberTotal2",map);
	}
	

}
