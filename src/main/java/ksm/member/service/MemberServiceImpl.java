package ksm.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ksm.member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public int selectMemberID(Map<String, Object> map) throws Exception
	{
		return memberDAO.selectMemberID(map);
	}
	
	@Override
	public void insertMemberJoin(Map<String,Object> map) throws Exception
	{
		memberDAO.insertMemberJoin(map);
	}
	
	@Override
	public Map<String,Object> selectMemberInfo(Map<String,Object> map) throws Exception
	{
		return memberDAO.selectMemberInfo(map);
	}
	
	public String selectFindId(Map<String,Object> map) throws Exception
	{
		return memberDAO.selectFindId(map);
	}
	
	@Override
	public String selectFindPw(Map<String,Object> map) throws Exception
	{
		return memberDAO.selectFindPw(map);
	}
	
	@Override
	public List<Map<String,Object>> selectMemberInfoList(Map<String,Object> map) throws Exception
	{	
		return memberDAO.selectMemberInfoList(map);
	}
	
	@Override
	public void updateMember(Map<String,Object> map) throws Exception
	{
		memberDAO.updateMember(map);
	}
	
	@Override
	public void updateMemDelete(Map<String,Object> map) throws Exception
	{
		memberDAO.updateMemDelete(map);
	}
	
	@Override
	public List<Map<String,Object>> memberCouponList(Map<String,Object> map) throws Exception
	{	
		return memberDAO.memberCouponList(map);
	}
	
	@Override
	public List<Map<String,Object>> memberCouponList2(Map<String,Object> map) throws Exception
	{	
		return memberDAO.memberCouponList2(map);
	}
	
	@Override
	public int memberCouponCount(Map<String,Object> map) throws Exception
	{
		return memberDAO.memberCouponCount(map);
	}
	
	@Override
	public void updateCouState(Map<String,Object> map) throws Exception
	{
		memberDAO.updateCouState(map);
	}
	
	@Override
	public Map<String,Object> MemAlertPass(Map<String,Object> map) throws Exception
	{
		return memberDAO.MemAlertPass(map);
	}
	
	/*등급업 쿠폰 주기*/
	@Override
	public Map<String,Object> memberGrade(Map<String,Object> map) throws Exception
	{	
		return memberDAO.memberGrade(map);
	}
	@Override
	public void Coupon_Bronze(Map<String,Object> map) throws Exception
	{
		memberDAO.Coupon_Bronze(map);
	}
	@Override
	public void Coupon_Silver(Map<String,Object> map) throws Exception
	{
		memberDAO.Coupon_Silver(map);
	}
	@Override
	public void Coupon_Gold(Map<String,Object> map) throws Exception
	{
		memberDAO.Coupon_Gold(map);
	}
	@Override
	public void Coupon_Diamond(Map<String,Object> map) throws Exception
	{
		memberDAO.Coupon_Diamond(map);
	}
	@Override
	public void Coupon_Kingsman(Map<String,Object> map) throws Exception
	{
		memberDAO.Coupon_Kingsman(map);
	}
	@Override
	public List<Map<String,Object>> Coupon_check(Map<String,Object> map) throws Exception
	{
		return memberDAO.Coupon_check(map);
	}
	@Override
	public List<Map<String,Object>> BirthDayCoupon(Map<String,Object> map) throws Exception
	{
		return memberDAO.BirthDayCoupon(map);
	}
	@Override
	public void Coupon_Birth(Map<String,Object> map) throws Exception
	{
		memberDAO.Coupon_Birth(map);
	}
	@Override
	public List<Map<String,Object>> memberpurchaseList(Map<String,Object> map) throws Exception
	{	
		return memberDAO.memberpurchaseList(map);
	}
	@Override
	public List<Map<String,Object>> nonmemberpurchaseList(Map<String,Object> map) throws Exception
	{	
		return memberDAO.nonmemberpurchaseList(map);
	}
	
	
	/* order부분추가 */
	//추가된부분들
		@Override
		public Map<String,Object> selectMemberInfoList2(Map<String,Object> map) throws Exception
		{
			return memberDAO.selectMemberInfoList2(map);
		}
		
		
		@Override
		public void updateMemberTotal(Map<String,Object> map) throws Exception
		{
			memberDAO.updateMemberTotal(map);
		}
		
		@Override
		public void updateCouponState(Map<String,Object> map) throws Exception
		{
			memberDAO.updateCouponState(map);
		}
		
		@Override
		public void updateMemberTotal2(Map<String,Object> map) throws Exception
		{
			memberDAO.updateMemberTotal2(map);
		}
	
}
