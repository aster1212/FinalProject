package ksm.common.utils;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component("pagingUtils")
public class PagingUtils {
	
	private int nowPage,
				showListNum,
				showPageNum,
				totalNum,
				startListNum,
				endListNum,
				startPageNum,
				endPageNum,
				totalPageNum;
	
	private String preUrl = "/kingsman/";
	
	void initializer(HttpServletRequest request, int showListNum, int showPageNum, List<Map<String, Object>> list) {
		
		// 나우 페이지를 받지 않았으면
		if(request.getParameter("nowPage")==null || request.getParameter("nowPage").equals(""))
			this.nowPage = 1;
		else 
			this.nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		// 보여줄 리스트 수와 보여줄 페이지 수를 받지 않았으면
		if(showListNum == 0) showListNum = 10;
		if(showPageNum == 0) showPageNum = 5;
		this.showListNum = showListNum;
		this.showPageNum = showPageNum;
		
		// 총 리스트 수
		this.totalNum = list.size();
		System.out.println("가져온 리스트 개 수" + this.totalNum);
		if(this.totalNum == 0) this.totalNum = 1;
		
		// 페이징 수 계산 - 총 리스트 수 / 보여줄 리스트 수
		this.totalPageNum = this.totalNum/this.showListNum;
		// 페이징 수 계산 후 나머지값이 나올 경우 +1       예) 리스트가 없을 경우, 페이징 수가 0일 경우, 페이징 수가 3까지고 보여줄 게 몇개 더 남았을 경우    
		if((this.totalNum%this.showListNum)>0) this.totalPageNum+=1;
		System.out.println("계산 된 총 페이지 수 : " + this.totalPageNum);
		
		// now page 제한
		if(this.nowPage > this.totalPageNum) this.nowPage = this.totalPageNum;
		if(this.nowPage < 1) this.nowPage = 1;
		
		// 시작 끝 계산
		this.startListNum = ((nowPage-1) * this.showListNum)+1;
		this.endListNum = (nowPage * this.showListNum);
		
		//끝 수 제한
		if(this.endListNum > this.totalNum) this.endListNum = this.totalNum;
		
		// 페이징 시작 수
		this.startPageNum = ((this.nowPage-1) / this.showListNum) * this.showPageNum;
		if(this.startPageNum == 0) this.startPageNum = 1;
		
		// 페이징 끝 수
		this.endPageNum = (((this.nowPage-1) / this.showListNum)+1) * this.showPageNum;
		if(this.endPageNum > this.totalPageNum) this.endPageNum = this.totalPageNum;
	}
	
	public List<Map<String, Object>> cutList(HttpServletRequest request, List<Map<String, Object>> list){
		List<Map<String, Object>> cuttedList = null;
		initializer(request, 0, 0, list);
		
		if(totalNum <= showListNum)
			return list;
		else {
			cuttedList = list.subList(startListNum-1, endListNum);
			return cuttedList;
		}
	}
	
	public List<Map<String, Object>> cutList(HttpServletRequest request, List<Map<String, Object>> list, int showListNum, int showPageNum){
		List<Map<String, Object>> cuttedList = null;
		initializer(request, showListNum, showPageNum, list);
		
		if(totalNum <= showListNum)
			return list;
		else {
			cuttedList = list.subList(startListNum-1, endListNum);
			return cuttedList;
		}
	}

	public String getHtmlStr(HttpServletRequest request, List<Map<String, Object>> list, String urlName) {
		String returnStr="";
		initializer(request, 0, 0, list);
		
		String url = preUrl + urlName+"?";
		
		String prevUrl = url+makeParam("nowPage", nowPage-1);
		String nextUrl = url+makeParam("nowPage", nowPage+1);
		
		
		if(this.nowPage > 1)
			returnStr += "<input type='button' class='pagingBtn' value='prev' onclick=\"window.location='"+prevUrl+"'\">";
		
		/*returnStr += " | " + this.startPageNum + " | ";*/
		returnStr +=  " | " ;
		for(int i = this.startPageNum ; i <= endPageNum; i++) {
			returnStr += "<font ";
			if(nowPage==i)
				returnStr += " id=\"nowPagingNum\" ";
			else
				returnStr += " onclick=\"window.location='"+url+makeParam("nowPage", i)+"'\" class=\"canMove\" ";
			returnStr += ">"+i+"</font>" + " | ";
		}
		
		if(this.nowPage < endPageNum)
			returnStr += "<input type='button' class='pagingBtn' value='next' onclick=\"window.location='"+nextUrl+"'\">";
		
		
		return returnStr;
	}
	
	public String getHtmlStr(HttpServletRequest request, List<Map<String, Object>> list, int showListNum, int showPageNum, String urlName) {
		String returnStr="";
		initializer(request, showListNum, showPageNum, list);
		
		String url = preUrl + urlName+"?";
		
		String prevUrl = url+makeParam("nowPage", nowPage-1);
		String nextUrl = url+makeParam("nowPage", nowPage+1);
		
		
		if(this.nowPage > 1)
			returnStr += "<input type='button' class='pagingBtn' value='prev' onclick=\"window.location='"+prevUrl+"'\">";
		
		/*returnStr += " | " + this.startPageNum + " | ";*/
		returnStr +=  " | " ;
		for(int i = this.startPageNum ; i <= endPageNum; i++) {
			returnStr += "<font ";
			if(nowPage==i)
				returnStr += " id=\"nowPagingNum\" ";
			else
				returnStr += " onclick=\"window.location='"+url+makeParam("nowPage", i)+"'\" class=\"canMove\" ";
			returnStr += ">"+i+"</font>" + " | ";
		}
		
		if(this.nowPage < endPageNum)
			returnStr += "<input type='button' class='pagingBtn' value='next' onclick=\"window.location='"+nextUrl+"'\">";
		
		
		return returnStr;
	}
	
	public int getNowPage() {
		return this.nowPage;
	} 
	
	private String makeParam(String key, Object val) {
		return key+"="+val;
	}
}
