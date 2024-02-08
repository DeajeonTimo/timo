<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.starpoint_box .star_radio{
		width : 0px;
		height : 0px;
		opacity: 0;
		position : absolute;
	}
	.for-the-king {
		filter : grayscale(100%);
	}
</style>
<link href="/css/style.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery/jquery-3.7.0.min.js"></script>
<script>
function numberMaxLength(x){
	if(x.value.length > 1 || x.value > 5){
		x.value = 5;
	}else if(x.value<1){
		x.value = 1;
	}
}
</script>
<body>

<input step="1" type="number" max="5" min="1" step="1" pattern="[1-5]" maxlength="1" oninput="numberMaxLength(this)">
</body>
</html>