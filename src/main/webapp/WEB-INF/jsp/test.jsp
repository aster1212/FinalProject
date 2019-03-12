<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#graphContainer{
		width: 1000px;
		height: 500px;
		border-left:2px solid;
		border-bottom:2px solid;
		text-align: center;
		
		background: olive;
	}
	
	.graphBox{
		width: 50px;
		height: inherit;
		line-height:100%;
		
		background: aqua;
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
	#graphFor9{height: 50%;}
	#graphFor10{}
	#graphFor11{}
	
	.graph{
		width: 20px;
		display: inline-block;
		height: 30%;
		background: purple;
	}
	
	.tabler{
		width:inherit;
		height:inherit;
		display: table-cell;
		vertical-align: bottom;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		fn_calGraph();
	});
	
	function fn_calGraph() {
		var monthArray = new Array();
		for(var i=0; i < 12; i++){
			monthArray[i] = i;
		}
	}
</script>
</head>
<body>

<div id="graphContainer">
	
	<c:forEach begin="0" end="11" varStatus="stat">
		
		<div class="graphBox">
			
			<div class="tabler">
				<div id="graphFor${stat.index}" class="graph">
				</div>
			</div>
			
		</div>
		
	</c:forEach>
	
</div>

</body>
</html>