<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@font-face {

  font-family: Bebedera;

  src: url('resources/font/A Bebedera.ttf');

}
#home{
font-size: 18pt;
margin-bottom: 23px;
text-align: left;
width: 1000px;
font-family: Bebedera;

}



.div_all {padding-left: 50px;}

.contact .bus { line-height: 24px;  }

.contact {font-size: 9pt;}

.contact  td {padding: 8px; border-bottom: 1px solid gray; padding-left: 34px;  }

.contact th{border-bottom: 1px solid red;}

.td_1 {border-top: 2px solid black;
      }
      
td .td_1 {
width:700px;

}

</style>
   <meta charset="utf-8"/>
   <title>Kingsman 오시는 길</title>
<script>
function coordinateMark() {
   var address = document.getElementById('mapaddr').value;
   
   // 주소로 좌표를 검색합니다
   geocoder.addressSearch(address, function(result, status) {

       // 정상적으로 검색이 완료됐으면 
        if (status === daum.maps.services.Status.OK) {

           var coords = new daum.maps.LatLng(result[0].y, result[0].x);

           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new daum.maps.Marker({
               map: map,
               position: coords
           });

           // 인포윈도우로 장소에 대한 설명을 표시합니다
           var infowindow = new daum.maps.InfoWindow({
               content: '<div style="width:150px;text-align:center;padding:6px 0;">주소 위치</div>'
           });
           infowindow.open(map, marker);

           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.setCenter(coords);
       } 
   });
}

/* function setCenter() {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new daum.maps.LatLng(33.452613, 126.570888);
       
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

function panTo() {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new daum.maps.LatLng(33.450580, 126.574942);
       
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);            
}
    
// 지도 레벨은 지도의 확대 수준을 의미합니다
// 지도 레벨은 1부터 14레벨이 있으며 숫자가 작을수록 지도 확대 수준이 높습니다
function zoomIn() {        
    // 현재 지도의 레벨을 얻어옵니다
    var level = map.getLevel();
          
    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
    map.setLevel(level - 1);
          
    // 지도 레벨을 표시합니다
    displayLevel();
}    

function zoomOut() {    
    // 현재 지도의 레벨을 얻어옵니다
    var level = map.getLevel(); 
          
    // 지도를 1레벨 올립니다 (지도가 축소됩니다)
    map.setLevel(level + 1);
          
    // 지도 레벨을 표시합니다
    displayLevel(); 
}    
       
function displayLevel(){
    var levelEl = document.getElementById('maplevel');
    levelEl.innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
}

function getInfo() {
    // 지도의 현재 중심좌표를 얻어옵니다 
    var center = map.getCenter(); 
    
    // 지도의 현재 레벨을 얻어옵니다
    var level = map.getLevel();
    
    // 지도타입을 얻어옵니다
    var mapTypeId = map.getMapTypeId(); 
    
    // 지도의 현재 영역을 얻어옵니다 
    var bounds = map.getBounds();
    
    // 영역의 남서쪽 좌표를 얻어옵니다 
    var swLatLng = bounds.getSouthWest(); 
    
    // 영역의 북동쪽 좌표를 얻어옵니다 
    var neLatLng = bounds.getNorthEast(); 
    
    // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
    var boundsStr = bounds.toString();
    
    
    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', ';
    message += '경도 ' + center.getLng() + ' 이고 <br>';
    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
    
    // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
    //console.log(message);
    var mapInfoEl = document.getElementById('mapInfo');
    mapInfoEl.innerHTML = message;
} */


 


</script>   
   
   
</head>
<body>
<div class="div_all">   
   <br /><br /><br /><br /><br /><br />
   <div id="home">오시는 길 </div>
   <div id="map" style="width:879px;height:450px;"></div>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a8171a905af7e1bf656778ff3acc5b3"></script>
   <script>
/*       var container = document.getElementById('map');
      var options = {
         center: new daum.maps.LatLng(37.499240, 127.032909),
         level: 3
      };

      var map = new daum.maps.Map(container, options); */
      
      
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = { 
          center: new daum.maps.LatLng(37.499240, 127.032909), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
      };

      var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

      //마커가 표시될 위치입니다 
      var markerPosition  = new daum.maps.LatLng(37.499240, 127.032909); 

      //마커를 생성합니다
      var marker = new daum.maps.Marker({
      position: markerPosition
      });

      //마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

      //아래 코드는 지도 위의 마커를 제거하는 코드입니다
      //marker.setMap(null);   
      
      
      
      
      
      
   </script>
   <br /> <br /> <br />
    <table class="contact" border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
               <th class="td_1">주소</th>
               <td class="td_1" height="30">서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F (T: 1544-9970 / F: 02-562-2378)</td>
            </tr>
            <tr>
               <th>버스</th>
               <td class="bus" height="50" width="800">
                  역삼역.포스코P&amp;S타워 정류장<br>
                     <img src="/kingsman/resources/images/sub01_06_busR.jpg"
          /> 146 / 740 / 341 / 360 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/kingsman/resources/images/sub01_06_busB.jpg" alt="간선"> 1100 / 1700 / 2000 / 7007 / 8001
               </td>
            </tr>
            <tr>
               <th>지하철</th>
               <td height="30">지하철 2호선 역삼역 3번출구 100m</td>
            </tr>
            </tbody>
   </table>
   <br />
   <br />
   <br />
   <br />
   <br />
   <br />
   <br />
   <br />
   <br />
   <br />
   </div>

       
<%--          <img src="${pageContext.request.contextPath}/images/asd.jpg"
         width="150" height="100" />
         
          
         <img src="${pageContext.request.contextPath}/images/123.png"
         width="150" height="100" /> --%>
      
   
      
   
   
   
<!--    <p>
      <button onclick="setCenter()">지도 중심좌표 이동시키기</button> 
      <button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button>      
   </p>
   <p>
       <button onclick="zoomIn()">지도레벨 - 1</button>
       <button onclick="zoomOut()">지도레벨 + 1</button>
       <span id="maplevel"></span>
   </p>
   <p>
      <button onclick="getInfo()">지도 정보 가져오기</button>
   </p>
   <div id="mapInfo"></div>
   <p><em>지도를 클릭해주세요!</em></p> 
   <p id="result"></p>
   <p>
      주소 : <input type="text" id="mapaddr"><br>
      <button onclick="coordinateMark()">주소로 좌표 표시하기</button>
   </p>
    -->
   
   
   
</body>
</html>