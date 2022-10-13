<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 左邊·功能欄 -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item"><a class="nav-link" href="/manager/chart"> <i
				class="icon-grid menu-icon"></i> <span class="menu-title">首頁</span>
		</a></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#auth" aria-expanded="false" aria-controls="auth"> <i
				class="icon-head menu-icon"></i> <span class="menu-title">會員管理</span>
				<i class="menu-arrow"></i>
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
				<i class="icon-map menu-icon"></i> <span class="menu-title">景點管理</span>
				<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="/listAttractions">景點總覽</a></li>
					<li class="nav-item"><a class="nav-link" href="">景點類型</a></li>

				</ul>
			</div>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#form-elements" aria-expanded="false"
			aria-controls="form-elements"> <i class="icon-columns menu-icon"></i>
				<span class="menu-title">機票管理</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="form-elements">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="/flightticket.main">機票管理</a></li>
				</ul>
			</div></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#tables" aria-expanded="false" aria-controls="tables"> <i
				class="icon-grid-2 menu-icon"></i> <span class="menu-title">飯店管理</span>
				<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="tables">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="/admin/hotel">飯店管理</a></li>
				</ul>
			</div></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#icons" aria-expanded="false" aria-controls="icons"> <i
				class="icon-contract menu-icon"></i> <span class="menu-title">討論區管理</span>
				<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="icons">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="/article.admin">討論區功能管理</a></li>
				</ul>
			</div></li>

		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#charts" aria-expanded="false" aria-controls="charts"> <i
				class="icon-paper menu-icon"></i> <span class="menu-title">購物車與訂單管理</span>
				<i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="charts">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="/allAttractions">景點加入</a></li>
					<li class="nav-item"><a class="nav-link" href="/cart">訂單</a></li>
					<li class="nav-item"><a class="nav-link" href="/order">購物車</a></li>
				</ul>
			</div></li>

	</ul>
</nav>