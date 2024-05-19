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
		

	    <script>
	    
	    /* 아이디 찾기 함수 */
	    //search 버튼을 누르면 input 태그로 들어온 acName과 acTel을 DB와 비교해서 일치하는 acId를 리턴해주는 함수
	    $(document).ready(function() {
	        $("#findIdBtn").click(function(e) {
	            e.preventDefault(); // 폼의 기본 동작인 페이지 새로고침을 막음
	            var acName = $("#acName").val();
	            var acTel = $("#acTel").val();
	            
	            //search 버튼 바로 밑에 acId 또는 에러메세지를 바로 띄워주는 ajax 요청
	            $.ajax({
	                type: "POST",
	                url: "${pageContext.request.contextPath}/signJoin/findIdByTel",
	                data: { acName: acName, acTel: acTel },
	                success: function(data) {
	                    // 서버로부터 받은 데이터를 처리하여 결과를 동적으로 화면에 표시
	                    $("#findIdResult").text("아이디는  \"" + data + "\" 입니다.");
	                },
	                
	                error: function(xhr, status, error) {
	                    // 에러가 발생한 경우에는 에러 메시지를 화면에 표시
	                    $("#findIdResult").text("일치하는 정보가 없습니다.");
	                    /* $("#findIdResult").text("에러: " + xhr.responseText); */
	                }
	            });
	        });
	    });

	    </script>
        
        <style>
        	* {
			  font-family: "Do Hyeon", sans-serif;
			  font-weight: 400;
			  font-style: normal;
			}
			
			button {
				font-family: "Do Hyeon", sans-serif;
			    font-weight: 400;
			    font-style: normal;
			}

            #findIdBtn {
         
            }

            #findIdPage {
                justify-content: center;
                align-items: center;
            }
            
            #findIdForm {
            	min-width: 500px;  
            }

        </style>
</head>

<body>
	<!-- 헤더 -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	 
	<div id="findIdPage" class="d-flex flex-column py-3 px-5 mx-5">
		<div>
			<div id="findIdMent" class="m-1 p-1 text-center" ><h2 class="mt-3">Find Your ID</h2></div>
		</div>
	    <div class="border border-secondar rounded m-5 p-3" style="background: #F0F0F0">
	       
	        <!-- 아이디찾기폼 -->
			<form id="findIdForm" method="post" action="${pageContext.request.contextPath}/signJoin/findIdByTel">
		 		<div class="my-3">
					<label for="acName" class="form-lable px-4">* Name</label>
					<div class="d-flex"><input id="acName" name="acName" type="text" class="flex-grow-1 border rounded mx-3 px-3 py-2" placeholder="ex) 홍길동"></div>
				</div>
				<div class="my-3">
					<label for="acTel" class="form-lable px-4">* PhoneNumber</label>
					<div class="d-flex"><input id="acTel" name="acTel" type="text" class="flex-grow-1 border rounded mx-3 px-3 py-2" placeholder="ex) 010-123-1234"></div>		
				</div>
		           
				<!-- 아이디 찾기 버튼 -->
				<div class="text-center">
					<button id="findIdBtn" class="m-2 p-2 btn btn-lg rounded-pill border-secondary" style="background: #1f3933; color: white;">search</button>
				</div> 
					    
				<!-- 아이디 찾기 결과 표시 -->
				<div id="findIdResult" class="text-center m-3" style="font-size: 30px; color: #1f3933;"></div>
			</form>
		</div>
	
	
		<!------------------------------------------------------------------------------------------------------------------------->
		
		<!-- 회원가입 이동-->
		<div class="text-center m-3 p-3" style="min-width: 450px;  max-width: 900px;">
			<div id="joinNowMent">
				<h5>JOIN CODEBREW WEBSITE</h5>
				<h6>상품 주문 및 결제는 회원가입 시에 제공되는 서비스입니다.</h6>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/signJoin/joinNow">
				<button name="joinNowBtn" class="m-2 p-2 rounded-pill border" type="button" href="">Join now</button>
				</a>
			</div>
		</div>
	</div>
	
	<!-- 풋터 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>