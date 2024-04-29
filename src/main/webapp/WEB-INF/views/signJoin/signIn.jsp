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
		<!-- 사용자 정의 자바스크립트 -->
		<script>
		</script>
        <script>

        </script>
        <style>
        
	        body{
	        	border: 1px solid black;
	        }
           
            #signInBtn {
                float: right;
            }

            #signInPage {
                justify-content: center;
                align-items: center;
            }
            
            #signInForm {
            	min-width: 500px;  
            }
            
         
           
            
           /*  a {
				text-decoration: none;
			}
		
			a:hover {
				text-decoration: underline;
				color: black;
			}
				
			a:active {
				color: black;
			}
			
			a:visited {
				color: black;
			} */

        </style>
</head>

<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
   
    <div id="signInPage" class="d-flex flex-column py-3 px-5 mx-5">
        <div class="">
            <div id="signInMent" class="m-1 p-1 text-center" ><h2 class="mt-3">Sign in or create an account</h2></div>
        </div>
        <div class="border border-secondary bg-warning-subtle rounded m-5 p-3" >
            <!-- 로그인폼 -->
            <form id="signInForm" action="/codebrew" onsubmit="handleCheckSigninData()" novalidate>
                <div class="m-2 p-2 text-start"><span class="star">* </span> indicates required field</div>
                <!-- 아이디바/패스워드바 -->
                
                    <div class="d-flex"><input id="mid" type="text" class="flex-grow-1 border border-secondary rounded m-3 px-3 py-2"  placeholder="*id"></div>
                    <div class="d-flex"><input id="mpassword" type="text" class="flex-grow-1 border border-secondary rounded m-3 px-3 py-2" placeholder="*password"></div>
                
                <!-- 로그인 정보 저장 -->
                <div class="m-2 p-2 text-start">
                    <input id="singInSave" type="checkbox"> Keep me signed in.
                </div>
                <!-- 아이디찾기/패스워드찾기 -->
                <!-- <div class="text-start m-2 p-2">
                    <div><a class="m-2" href="" target="_self">Forgot your username?</a></div>
                    <div><a class="m-2" href="" target="_self">Forgot your password?</a></div>
                </div>    -->
                <!-- 로그인 제출 버튼 -->
                <div>
                    <button id="signInBtn" class="m-2 p-2 btn btn-lg btn-success rounded-pill border-secondary" type="submit">Sign in</button>
                </div>
            </form>
        </div>


        <!-- 회원가입 이동-->
        <div class="text-center m-3 p-3" style="min-width: 450px;  max-width: 900px;">
            <div id="joinNowMent">
                <h5>JOIN CODEBREW WEBSITE</h5>
                <h6>상품 주문 및 결제는 회원가입 시에 제공되는 서비스입니다.</h6>
            </div>
            <div>
            	<a href="${pageContext.request.contextPath}/signJoin/joinNow">
            		<button name="joinNowBtn" class="m-2 p-2 rounded-pill" type="button" href="">Join now</button>
            	</a>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>