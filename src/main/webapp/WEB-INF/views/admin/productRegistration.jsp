<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerAndFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminPage.css">

<script>
function displayImage(input) {
    var imageContainer = document.getElementById("imageContainer");

    // 이미지를 표시하기 전에 기존 이미지를 지웁니다.
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

<body>
<%@ include file="/WEB-INF/views/common/adminHeader.jsp"%>
    <form>
        <div class="container-fluid d-flex justify-content-center mt-5">
            <div class="overflow-hidden card table-nowrap shadow" style="width:900px; min-width: 600px;">
                <div class="card-header bg-black text-white">
                    Product Registration
                </div>
                <div class="d-flex">
                    <div class="p-2">
                        <div class="border border-5" id="imageContainer" style="width:200px; height: 200px;">
                            
                        </div>
                        <div class="input-group mt-3" style="width:200px">
                            <input type="file" class="form-control" id="inputGroupFile"
                            aria-describedby="inputGroupFileAddon" aria-label="Upload"
                            accept="image/*" onchange="displayImage(this)">
                        </div>
                    </div>
                    <div class="d-flex flex-column flex-grow-1 h-100">
                        <div class="input-group flex-grow-1 p-2">
                            <span class="input-group-text" id="basic-addon1">상품 번호</span>
                            <input type="text" class="form-control" placeholder="Product No" aria-label="Username"
                                aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group flex-grow-1 p-2">
                            <span class="input-group-text text-center" id="basic-addon1">상품명</span>
                            <input type="text" class="form-control" placeholder="Menu Name" aria-label="Username"
                                aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group flex-grow-1 p-2">
                            <span class="input-group-text" id="basic-addon1">카테고리</span>
                            <input type="text" class="form-control" placeholder="Category" aria-label="Username"
                                aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group flex-grow-1 p-2">
                            <span class="input-group-text" id="basic-addon1">가격</span>
                            <input type="text" class="form-control" placeholder="Price" aria-label="Username"
                                aria-describedby="basic-addon1">
                        </div>
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <div class="input-group p-2" style="height: 150px">
                        <span class="input-group-text">상품 설명</span>
                        <textarea class="form-control" aria-label="With textarea"></textarea>
                    </div>
                    <div class="input-group p-2" style="height: 150px">
                        <span class="input-group-text">관리자 메모</span>
                        <textarea class="form-control" aria-label="With textarea"></textarea>
                    </div>
                    <div class="d-flex justify-content-around mb-2">
                    <button class="btn btn-light btn-md rounded-pill border">Save</button>
					<button class="btn btn-dark btn-md rounded-pill border">Cancel</button>
                    </div>
                </div>

            </div>
        </div>
    </form>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>