<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer>
	<br>
	<hr />
	<ul class="list-group footer">
		<li class="list-group-item">
			<div class="d-flex container-fluid mt-2">
				<i class="bi bi-github h1"></i>
				<div class="d-flex justify-content-center align-items-center ms-4" style="width: 40px; height: 40px; border-radius: 50%; background-color: black;">
					<img src="https://upload.wikimedia.org/wikipedia/commons/e/e9/Notion-logo.svg" style="width: 30px;" />
				</div>

				<div class="d-flex justify-content-center align-items-center ms-4" style="width: 40px; height: 40px; border-radius: 50%; background-color: black;">
					<img src="${pageContext.request.contextPath}/resources/image/kosa_logo.jpg" style="width: 30px;" />
				</div>
			</div>
		</li>
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/menu/cart">Cart</a></li>
		<li class="list-group-item"><a href="#">Board</a></li>
		<li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/productList">Admin Page</a></li>
		<li class="list-group-item"><a href="#">Developers</a></li>
		<li class="list-group-item">
			<p class="text-muted" style="font-family: 'Gothic'; font-size: 0.7rem;">© 2024 CodeBrew is Starbucks Copycat. All rights not reserved.</p>
		</li>
	</ul>
</footer>