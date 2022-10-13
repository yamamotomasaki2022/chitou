<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 頂上欄位 -->
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
	<div
		class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
		<a class="navbar-brand brand-logo mr-5" href="index.html"><img
			src="/images/coco/logo3.png" class="mr-2" alt="logo" /> <img
			src="/images/coco/logo2.png" class="mr-2" alt="logo" /></a>
	</div>
	<div
		class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
		<button class="navbar-toggler navbar-toggler align-self-center"
			type="button" data-toggle="minimize">
			<span><i class="fa-solid fa-bars"></i></span>
		</button>
		<ul class="navbar-nav mr-lg-4">
			<li class="nav-item nav-search d-none d-lg-block">
				<div class="input-group">
					<div class="input-group-prepend hover-cursor"
						id="navbar-search-icon">
						<span class="input-group-text" id="search"> <i
							class="fa-solid fa-magnifying-glass"></i>
						</span>
					</div>
					<input type="text" class="form-control" id="navbar-search-input"
						placeholder="探索全球目的地/活動" aria-label="search"
						aria-describedby="search">
				</div>
			</li>
		</ul>
		<ul class="navbar-nav mr-lg-4">
			<li class="nav-item dropdown"><a
				class="dropdown-toggle btn btn-inverse-primary btn-sm" href="#"
				data-toggle="dropdown"> <i class="fa-solid fa-location-dot"></i>&nbsp;景點門票
			</a>
				<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
					aria-labelledby="profileDropdown">
					<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
						景點總覽
					</a> <a href="" class="dropdown-item"> <i
						class="ti-power-off text-primary"></i> 管理員登出
					</a>
				</div></li>
		</ul>

		<ul class="navbar-nav mr-lg-4">
			<li class="nav-item dropdown"><a
				class="dropdown-toggle btn btn-inverse-primary btn-sm" href="#"
				data-toggle="dropdown"> <i class="fa-solid fa-hotel"></i>&nbsp;住宿酒店
			</a>
				<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
					aria-labelledby="profileDropdown">
					<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
						景點總覽
					</a> <a href="" class="dropdown-item"> <i
						class="ti-power-off text-primary"></i> 管理員登出
					</a>
				</div></li>
		</ul>


		<ul class="navbar-nav mr-lg-4">
			<li class="nav-item dropdown"><a
				class="dropdown-toggle btn btn-inverse-primary btn-sm" href="#"
				data-toggle="dropdown"> <i class="fa-solid fa-plane"></i>&nbsp;交通機票
			</a>
				<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
					aria-labelledby="profileDropdown">
					<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
						景點總覽
					</a> <a href="" class="dropdown-item"> <i
						class="ti-power-off text-primary"></i> 管理員登出
					</a>
				</div></li>
		</ul>
		<ul class="navbar-nav mr-lg-4">
			<li class="nav-item dropdown"><a
				class="dropdown-toggle btn btn-inverse-primary btn-sm" href="#"
				data-toggle="dropdown"> <i class="fa-solid fa-comment"></i>&nbsp;討論區
			</a>
				<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
					aria-labelledby="profileDropdown">
					<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
						景點總覽
					</a> <a href="" class="dropdown-item"> <i
						class="ti-power-off text-primary"></i> 管理員登出
					</a>
				</div></li>
		</ul>

		<ul class="navbar-nav navbar-nav-right">
			<li class="nav-item dropdown"><a
				class="nav-link count-indicator dropdown-toggle"
				id="notificationDropdown" href="#" data-toggle="dropdown"> <i
					class="fa-solid fa-cart-shopping"></i> <span class="count"></span>
			</a>
				<div
					class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
					aria-labelledby="notificationDropdown">
					<p class="mb-0 font-weight-normal float-left dropdown-header">購物車</p>
					<a class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-success">
								<i class="ti-info-alt mx-0"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<h6 class="preview-subject font-weight-normal">Application
								Error</h6>
							<p class="font-weight-light small-text mb-0 text-muted">Just
								now</p>
						</div>
					</a> <a class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-warning">
								<i class="ti-settings mx-0"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<h6 class="preview-subject font-weight-normal">Settings</h6>
							<p class="font-weight-light small-text mb-0 text-muted">
								Private message</p>
						</div>
					</a> <a class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-info">
								<i class="ti-info-alt mx-0"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<h6 class="preview-subject font-weight-normal">New user
								registration</h6>
							<p class="font-weight-light small-text mb-0 text-muted">2
								days ago</p>
						</div>
					</a>
				</div></li>
			<li class="nav-item nav-profile dropdown"><a
				class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
				id="profileDropdown"> <img id="img1" src="/images/jacky/login/default1.png"
					alt="selfie" />
			</a>
				<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
					aria-labelledby="profileDropdown">
					<a href="/uvmember/toMemberHomePage" class="dropdown-item"> <i class="ti-settings text-primary"></i>
						個人頁面
					</a> 
					<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
						Settings
					</a> 
					<a id="logout" href="/logout" class="dropdown-item"> <i
						class="ti-power-off text-primary"></i> 登出
					</a>
				</div></li>

		</ul>
		<button
			class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
			type="button" data-toggle="offcanvas">
			<span class="icon-menu"></span>
		</button>
	</div>
</nav>