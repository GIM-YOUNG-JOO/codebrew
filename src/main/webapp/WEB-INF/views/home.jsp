<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Code Brew - Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/headerAndFooter.css">
<link rel="stylesheet" href="resources/css/mainPage.css">

</head>


<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<br>
	<div class="container">

		    <div>
		        <div class="first_box ss mb-4">
		            <div class="first_image_box ss">
		                <img class="image" src="./resources/image/mainPage/iceBeverage.jpg" alt="iceBeverage"/>
		            </div>
		
		            <div class="text_box_out">
		                <div class="text_box ss mb-5"><span class="h1 first_title">Absolutely no chill</span><br/>
		                    New Spicy Lemonade Refreshers® with real<br/> fruit and our three-pepper chili blend are<br/> coming in hot.</div>
		                    
		                <div class="button_div">
		                    <button type="button" class="first_button btn btn-md" onclick="location.href='${pageContext.request.contextPath}/order/menu'">Order now</button>
		                </div>
		            </div> 
		        </div>
		    </div>
		
		    <div>
		        <div class="second_box ss mb-4">
		            <div class="text_box_out">
		                <div class="text_box ss mb-5"><span class="h1 first_title">Personal cups for good</span><br/>
		                    Your choice is a positive and responsible one—because<br/> bringing your clean reusable cup helps our planet.</div>
		                    
		                <div class="button_div">
		                    <button type="button" class="first_button btn btn-md" onclick="location.href='${pageContext.request.contextPath}/order/menu'">Learn more</button>
		                </div>
		            </div>
		
		            <div class="second_image_box ss">
		                <img class="image" src="./resources/image/mainPage/circleBottle.jpg" alt="iceBeverage"/>
		            </div>
		        </div>
		    </div>
		
		    <div>
		        <div class="third_box ss mb-4">
		            <div class="third_image_box ss">
		                <img class="image" src="./resources/image/mainPage/bottle.jpg" alt="iceBeverage"/>
		            </div>
		
		            <div class="text_box_out">
		                <div class="text_box ss mb-5"><span class="h1 first_title">Perks of a personal cup</span><br/>
		                    Join Starbucks® Rewards and earn 25 Stars when you<br/>order with a clean personal cup in stores, at the drive-<br/>thru or in the app.*</div>
		                    
		                <div class="button_div">
		                    <button type="button" class="first_button btn btn-md" onclick="location.href='${pageContext.request.contextPath}/order/menu'">Join for free</button>
		                </div>
		                </div>
		
		         </div>
		    </div>
		
		    <div>
		        <div class="fourth_box ss mb-4">
		            <div class="text_box_out">
		                <div class="text_box ss mb-5"><span class="h1 first_title">Find your bliss</span><br/>
		                    Enjoy a super-smooth Chocolate Cream Cold<br/>Brew or Cinnamon Caramel Cream Cold Brew.<br/></div>
		                    
		                <div class="button_div">
		                    <button type="button" class="first_button btn btn-md" onclick="location.href='${pageContext.request.contextPath}/order/menu'">Order now</button>
		                </div>
		            </div>
		            
		            <div class="fourth_image_box ss">
		                <img class="image" src="./resources/image/mainPage/icecoffee.jpg" alt="iceBeverage"/>
		            </div>
		
		         </div>
		    </div>
		
		    <div>
		        <div class="fifth_box ss mb-4">
		            <div class="fifth_image_box ss">
		                <img class="image" src="./resources/image/mainPage/bread.jpg" alt="iceBeverage"/>
		            </div>
		
		            <div class="text_box_out">
		                <div class="text_box ss mb-5"><span class="h1 first_title">Find your bliss</span><br/>
		                    Enjoy a super-smooth Chocolate Cream Cold<br/>Brew or Cinnamon Caramel Cream Cold Brew<br/></div>
		                    
		                <div class="button_div">
		                    <button type="button" class="first_button btn btn-md" onclick="location.href='${pageContext.request.contextPath}/order/menu'">Order now</button>
		                </div>
		            </div>
		            
		            
		
		         </div>
		    </div>
		    
		    <div>
		        <div class="sixth_box ss mb-4">
		
		            <div class="text_box_out">
		                <div class="text_box ss mb-5"><span class="h1 first_title">Find your bliss</span><br/>
		                    Enjoy a super-smooth Chocolate Cream Cold<br/>Brew or Cinnamon Caramel Cream Cold Brew.<br/></div>
		                    
		                <div class="button_div">
		                    <button type="button" class="first_button btn btn-md" onclick="location.href='${pageContext.request.contextPath}/order/menu'">Order now</button>
		                </div>
		            </div>
		            
		            <div class="sixth_image_box ss">
		                <img class="image" src="./resources/image/mainPage/bread2.jpg" alt="iceBeverage"/>
		            </div>
		
		         </div>
		    </div>
		</div>
	<br>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>


</html>