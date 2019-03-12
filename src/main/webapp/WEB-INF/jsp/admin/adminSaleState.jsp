<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

   
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
   #graphContainer{
      width: 1000px;
      height: 500px;
      border-left:2px solid;
      border-bottom:2px solid;
      text-align: center;
      margin-left: 100px;
   }
   
   .graphBox{
      width: 50px;
      height: inherit;
      line-height:100%;
      
      display: inline-block;
      margin: 0 1%;
   }
   
   #graphFor0{}
   #graphFor1{}
   #graphFor2{}
   #graphFor3{}
   #graphFor4{}
   #graphFor5{}
   #graphFor6{}
   #graphFor7{}
   #graphFor8{}
   #graphFor9{}
   #graphFor10{}
   #graphFor11{}
   
   .graph{
      width: 20px;
      display: inline-block;
      background: #BE6AFF;
   }
   
   .tabler{
      width:inherit;
      height:inherit;
      display: table-cell;
      vertical-align: bottom;
   }
   
   #graphY{
      width:100px;
      height:500px;
      position:absolute;
   }
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
   $('.money').each(function() {
      $(this).text($(this).text().format());
   });
});
//숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.format = function(){
    if(this==0) return 0;

    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');

    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

    return n;
};
// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";

    return num.format();
};
</script>
</head>
<body>
<br><br><br><br>
   <h2>매출현황(최근12개월)</h2>
   <table class="board_list">
      <colgroup>
         <col width="40%" />
         <col width="*" />
      </colgroup>
      <thead>
      </thead>
      <tbody>   
      <!--  -->
<div id="graphAll" style="margin-top:100px;">
   <div id="graphY">
      <c:set var="Yheight" value="0"/>
      <c:forEach begin="0" end="10" varStatus="stat">
         <div id="y${stat.index}" style="position: absolute; bottom: ${stat.index*10}%; right:0%; float:right;">
            <span class="money">${graphYArray[stat.index]}</span>
         </div>
      </c:forEach>
      
   </div>
   
   <div id="graphContainer">
      <c:set var="num" value="11"></c:set>
      <c:forEach items="${list}" begin="0" end="11" varStatus="stat">
         <c:set var="rate" value="${(stateArray[num]/graphMaxSize)*100}"></c:set>
         <div class="graphBox">
            
            <div class="tabler">
               <div id="graphFor${stat.index}" class="graph" style="height: ${rate}%">
                  <!-- <div style="position: absolute; top:-50px;"></div> -->
                  <div style="position: absolute; margin-top:-20px;"><span class="money" style="font-size: 5px;">${stateArray[num]}</span></div>
               </div>
            </div>
            
            <div style="position: absolute; margin:10px 0 0 10px;">${list.get(num).MONTH}월</div>
         </div>
         <c:set var="num" value="${num-1}"/>
      </c:forEach>
      
   </div>
</div>
      <!--  -->
      </tbody> 
      
   </table>
   <br />
      <h3>합계 : <fmt:formatNumber value="${total}" pattern="#,###"/>원</h3>
      
   <hr>
      <h2>12개월 이전</h2>
   <table class="board_list">
      <colgroup>
         <col width="40%" />
         <col width="*" />
      </colgroup>
      <thead>
         <tr>
            <th scope="col">날짜(단위:월)</th>
            <th scope="col">매출액</th>
         </tr>
      </thead>
      <tbody>   
      <c:set var = "total2" value = "0" />               
         <c:choose>
            <c:when test="${fn:length(list) > 0}">
               <c:forEach items="${list}" var="row" begin="12" end="23" varStatus="status">   
      
            <tr>
            <td>${row.YEAR}년 ${row.MONTH}월</td>
            <td><fmt:formatNumber value="${row.SUMRESULT}" pattern="#,###"/>원</td>
            </tr>
            
            <c:set var= "total2" value="${total2 + row.SUMRESULT}"/>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="4">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
      </tbody> 
      
   </table>
   <br />
      <h3>합계 : <fmt:formatNumber value="${total2}" pattern="#,###"/>원</h3>
</body>
</html>