<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Code Brew - Cart</title>
<!-- BS5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 외부 라이브러리 설정 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css">

<!-- 사용자 정의 JavaScript -->

<style type="text/css">
.image_box{
	width:100%; height:600px;
}
.image_box2{
	width:100%; height:300px;	
}
.first_image_box{
	width:50%; margin:auto;
}
</style>
<script type="text/javascript">
	function increaseAmount(pdId,element) {
	    var parent = element.parentNode;
	    var pAmountElement = parent.querySelector("#pAmount");
	    var pAmount = parseInt(pAmountElement.innerText); // 현재 값 가져오기
	    pAmount++; // 1 증가
	    pAmountElement.innerText = pAmount; // 증가된 값 업데이트
	    
	    var pdId = pdId;
	    var pdCount = pAmount;
	    var cartItem = {
	    		pdId,
	    		pdCount
	    }
	    
	    $.ajax({
			url : "updateCartItemQuantity",
			type : "post",
			contentType: "application/json",
			data : JSON.stringify(cartItem),
			success: function(response){
				console.log("보내기 성공");
				
				
			}
		});
	}
	
	function decreaseAmount(pdId, element) {
	    var parent = element.parentNode;
	    var pAmountElement = parent.querySelector("#pAmount");
	    var pAmount = parseInt(pAmountElement.innerText); // 현재 값 가져오기
	    if (pAmount > 1) { // 값이 1보다 큰 경우에만 감소
	        pAmount--; // 1 감소
	        pAmountElement.innerText = pAmount; // 감소된 값 업데이트
	    }
	    
	    var pdId = pdId;
	    var pdCount = pAmount;
	    var cartItem = {
	    		pdId,
	    		pdCount
	    }
	    
	    $.ajax({
			url : "updateCartItemQuantity",
			type : "post",
			contentType: "application/json",
			data : JSON.stringify(cartItem),
			success: function(response){
				console.log("보내기 성공");
				
				
			}
		});
	    
	}
	function deleteTag(element){
		var parent = element.parentNode;
		parent.parentNode.parentNode.remove()
	}
	function cartItemDelete(caId, pdId, element) {
		console.log("cartItemDelete() 실행");
		var formData = { 
				caId, 
				pdId					
		} 
		$.ajax({
			url : "cartItemDelete",
			type : "post",
			contentType: "application/json",
			data : JSON.stringify(formData),
			success: function(data){
				console.log("보내기 성공");
			}
		});
		deleteTag(element);
		}
</script>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<c:if test="${empty cartList}">
		<%-- <div class="first_image_box" style="width: 100%; heigt: 200px;">
			<img class="image_box" src="${pageContext.request.contextPath}/resources/image/cart/cart.jpg"/>
		</div> --%>
		<video class="image_box"  autoplay loop muted>
        <source src="${pageContext.request.contextPath}/resources/image/cart/emptyCart.mp4" type="video/mp4">
    	</video>
    	<div class="first_image_box">
    		<a href="${pageContext.request.contextPath}/order/menu"><img class="image_box2" src="${pageContext.request.contextPath}/resources/image/cart/addCart.jpg"/></a>
    	</div>
	</c:if>
	<c:if test="${not empty cartList}">
	<div class="d-flex flex-column align-items-center">
		<c:forEach var="cart" items="${cartList}">
		<div class="d-flex shadow rounded bg-white p-4 mt-4" style="width: 500px; height: 210px">
			<img src="data:image/jpeg;base64,${cart.prImageOut}" style="width: 100px; height: 100px; border-radius: 50%;">
			<div class="flex-grow-1 ms-4">
				<p class="h3">${cart.prName}</p>
				<p class="h5 mt-3">coffee-Size : ${cart.sopName}</p>
				<c:if test="${cart.pdShotCount != 0}"> 
				<p class="h6 mt-3">shot-Quantity : ${cart.pdShotCount}</p>
				</c:if>
				<div class="mt-4 d-flex align-items-center">
                    <a href="${pageContext.request.contextPath}/order/detailPageUpdateGet?&pdId=${cart.pdId}"><i class="bi bi-pen text-muted cart-icon"></i></a>
                    <i class="bi bi-plus-circle text-muted ms-5 me-3 cart-icon"  onclick="increaseAmount('${cart.pdId}',this)"></i>
                    <span class="text-center" id="pAmount">${cart.pdCount}</span>
                    <i class="bi bi-dash-circle text-muted ms-3 cart-icon" onclick="decreaseAmount('${cart.pdId}',this)"></i>
                    <button type="button" onclick="cartItemDelete('${cart.caId}', '${cart.pdId}',this)" style="margin-left: 60px; border-radius: 5px; border:2px solid gray; background-color: transparent;padding-top: 1px;">삭제</button>
                </div>   	
			</div>
		</div>
		</c:forEach>
	</div>
	<a href="${pageContext.request.contextPath}/payments"><button class="btn btn-success btn-lg rounded-pill border z-1 position-fixed bottom-0 end-0 m-5">Buy Now</button></a>
	</c:if>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>