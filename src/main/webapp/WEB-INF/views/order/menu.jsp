<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Code Brew - Menu</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">
		
		<style>
		.row{
			display: flex;
			justify-content: flex-start;
			margin-top: 30px;
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <div class="container justify-content-start">
        <div class="text-start mt-5">
            <p class="h1">Menu</p>
            <p class="h3 mt-5">Drinks</p>
            <hr class="m-0"/>
        </div>
        <div class="row">
            <div class="col">
                <a href="#">
                    <img src="resources/image/cut/Americano.jpg" style="width:122px; height:122px; border-radius: 50%;">
                    Americano
                </a>
            </div>
            <div class="col">
                <a href="#">
                    <img src="resources/image/cut/Espresso_Single.png" style="width:122px; height:122px; border-radius: 50%;">
                    Espresso
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <a>
                    <img src="resources/image/cut/CaffeLatte.png" style="width:122px; height:122px; border-radius: 50%;">
                    Caffe Latte
                </a>
            </div>
            <div class="col">
                <a>
                    <img src="resources/image/cut/CaramelMacchiato.png" style="width:122px; height:122px; border-radius: 50%;">
                    Caramel Macchiato
                </a>
            </div>
        </div>
        <div class="text-start mt-5">
            <p class="h3">Beverage</p>
            <hr class="m-0"/>
        </div>
        <div class="row">
            <div class="col">
                <a>
                    <img src="resources/image/cut/SignatureHotChocolate.png" style="width:122px; height:122px; border-radius: 50%;">
                    Hot Chocolate
                </a>
            </div>
            <div class="col">
                <a>
                    <img src="resources/image/cut/AppleJuice.png" style="width:122px; height:122px; border-radius: 50%;">
                    Apple Juice
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <a>
                    <img src="resources/image/cut/StrawberryAcaiLemonadeRefreshers.png" style="width:122px; height:122px; border-radius: 50%;">
                    Strawberry Acai Lemonade Refreshers
                </a>
            </div>
            <div class="col">
                <a>
                    <img src="resources/image/cut/PineapplePassionfruitRefreshersLemonade.png" style="width:122px; height:122px; border-radius: 50%;">
                    Pineapple Passionfruit Refreshers Lemonade
                </a>
            </div>
        </div>
        <div class="text-start mt-5">
            <p class="h3">Beans</p>
            <hr class="m-0" />
        </div>
        <div class="row">
            <div class="col">
                <a>
                    <img src="resources/image/cut/OdysseyBlend2024US.png" style="width:122px; height:122px; border-radius: 50%;">
                    Odyssey Blend
                </a>
            </div>
            <div class="col">
                <a>
                    <img src="resources/image/cut/TributeBlend2024WBUS.png" style="width:122px; height:122px; border-radius: 50%;">
                    Tribute Blend
                </a>
            </div>
        </div>
        <div class="text-start mt-5">
            <p class="h3">Merchandise</p>
            <hr class="m-0"/>
        </div>
        <div class="row">
            <div class="col">
                <a>
                    <img src="resources/image/cut/PLSTC_CC.png" style="width:122px; height:122px; border-radius: 50%;">
                    Plastic Cold Cup
                </a>
            </div>
            <div class="col">
                <a>
                    <img src="resources/image/cut/Reusable_ColdCup.png" style="width:122px; height:122px; border-radius: 50%;">
                    Reusable Cold Cup
                </a>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>