<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<!-- Bootstrap5 외부 라이브러리 설정 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div id="signInPage" class="d-flex flex-column">
			<div id="signInMent" class="mt-5 text-center">
				<h2 class="mt-3">Welcome to CodeBrew</h2>
			</div>
			<div class="d-flex justify-content-center">
				<div class="rounded mt-5 p-3" style="background: #F0F0F0; width: 600px;">
					<!-- 로그인폼 -->
					<form id="signInForm" name="signInForm" method="post"
						action="${pageContext.request.contextPath}/login" novalidate>
						<div class="m-2 p-2 text-start">
							<span class="star">* </span>필수 입력 정보
						</div>
						<!-- 아이디바/패스워드바 -->
						<div class="d-flex flex-column">
							<input id="acId" name="acId" type="text" class="border rounded mx-2 px-3 py-2" placeholder="*ID">
							<input id="acPassword" name="acPassword" type="password" class="border mx-2 mt-3 rounded px-3 py-2" placeholder="*PASSWORD">
						</div>

						<!-- 로그인 정보 저장 -->
						<div class="m-2 p-2 text-start">
							<input type="checkbox" class="btn-check m-0 p-0" id="btn-check-outlined" autocomplete="off">
							<label class="btn btn-sm btn-outline-dark me-2 p-1" for="btn-check-outlined">x</label>로그인 정보 저장
						</div>
						<!-- 아이디찾기/패스워드찾기 -->
						<div class="text-start m-2 p-2">
							<div>
								<a href="${pageContext.request.contextPath}/signJoin/findId" target="_self">- 아이디 찾기</a>
							</div>
							<div>
								<a href="${pageContext.request.contextPath}/signJoin/changePassword" target="_self">- 비밀번호 찾기</a>
							</div>
						</div>
						<!-- 로그인 제출 버튼 -->
						<div class="text-end me-4">

							<button type="submit" class="btn btn-light btn-md rounded-pill border">로그인</button>

						</div>
					</form>
				</div>
			</div>

			<div class="text-center m-3 p-3">
				<div id="joinNowMent">
					<h5>JOIN CODEBREW WEBSITE</h5>
					<h6>상품 주문 및 결제는 회원가입 시에 제공되는 서비스입니다.</h6>
				</div>
				<div>
						<button name="joinNowBtn" class="btn btn-dark btn-md rounded-pill border" type="button" onclick="location.href='${pageContext.request.contextPath}/signJoin/joinNow'">회원가입</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>