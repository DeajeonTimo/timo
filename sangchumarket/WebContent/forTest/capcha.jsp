<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>reCAPTCHA demo: Simple page</title>
    <script src="../js/jquery/jquery-3.7.0.min.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
  </head>
  <body>
    <form action="#" method="POST" id="testForm">
      <div class="g-recaptcha" data-sitekey="6LedM4onAAAAAKOFk7ojLxM5itqiw5K_2mT4ymsU" data-callback="isOKforCheck"></div>
      <br/>
      <input type="submit" value="Submit">
    </form>
  </body>
<script>
	var isOK = false;
	function isOKforCheck(){
		isOK = true;
	}
	$('#testForm').submit(function(){
		if(!isOK){
			alert('캡챠 미진행!');
			return false;
		}
	});
	
</script>
</html>