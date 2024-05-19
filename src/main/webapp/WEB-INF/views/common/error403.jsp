<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>권한 없음 페이지</title>
				
		<!-- Bootstrap5 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- jQuery 외부 라이브러리 설정 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		
		<script type="text/javascript">

		</script>
		
        <style>
        	* {
			  font-family: "Do Hyeon", sans-serif;
			  font-weight: 400;
			  font-style: normal;
			}

            #signInPage {
                justify-content: center;
                align-items: center;
            }
            
            #signInForm {
            	min-width: 500px;  
            }

        </style>
</head>

<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <div class="p-5">
    	<h1>권한이 없습니다.</h1>   
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>