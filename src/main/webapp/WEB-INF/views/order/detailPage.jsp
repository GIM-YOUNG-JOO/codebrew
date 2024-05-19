<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String prId = request.getParameter("prId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Code Brew - ${coffee.prName}</title>
<!-- BS5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailPage.css">
</head>

<script type="text/javascript">
	function increaseAmount(element) {
		var parent = element.parentNode;
		var pAmountElement = parent.querySelector("#pAmount");
		var pAmount = parseInt(pAmountElement.innerText); // 현재 값 가져오기
		pAmount++; // 1 증가
		pAmountElement.innerText = pAmount; // 증가된 값 업데이트
		document.getElementById('shotsInput').value = pAmount;
	}

	function decreaseAmount(element) {
		var parent = element.parentNode;
		var pAmountElement = parent.querySelector("#pAmount");
		var pAmount = parseInt(pAmountElement.innerText); // 현재 값 가져오기
		if (pAmount > 1) { // 값이 1보다 큰 경우에만 감소
			pAmount--; // 1 감소
			pAmountElement.innerText = pAmount; // 감소된 값 업데이트
			document.getElementById('shotsInput').value = pAmount;
		}
	}
	function increaseAmount1(element) {
		var parent = element.parentNode;
		var pAmountElement = parent.querySelector("#pAmount1");
		var pAmount = parseInt(pAmountElement.innerText); // 현재 값 가져오기
		pAmount++; // 1 증가
		pAmountElement.innerText = pAmount; // 증가된 값 업데이트
		document.getElementById('shotsInput1').value = pAmount;
	}

	function decreaseAmount1(element) {
		var parent = element.parentNode;
		var pAmountElement = parent.querySelector("#pAmount1");
		var pAmount = parseInt(pAmountElement.innerText); // 현재 값 가져오기
		if (pAmount > 1) { // 값이 1보다 큰 경우에만 감소
			pAmount--; // 1 감소
			pAmountElement.innerText = pAmount; // 감소된 값 업데이트
			document.getElementById('shotsInput1').value = pAmount;
		}
	}
</script>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container-fluid product_first_container">

		<div class=box_container>
			<div class="box box1">
				<img class="product_img" src="data:image/jpeg;base64,${coffee.prImageOut}">
			</div>
			<div class="box box2">
				<div class="box2_product"> 
					<span>${coffee.prName}</span>
					<br>
					${coffee.prInfo}
				</div>
			</div>
			
			
			
		</div>

	</div>

	<div class="container-fluid product_second_container">
		<form method="post" action="detailPagePost">
			<input type="hidden" name="prId" value="<%=prId%>">
			<div class=box_container>
				<div class="box box1">
					<h2 class="h2_text">
						<span class="text_container"> Size options </span>
					</h2>
					<div class="image-selector">
						<div class="option_one">
							<input type="radio" id="image1" name="sopId" value="1" checked> <label for="image1"> <img
								src="${pageContext.request.contextPath}/resources/image/cut/1.svg" alt="Image 1">
								<div>Short<br>(default)</div>
								<div>8 fl oz</div>
							</label>
						</div>
						<div class="option_one">
							<input type="radio" id="image2" name="sopId" value="2"> <label for="image2"> <img
								src="${pageContext.request.contextPath}/resources/image/cut/2.svg" alt="Image 2">
								<div>tall</div>
								<div>12 fl oz</div>
							</label>
						</div>
						<div class="option_one">
							<input type="radio" id="image3" name="sopId" value="3"> <label for="image3"> <img
								src="${pageContext.request.contextPath}/resources/image/cut/3.svg" alt="Image 3">
								<div>Grande</div>
								<div>16 fl oz</div>
							</label>
						</div>
						<div class="option_one">
							<input type="radio" id="image4" name="sopId" value="4"> <label for="image4"> <img
								src="${pageContext.request.contextPath}/resources/image/cut/4.svg" alt="Image 4">
								<div>Venti</div>
								<div>20 fl oz</div>
							</label>
						</div>
					</div>
				</div>
				<div class="box box2">
					<h2 class="h2_text">
						<span class="text_container"> What's included </span>
					</h2>
					<c:if test="${coffee.pcId eq '1'}"> 
						<div class="dust-class">
							<label class="dts"><span>* </span>coffee-beans-Options</label> <select class="" name="bopId">
								<option value="1" selected>Arabica(default)</option>
								<option value="2">Robusta</option>
								<option value="3">Liberica</option>
							</select>
						</div>
						<div class="dust-class">
							<label class="dts"><span>* </span>temperature-Options</label> <select class="" name="topId">
								<option value="1" selected>ice(default)</option>
								<option value="2">hot</option>
							</select>
						</div>
						<div class="dust-class">
							<label class="dts2"><span>* </span>coffee-shot-Quantity</label>
							<div class="shots-container">
								<p>
									Shots <span>
										<button type="button" onclick="decreaseAmount(this)">-</button> <i id="pAmount">1</i>
										<button type="button" onclick="increaseAmount(this)">+</button>
									</span>
								</p>
								<input type="hidden" name="pdShotCount" id="shotsInput" value="1">
							</div>
						</div>
					</c:if>
					<div class="dust-class">
						<label class="dts2"><span>* </span>Quantity</label>
						<div class="shots-container">
							<p>
								Quantity <span>
									<button type="button" onclick="decreaseAmount1(this)">-</button> <i id="pAmount1">1</i>
									<button type="button" onclick="increaseAmount1(this)">+</button>
								</span>
							</p>
							<input type="hidden" name="pdCount" id="shotsInput1" value="1">
						</div>
					</div>
					<div class="dust-class">
						<button class="cart_add btn btn-success" style="background-color: #04AA6D">카트 담기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>