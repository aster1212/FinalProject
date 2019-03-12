<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    
    
<!DOCTYPE html>
<html>
<head>



        <style>
@font-face { 
   font-family: "NotoSansKR-Light"; 
   src: url('/kingsman/resources/font/NotoSansKR-Light.ttf');
}
        
table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 2px solid #444444;
    border-bottom: 3px solid #444444;
    margin: auto;
    width: 100%;
}
table.type05 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    text-align: center;
}

#memModifyBtn
{
   border: none;
   border-radius: 10px;
   background-color: #000000;
   width : 120px;
   height: 30px;
   text-align:center;
   font-family: "NotoSansKR-Light";
   font-size: 15px;
   font-weight:bold;
   color:#FFFFFF;
}
#memModifyBtn:hover
{
   border: none;
   outline:none;
   border-radius: 10px;
   background-color: #50DEAA;
   width : 120px;
   height: 30px;
   text-align:center;
   font-family: "NotoSansKR-Light";
   font-size: 15px;
   font-weight:bold;
   color:#FFFFFF;
}

        </style>
        
<meta charset="UTF-8">
<title>Insert title here</title>



<script type="text/javascript">
function check(){
if (confirm("환불 신청을 하시겠습니까?") == false){    //확인
	 return false;
}else{  
		alert('환불신청이 완료되었습니다')
		return true;
	}
}
</script>


</head>

<body>
		
<br>
<br>
<br>
<br>		
<table cellspacing="0" border="1" class="type05">
<div>
<FONT SIZE="6" COLOR="black" FACE="돋움체">주문내역</FONT>
</div>
<br>
<colgroup>
<col width="15%">
<col width="10%">
<col width="13%">
<col width="10%">
<col width="25%">
<col width="15%">
<col width="17%">
</colgroup><thead>
<tr>
<th scope="col">주문번호</th>
<th scope="col">주문자</th>
<th scope="col">주문상태</th>
<th scope="col">주문일자</th>
<th scope="col">배송지</th>
<th scope="col">거래수단</th>
<th scope="col">결제금액</th>
</tr>

</thead>

<tbody>

<tr>
<td>
${Detail.ORDER_NO}
</td>

<td>
	${Detail.ORDER_NAME}
</td>

<td>

	<div class="send">
		<c:choose>
<c:when test="${Detail.ORDER_STATE==0}">주문취소</c:when>
<c:when test="${Detail.ORDER_STATE==1}">주문완료</c:when>
<c:when test="${Detail.ORDER_STATE==2}">배송준비중</c:when>
<c:when test="${Detail.ORDER_STATE==3}">배송완료</c:when>
<c:when test="${Detail.ORDER_STATE==4}">구매완료</c:when>
<c:when test="${Detail.ORDER_STATE==5}">교환처리중</c:when>
<c:when test="${Detail.ORDER_STATE==6}">환불처리중</c:when>
<c:when test="${Detail.ORDER_STATE==7}">교환처리완료</c:when>
<c:when test="${Detail.ORDER_STATE==8}">환불처리완료</c:when>
<c:when test="${Detail.ORDER_STATE==9}">배송중</c:when>
<c:otherwise>처리완료</c:otherwise>
</c:choose> 
	</div>
	
</td>



<td>
	${Detail.ORDER_DATE}
</td>

<td>
	 ${Detail.ORDER_ADDR}
</td>


	
		<td>
		<div>
<c:choose>	
		<c:when test="${Detail.ORDER_PAYMENT==1}">
			신용카드		
		</c:when>
	<c:otherwise>
			무통장입금			
	</c:otherwise>
</c:choose>
		</td>
		</div>
		
<td>
<div>
<fmt:formatNumber value="${Detail.ORDER_TOTALPAYMENT}" pattern="#,###"/>원
</div>
</td>
		
</tr>
</table>

<br>
<br>


<div class="orderListArea ">
         <div class="title">
            <FONT SIZE="6" COLOR="black" FACE="돋움체">상세내역</FONT>
         </div>
         
         <div class="ec-base-table typeList ">
         
            <table cellspacing="0" border="1" class="type05">
               <colgroup>
                  <col style="width: 10%">
                  <col style="width: 20%">
                  <col style="width: 10%">
                  <col style="width: 10%">
                  <col style="width: 10%">
                  <col style="width: 10%">
                   <col style="width: 10%">
               </colgroup>
                 <thead>
                  <tr>   
                     <th scope="col">물품번호</th>
                     <th scope="col">상품이름</th>
                     <th scope="col">옵션</th>
                     <th scope="col">색상</th>
                     <th scope="col">사이즈</th>
                     <th scope="col">수량</th>
                     <th scope="col">판매가</th>
                  </tr>
               </thead>
               <tfoot class="right">
               
               <c:set var = "total" value = "0" />      
               
                  <c:choose>
            <c:when test="${fn:length(list) > 0}">
            
               <c:forEach items="${list}" var="row" varStatus="status">
                 <tr>
                          <td>${row.ORDER_NO}</td>
                     <td>${row.ORDERITEM_NAME}</td>                     
                     <td>${row.ORDERITEM_OPTION}</td>
                     <td>${row.ORDERITEM_COLOR}</td>   
                     <td>${row.ORDERITEM_SIZE}</td>       
                     <td>${row.ORDERITEM_COUNT}</td>
                     <td>${row.ORDERITEM_PRICE}</td>
                     
              </tr>
              
            <c:set var= "sum" value="${row.ORDERITEM_COUNT * row.ORDERITEM_PRICE}"/>
            <c:set var= "total" value="${total + sum}"/>            
               </c:forEach>
                  
                 </br>
                   
            </c:when>
            
            <c:otherwise>
               <tr>
                  <td colspan="4">조회된 상품이 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
               </tfoot>             
               </table>
                
               </div>
         </div>
         
         



<div style="margint-left: auto;">

<br>
<br>

 <form id="refundForm" action="refund" onsubmit="return check();">

						
						 <input type="hidden" id="ORDER_STATE" name="ORDER_STATE" value="6">
						 <input type="hidden" id="ORDER_NO" name="ORDER_NO" value="${Detail.ORDER_NO}">
					
			
</div>

<br>
<div style="margint-left: auto;">
<img src="/kingsman/resources/upload/exchangeReg.jpg" alt="이미지 없음" height="50%" width="100%" />
</div>

<br>
		<div style="margint-left: auto;">
					<input type="submit" id="memModifyBtn" value="환불신청" style="cursor:pointer">
		</div>

</form>
</body>
<br>
<br>
<br>

</html>