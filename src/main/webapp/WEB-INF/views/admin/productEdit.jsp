<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
#hovershadow {
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
}

#hovershadow:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}

.pfont {
	font-family: "Do Hyeon", sans-serif;
	font-style: normal;
	font-size: 2em;
}

::-webkit-scrollbar {
	display: none;
}
</style>

<script>
	function displayImage(input) {
		var imageContainer = document.getElementById("imageContainer");

		imageContainer.innerHTML = "";

		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				var image = document.createElement("img");
				image.src = e.target.result;
				image.style.maxWidth = "100%";
				image.style.maxHeight = "100%";
				imageContainer.appendChild(image);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

</head>

<body class="vh-100 p-5">
	<div class="container-fluid h-100 bg-white rounded-4"
		style="box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
		<div class="row h-100">
			<%@ include file="/WEB-INF/views/admin/adminNavbar.jsp"%>
			<div class="col p-4">
				<form id="productEdit" method="post" action="productUpdate" enctype="multipart/form-data">
					<input type="hidden" name="prId" value="${product.prId}">
					<div class="overflow-hidden card rounded-4" id="hovershadow">
						<div class="overflow-hidden card table-nowrap rounded-4">
							<div class="card-header bg-dark text-white">Product Edit</div>
							<div class="card-body d-flex flex-column p-0">
								<div class="d-flex">
									<div class="p-2">
										<div class="border border-5" id="imageContainer" style="width: 200px; height: 200px;">
											<img src="data:image/jpeg;base64,${product.prImageOut}" style="max-width:100%">
										</div>
										<div class="input-group mt-3" style="width: 200px">
											<input type="file" class="form-control" id="prImage" name="prImage" aria-describedby="inputGroupFileAddon" aria-label="Upload"
												accept="image/*" onchange="displayImage(this)">
										</div>
									</div>
									<div class="d-flex flex-column flex-grow-1">
										<div class="input-group p-2">
											<span class="input-group-text text-center" style="width: 100px">상품명</span> <input type="text" class="form-control" id="prName"
												name="prName" placeholder="Menu Name" aria-label="Username" aria-describedby="basic-addon1" value="${product.prName}">
										</div>
										<div class="input-group p-2">
											<label class="input-group-text" for="pcid" style="width: 100px">카테고리</label> <select class="form-select" id="pcId" name="pcId">
												<option value="1" ${product.pcId == 1 ? 'selected' : ''}>커피</option>
												<option value="2" ${product.pcId == 2 ? 'selected' : ''}>음료</option>
												<option value="3" ${product.pcId == 3 ? 'selected' : ''}>원두</option>
												<option value="4" ${product.pcId == 4 ? 'selected' : ''}>물품</option>
											</select>
										</div>
										<div class="input-group p-2">
											<span class="input-group-text" id="basic-addon1" style="width: 100px">가격</span> <input type="text" class="form-control" id="prPrice"
												name="prPrice" placeholder="Price" value="${product.prPrice}">
										</div>
										<div class="input-group p-2 flex-grow-1">
											<span class="input-group-text" style="width: 100px">상품 설명</span>
											<textarea class="form-control" id="prInfo" name="prInfo" aria-label="With textarea">${product.prInfo}</textarea>
										</div>
									</div>
									<div class="d-flex flex-column flex-grow-1 p-2">
										<!-- 										<div class="input-group p-2 flex-grow-1">
											<span class="input-group-text" style="width: 100px">관리자
												메모</span>
											<textarea class="form-control" id="prMemo" name="prMemo"
												aria-label="With textarea"></textarea>
										</div> -->
										<div class="card flex-grow-1 border-0">
											<h5 class="card-header input-group-text border-bottom-0">관리자 메모</h5>
											<textarea class="card-body form-control rounded-0 rounded-bottom" id="prMemo" name="prMemo" aria-label="With textarea">${product.prMemo}</textarea>
										</div>
										<div class="d-flex justify-content-around mt-2">
											<button class="btn btn-light btn-md rounded-pill border" type="submit" form="productEdit">Save</button>
											<button class="btn btn-dark btn-md rounded-pill border">Cancel</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>