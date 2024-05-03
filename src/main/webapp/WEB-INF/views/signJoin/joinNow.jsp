<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Insert title here</title>
				
		<!-- Bootstrap5 외부 라이브러리 설정 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- jQuery 외부 라이브러리 설정 -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
		<!-- 폰트설정  -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<!-- 사용자 정의 자바스크립트 -->
		<script>
		</script>
        <script>

        </script>
        <style>
        	* {
			  font-family: "Do Hyeon", sans-serif;
			  font-weight: 400;
			  font-style: normal;
			}           
           
            #joinNowBtn {
                float: right;
            }

            #joinNowPage {
                justify-content: center;
                align-items:center;
            }
            
            #joinNowForm {
            	min-width: 500px;  
            }
          
        </style>
</head>

<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
   
    <div id="joinNowPage" class="d-flex flex-column py-3 px-5 mx-5">
        <div class="">
            <div id="signInMent" class="m-1 p-1 text-center"><h2 class="mt-3">Create an account</h2></div>
        </div>
        <div class="border rounded m-5 p-3" style="background: #F0F0F0">
            <!-- 회원가입폼 -->
            <form id="joinNowForm" method="post" action="signUp">
                <div class="m-2 p-2 text-start"><span class="star">* </span> indicates required field</div>
                <!-- 항목 -->
                    <div class="d-flex"><input id="acName" name="acName" type="text" class="flex-grow-1 border rounded m-3 px-3 py-2" placeholder="*name"></div>
                    <div class="d-flex"><input id="acId" name="acId" type="text" class="flex-grow-1 border rounded m-3 px-3 py-2"  placeholder="*id"></div>
                    <div class="d-flex"><input id="acPassword" name="acPassword" type="text" class="flex-grow-1 border rounded m-3 px-3 py-2" placeholder="*password"></div>
                    <div class="d-flex"><input id="acTel" name="acTel" type="text" class="flex-grow-1 border rounded m-3 px-3 py-2" placeholder="*phone"></div>
                    <div class="d-flex"><input id="acEmail" name="acEmail" type="text" class="flex-grow-1 border rounded m-3 px-3 py-2" placeholder="*email"></div>

                <!-- 제출 버튼 -->
                <div>
                    <button id="joinNowBtn" class="m-2 p-2 btn btn-lg btn-success rounded-pill border-secondary" type="submit" style="background: #2C4E80; color: white">Join Now</button>
                </div>
            </form>
        </div>


     
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>    
</body>

</html>