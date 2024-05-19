<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제</title>

<!-- Bootstrap5 외부 라이브러리 설정 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<!-- 폰트설정  -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">


<style>
input::placeholder {
	color: #d9d9d9
	}

#hovershadow {
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
	background: #F0F0F0;

span {
	/* display: flex; */
	justify-content: flex-end;
	align-items: center;
	}

#hovershadow:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}

.pfont {
	font-family: "Do Hyeon", sans-serif;
	font-style: normal;
}

/*  폰트 적용시 특수문자 원 표기가 안됨 */
.h5, .h6 {
	font-family: "Do Hyeon", sans-serif;
	font-style: normal;
}
</style>

</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="px-5 mx-5">
		<div class="d-flex flex-row">
			<div class="p-3 m-5 w-50 d-flex align-items-center">
				<div id="hovershadow" class="d-grid gap-4 p-5 rounded-4 w-100">
					<div class="row text-center">
						<h1 class="pfont">지점 선택</h1>
					</div>
					<div class="row">
						<form id="payment" method="post" action="${pageContext.request.contextPath}/payments/paymentsComplete">
						<div class="col-8 flex-column flex-grow-1 d-grid gap-4 mx-2">
							<div class="row flex-grow-1">
								<label class="form-label h4 pfont align-text-bottom">이름</label>
								<input class="form-control flex-grow-1" id="paName" name="paName">
							</div>
							<div class="row">
								<label class="form-label h4 pfont">연락처</label>
								<input class="form-control" id="paTel" name="paTel" placeholder="ex) 000-1234-5678">
							</div>
							<div class="row">
								<label class="form-label h4 pfont align-text-bottom">지점 선택</label>
								<select class="form-select form-control" id="brId" name="brId">
									<option selected>주문한 제품을 픽업할 지점을 선택해주세요</option>
									<option value="1">경찰병원역 지점</option>
									<option value="2">가락시장역 지점</option>
									<option value="3">IT타워 지점</option>
								</select>
							</div>

							<div class="row">
								<label class="form-label h4 pfont">요청사항</label> <input class="form-control" id="paRequest" name="paRequest" placeholder="ex) 부재시 문앞에 놓아주세요">
							</div>
						</div>
						<input type="hidden" id="paPay" name="paPay">
						</form>
					</div>
				</div>
			</div>




			<div class="p-3 m-5 w-50 d-flex align-items-center">
				<div id="hovershadow" class="grid gap-4 p-5 rounded-4 w-100">
					<div class="row text-center">
						<h1 class="pfont">주문 내역</h1>
					</div>
					<c:forEach var="cart" items="${cartList}">
						<div class="row d-flex align-items-center my-3">
							<div class="col-2">
							<img id="img2" class="rounded-circle" src="data:image/jpeg;base64,${cart.prImageOut}" width="50" height="50" />
							</div>
							<div class="col-5">
							${cart.prName}
								<span class="d-inline-block" tabindex="0" data-bs-toggle="popover"
									data-bs-trigger="hover" data-bs-content="${cart.bopName} / ${cart.sopName} / ${cart.topName} / ${cart.pdShotCount}shot">
									<button class="btn btn-sm btn-success" type="button" disabled>detail</button>
								</span>
							</div>
							<div class="col-2">X<span id="count">${cart.pdCount}</span></div>
							<div class="col-3">￦<span id="price">${cart.prPrice}</span></div>
						</div>
					</c:forEach>
						<div class="d-flex justify-content-around mt-3">
							<button class="btn btn-outline-info btn-lg" id="paymentBtn" data-bs-dismiss="modal">\${sum}￦ 결제</button> <%--data-bs-toggle="modal" data-bs-target="#myModal"--%> 
							<button class="btn btn-outline-secondary btn-lg">돌아가기</button>
						</div>

						<!-- The Modal -->
						<div class="modal fade" id="myModal">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title pfont">주문 완료</h4>
										<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
									</div>

									<!-- Modal body -->
									<div class="modal-body">메뉴를 바로 준비합니다. 10분 후 픽업 해주세요.</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="submit" class="btn rounded-pill" form="payment">Close</button>
									</div>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>

	</div>

	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
		const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
		
		var countElements = document.querySelectorAll('[id="count"]');
		var priceElements = document.querySelectorAll('[id="price"]');
		
		document.getElementById('paymentBtn').addEventListener('click', function() {
	        // Show the modal
	        var myModal = new bootstrap.Modal(document.getElementById('myModal'));
	        myModal.show();
	    });
		
		// 가격을 저장할 변수를 초기화합니다.
		var totalPrice = 0;
		
		// 각 요소의 개수가 같은지 확인합니다.
	    for (var i = 0; i < countElements.length; i++) {
	        // count 요소와 price 요소의 값을 가져옵니다.
	        var count = parseInt(countElements[i].innerText);
	        var price = parseInt(priceElements[i].innerText);
	
	        // count와 price를 곱하여 총 가격에 더합니다.
	        totalPrice += count*price;
	    }
	
		var paymentBtn = document.getElementById("paymentBtn");
		paymentBtn.innerText = "￦" + totalPrice + " 결제";
		document.getElementById('paPay').value = totalPrice;
		
		// 모달 외부를 클릭하여 모달 닫기
		window.onclick = function(event) {
		  var modal = document.getElementById("myModal");
		  if (event.target == modal) {
		    modal.style.display = "none";
		    // 모달이 닫힐 때 홈페이지로 이동
		    document.getElementById("payment").submit();
		    
		  }
		}
	</script>
</body>
</html>