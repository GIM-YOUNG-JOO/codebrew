<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
	integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous"
	referrerpolicy="no-referrer" />

<!-- javascript -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
	integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous"
	referrerpolicy="no-referrer"></script>
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

<!-- <style>
.row {
	display: flex;
	justify-content: flex-start;
	margin-top: 30px;
}
</style> -->
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container justify-content-start">
		<div class="text-start mt-5">
			<p class="h1">Menu</p>
			<p class="h3 mt-5">Coffee</p>
			<hr/>
		</div>
		<div class="row">
			<div class="d-relative owl-carousel owl-loaded owl-drag">
				<div class="owl-stage-outer">
					<div class="owl-stage d-flex">
						<c:forEach var="coffee" items="${coffee}">

							<div class="owl-item">
								<div class="item">
									<a href="${pageContext.request.contextPath}/order/detailPageGet?prId=${coffee.prId}">
									<img src="data:image/jpeg;base64,${coffee.prImageOut}" class="rounded">
									<p class="h3 text-center mt-2">${coffee.prName}</p>
									</a>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
				<lottie-player class="position-absolute top-50 start-100" src="https://lottie.host/0fa29ef6-622c-4a8b-8a8f-ea5678a8f94c/YRAlseS1K4.json" background="##FFFFFF"
		        speed="1" style="width: 100px; height: 100px" loop autoplay direction="1"
		        mode="normal"></lottie-player>
			</div>
		</div>
		<div class="text-start mt-5">
			<p class="h3">Beveridge</p>
			<hr/>
		</div>
		<div class="row">
			<div class="owl-carousel owl-loaded owl-drag">
				<div class="owl-stage-outer">
					<div class="owl-stage d-flex">
						<c:forEach var="beveridge" items="${beveridge}">

							<div class="owl-item">
								<div class="item">
									<a href="${pageContext.request.contextPath}/order/detailPageGet?prId=${beveridge.prId}">
									<img src="data:image/jpeg;base64,${beveridge.prImageOut}" class="rounded">
									<p class="h3 text-center mt-2">${beveridge.prName}</p>
									</a>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="text-start mt-5">
			<p class="h3">Beans</p>
			<hr/>
		</div>
		<div class="row">
			<div class="owl-carousel owl-loaded owl-drag">
				<div class="owl-stage-outer">
					<div class="owl-stage d-flex">
						<c:forEach var="bean" items="${bean}">

							<div class="owl-item">
								<div class="item">
									<a href="${pageContext.request.contextPath}/order/detailPageGet?prId=${bean.prId}">
									<img src="data:image/jpeg;base64,${bean.prImageOut}" class="rounded">
									<p class="h3 text-center mt-2">${bean.prName}</p>
									</a>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="text-start mt-5">
			<p class="h3">Merchandise</p>
			<hr/>
		</div>
		<div class="row">
			<div class="owl-carousel owl-loaded owl-drag">
				<div class="owl-stage-outer">
					<div class="owl-stage d-flex">
						<c:forEach var="merchandise" items="${merchandise}">

							<div class="owl-item">
								<div class="item">
									<a href="${pageContext.request.contextPath}/order/detailPageGet?prId=${merchandise.prId}">
									<img src="data:image/jpeg;base64,${merchandise.prImageOut}" class="rounded">
									<p class="h3 text-center mt-2">${merchandise.prName}</p>
									</a>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var owl = $('.owl-carousel');
		owl.owlCarousel({
			margin : 100,
			loop : false,
			rewind : false,
			responsive : {
				0 : {
					items : 4,
				},
				500 : {
					items : 4,
				},
				1600 : {
					items : 4,
				}

			}
		})
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>