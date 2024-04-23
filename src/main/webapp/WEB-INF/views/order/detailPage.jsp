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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailPage.css">

<
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="container-fluid product_first_container">
        <div class=box_container>
            <div class="box box1">
                <img class= "product_img" src="${pageContext.request.contextPath}/resources/image/cut/이미지.png">
            </div>
            <div class="box box2">
                <img class="product_name" src="${pageContext.request.contextPath}/resources/image/cut/상품명.png">
            </div>
            
        </div>
   </div>

   <div class="container-fluid product_second_container">
    <div class=box_container>
        <div class="box box1">
            <h2 class="h2_text">
                <span class="text_container">
                    Size options
                </span>
            </h2>
            <form action="#">
                <div class="image-selector">
                  <div class="option_one">
                    <input type="radio" id="image1" name="selectedImage" value="">
                    <label for="image1">
                      <img src="${pageContext.request.contextPath}/resources/image/cut/1.svg" alt="Image 1">
                      <div>Short</div>
                      <div>8 fl oz</div>
                    </label>
                  </div>
                  <div class="option_one">
                    <input type="radio" id="image2" name="selectedImage" value="">
                    <label for="image2">
                      <img src="${pageContext.request.contextPath}/resources/image/cut/2.svg" alt="Image 2">
                      <div>tall</div>
                      <div>12 fl oz</div>
                    </label>
                  </div>
                  <div class="option_one">
                    <input type="radio" id="image3" name="selectedImage" value="">
                    <label for="image3">
                      <img src="${pageContext.request.contextPath}/resources/image/cut/3.svg" alt="Image 3">
                      <div>Grande</div>
                      <div>16 fl oz</div>
                    </label>
                  </div>
                  <div class="option_one">
                    <input type="radio" id="image4" name="selectedImage" value="">
                    <label for="image4">
                      <img src="${pageContext.request.contextPath}/resources/image/cut/4.svg" alt="Image 4">
                      <div>Venti</div>
                      <div>20 fl oz</div>
                    </label>
                  </div>
                </div>
              </form>
        </div>
        <div class="box box2">
            <h2 class="h2_text">
                <span class="text_container">
                    What's included
                </span>
            </h2>
            <div class="dust-class">
              <label class="dts"><span>* </span>Add-ins</label>
                <select class= "">
                  <option selected>Open this select menu</option>
                  <option value="1">One</option>
                  <option value="2">Two</option>
                  <option value="3">Three</option>
                </select>
            </div>
            <div class="dust-class">
              <label class="dts"><span>* </span>Espresso & Options</label>
                <select class= "">
                  <option selected>Open this select menu</option>
                  <option value="1">One</option>
                  <option value="2">Two</option>
                  <option value="3">Three</option>
                </select>
            </div>
            <div class="dust-class">
              <label class="dts2"><span>* </span>Espresso & Options</label>
                <div class="shots-container">
                  <p>Shots 
                    <span>
                      <button>-</button>
                      3
                      <button>+</button>
                      </span>
                  </p>
                  
                </div>  
            </div>
        </div>
        
    </div>
</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>