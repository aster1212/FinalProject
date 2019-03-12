package ksm.common.utils;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import ksm.common.common.CommandMap;
import ksm.member.service.MemberService;

@Component("GradeUtils")
public class MemberGradeCoupon {
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	public Map<String, Object> GradeCheck(CommandMap commandMap,HttpServletRequest request) throws Exception
	{
		HttpSession session = request.getSession();
		commandMap.put("member_id", session.getAttribute("idSession"));
		Map<String,Object> gradelist = memberService.memberGrade(commandMap.getMap());
		int DBgrade = Integer.parseInt(gradelist.get("MEMBER_MEM_GB").toString());
		int SSgrade = Integer.parseInt(session.getAttribute("memgrade").toString());
		
		System.out.println("=======여기부터는 유틸스 확인부분이다.");
		System.out.println("변경전 Grade 잘받아지나??"+session.getAttribute("memgrade")+"    아이디 : "+session.getAttribute("idSession"));
		System.out.println("데이터베이스 Grade : ="+gradelist.get("MEMBER_MEM_GB")+" 데이터베이스 아이디 : "+gradelist.get("MEMBER_ID"));
		
		if(SSgrade==DBgrade)
		{
			System.out.println("등급이 같아서 아무일도 없었다.");
		}
		else
		{
			if(DBgrade==10)
			{
				System.out.println("Bronze등급 쿠폰 Insert COU_ORIGIN_NO=2");
				memberService.Coupon_Bronze(commandMap.getMap());
				session.removeAttribute("memgrade");
				session.setAttribute("memgrade", gradelist.get("MEMBER_MEM_GB"));
			}
			else if(DBgrade==20)
			{
				System.out.println("Silver등급 쿠폰 Insert COU_ORIGIN_NO=3");
				for(int i=SSgrade;i<=DBgrade;i=i+10)
				{
					System.out.println(i);
					if(0<=i&&i<10) {memberService.Coupon_Bronze(commandMap.getMap());}
					if(10<=i&&i<20) {memberService.Coupon_Silver(commandMap.getMap());}
				}
				session.removeAttribute("memgrade");
				session.setAttribute("memgrade", gradelist.get("MEMBER_MEM_GB"));
			}
			else if(DBgrade==30)
			{
				System.out.println("gold등급 쿠폰 Insert COU_ORIGIN_NO=4");
				for(int i=SSgrade;i<=DBgrade;i=i+10)
				{
					System.out.println(i);
					if(0<=i&&i<10) {memberService.Coupon_Bronze(commandMap.getMap());}
					if(10<=i&&i<20) {memberService.Coupon_Silver(commandMap.getMap());}
					if(20<=i&&i<30) {memberService.Coupon_Gold(commandMap.getMap());}
				}
				session.removeAttribute("memgrade");
				session.setAttribute("memgrade", gradelist.get("MEMBER_MEM_GB"));
			}
			else if(DBgrade==40)
			{
				System.out.println("Diamond등급 쿠폰 Insert COU_ORIGIN_NO=5");
				for(int i=SSgrade;i<=DBgrade;i=i+10)
				{
					System.out.println(i);
					if(0<=i&&i<10) {memberService.Coupon_Bronze(commandMap.getMap());}
					if(10<=i&&i<20) {memberService.Coupon_Silver(commandMap.getMap());}
					if(20<=i&&i<30) {memberService.Coupon_Gold(commandMap.getMap());}
					if(30<=i&&i<40) {memberService.Coupon_Diamond(commandMap.getMap());}
				}
				session.removeAttribute("memgrade");
				session.setAttribute("memgrade", gradelist.get("MEMBER_MEM_GB"));
			}
			else if(DBgrade==50)
			{
				System.out.println("Kingsman등급 쿠폰 Insert COU_ORIGIN_NO=6");
				for(int i=SSgrade;i<=DBgrade;i=i+10)
				{
					System.out.println(i);
					if(0<=i&&i<10) {memberService.Coupon_Bronze(commandMap.getMap());}
					if(10<=i&&i<20) {memberService.Coupon_Silver(commandMap.getMap());}
					if(20<=i&&i<30) {memberService.Coupon_Gold(commandMap.getMap());}
					if(30<=i&&i<40) {memberService.Coupon_Diamond(commandMap.getMap());}
					if(40<=i&&i<50) {memberService.Coupon_Kingsman(commandMap.getMap());}
				}
				session.removeAttribute("memgrade");
				session.setAttribute("memgrade", gradelist.get("MEMBER_MEM_GB"));
			}
		}
		System.out.println("========유틸스가 끝나는 부분이다.");
		return gradelist;
	}

}
