<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 左邊·功能欄 -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item"><a class="nav-link" href="/orderStatic"> <i
				class="fa-solid fa-house"></i> <span class="menu-title">&emsp;首頁</span>
		</a></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth" aria-expanded="false" aria-controls="auth"> <i
				class="fa-solid fa-user"></i> <span class="menu-title">&emsp;會員管理</span>
			
		</a>
			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="/manager/ShowTableInHomePage"> 管理員界面 </a></li>
<!-- 					<li class="nav-item"><a class="nav-link" href=""> 新增會員 </a></li> -->
				</ul>
			</div>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="fa-solid fa-map"></i> <span class="menu-title">&emsp;景點管理</span>
			
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="/listAttractions">景點總覽</a></li>
					

				</ul>
			</div>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#form-elements" aria-expanded="false"
			aria-controls="form-elements"> <i class="fa-solid fa-ticket"></i>
				<span class="menu-title">&emsp;機票管理</span> 
		</a>
			<div class="collapse" id="form-elements">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="/flightticket.main">機票管理</a></li>
				</ul>
			</div></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#tables" aria-expanded="false" aria-controls="tables"> <i
				class="fa-solid fa-square-h"></i> <span class="menu-title">&emsp;飯店管理</span>
		</a>
			<div class="collapse" id="tables">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="/admin/hotel">飯店管理</a></li>
				</ul>
			</div></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#icons" aria-expanded="false" aria-controls="icons"> <i
				class="fa-solid fa-newspaper"></i> <span class="menu-title">&emsp;討論區管理</span>
				
		</a>
			<div class="collapse" id="icons">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="/article.admin">討論區功能管理</a></li>
				</ul>
			</div></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#charts" aria-expanded="false" aria-controls="charts"> <i
				class="fa-solid fa-cart-shopping"></i> <span class="menu-title">&emsp;購物車與訂單管理</span>
				
		</a>
			<div class="collapse" id="charts">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="/backOrderList">訂單管理</a></li>
					
				</ul>
			</div></li>

	</ul>
</nav>