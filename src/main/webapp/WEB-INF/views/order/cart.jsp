<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!-- BS5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css">

<!-- 사용자 정의 JavaScript -->
<script type="text/javascript">
	function increaseAmount(element) {
	    var parent = element.parentNode;
	    var pAmountElement = parent.querySelector("#pAmount");
	    var pAmount = parseInt(pAmountElement.innerText); // 현재 값 가져오기
	    pAmount++; // 1 증가
	    pAmountElement.innerText = pAmount; // 증가된 값 업데이트
	}
	
	function decreaseAmount(element) {
	    var parent = element.parentNode;
	    var pAmountElement = parent.querySelector("#pAmount");
	    var pAmount = parseInt(pAmountElement.innerText); // 현재 값 가져오기
	    if (pAmount > 1) { // 값이 1보다 큰 경우에만 감소
	        pAmount--; // 1 감소
	        pAmountElement.innerText = pAmount; // 감소된 값 업데이트
	    } else {
	    	parent.parentNode.parentNode.remove()
	    }
	}
</script>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="d-flex flex-column align-items-center">
		<div class="d-flex shadow rounded bg-white p-4 mt-4" style="width: 500px; height: 210px">
			<img src="${pageContext.request.contextPath}/resources/image/cut/Americano.jpg" style="width: 100px; height: 100px; border-radius: 50%;">
			<div class="flex-grow-1 ms-4">
				<p class="h3">Americano</p>
				<p class="h5 mt-3">Venti</p>
				<p class="h6 mt-3">말이 필요 없는 그냥 커피</p>
				<div class="mt-4 d-flex align-items-center">
                    <i class="bi bi-pen text-muted cart-icon"></i>
                    <i class="bi bi-plus-circle text-muted ms-5 me-3 cart-icon" onclick="increaseAmount(this)"></i>
                    <span class="text-center" id="pAmount">1</span>
                    <i class="bi bi-dash-circle text-muted ms-3 cart-icon" onclick="decreaseAmount(this)"></i>
                </div>
			</div>
		</div>
		<div class="d-flex shadow rounded bg-white p-4 mt-4" style="width: 500px; height: 210px">
			<img src="${pageContext.request.contextPath}/resources/image/cut/AppleJuice.png" style="width: 100px; height: 100px; border-radius: 50%;">
			<div class="flex-grow-1 ms-4">
				<p class="h3">Apple Juice</p>
				<p class="h5 mt-3">Tall</p>
				<p class="h6 mt-3">사과주스 마시고 싶다</p>
				<div class="mt-4 d-flex align-items-center">
                    <i class="bi bi-pen text-muted cart-icon"></i>
                    <i class="bi bi-plus-circle text-muted ms-5 me-3 cart-icon" onclick="increaseAmount(this)"></i>
                    <span class="text-center" id="pAmount">1</span>
                    <i class="bi bi-dash-circle text-muted ms-3 cart-icon" onclick="decreaseAmount(this)"></i>
                </div>
			</div>
		</div>
		<div class="d-flex shadow rounded bg-white p-4 mt-4" style="width: 500px; height: 210px">
			<img src="${pageContext.request.contextPath}/resources/image/cut/Reusable_ColdCup.png" style="width: 100px; height: 100px; border-radius: 50%;">
			<div class="flex-grow-1 ms-4">
				<p class="h3">Reusable ColdCup</p>
				<p class="h5 mt-3">None</p>
				<p class="h6 mt-3">종이컵도 여러번 쓰면 리유저블인데</p>
				<div class="mt-4 d-flex align-items-center">
                    <i class="bi bi-pen text-muted cart-icon"></i>
                    <i class="bi bi-plus-circle text-muted ms-5 me-3 cart-icon" onclick="increaseAmount(this)"></i>
                    <span class="text-center" id="pAmount">1</span>
                    <i class="bi bi-dash-circle text-muted ms-3 cart-icon" onclick="decreaseAmount(this)"></i>
                </div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>