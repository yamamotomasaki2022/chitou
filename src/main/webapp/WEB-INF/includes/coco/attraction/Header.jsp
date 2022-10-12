<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
	<div
		class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
		<a class="navbar-brand brand-logo mr-5" href="index.html"><img
			src="images/coco/logo3.png" class="mr-2" alt="logo" /> <img
			src="images/coco/logo2.png" class="mr-2" alt="logo" /></a>
	</div>
	<div
		class="navbar-menu-wrapper d-flex align-items-center justify-content-end">

		<ul class="navbar-nav mr-lg-2">
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
						aria-describedby="search"> &emsp;
					<button type="button" class="btn btn-outline-primary btn-sm">
						<i class="fa-solid fa-location-dot"></i>&nbsp;景點門票
					</button>
					&emsp;&emsp;&emsp;&emsp;

					<button type="button" class="btn btn-outline-primary btn-sm">
						<i class="fa-solid fa-hotel"></i>&nbsp;住宿酒店
					</button>

					<!-- <<<<<<< HEAD -->
					&emsp;&emsp;&emsp;&emsp;

					<button type="button" class="btn btn-outline-primary btn-sm">
						<i class="fa-solid fa-plane"></i>&nbsp;交通機票
					</button>
					<!-- <button type="button" class="btn btn-outline-light btn-sm"><i
=======
            &emsp;
            <button type="button" class="btn btn-outline-primary btn-sm"><i
                class="fa-solid fa-location-dot"></i>&nbsp;景點門票</button>
            &emsp;&emsp;&emsp;&emsp;
            <button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='searchHotel'"><i
                class="fa-solid fa-hotel"></i>&nbsp;住宿酒店</button>
            &emsp;&emsp;&emsp;&emsp;

            <button type="button" class="btn btn-outline-primary btn-sm"><i
                class="fa-solid fa-plane"></i>&nbsp;交通機票</button>
            <!-- <button type="button" class="btn btn-outline-light btn-sm"><i
>>>>>>> 6c699a67b12633459faba976f16f8549c4d47d5d
              class="fa-solid fa-plane"></i>&nbsp;交通機票</button> -->
					&emsp;&emsp;&emsp;&emsp; <a href="/home"><button type="button"
							class="btn btn-outline-primary btn-sm">
							<i class="fa-solid fa-comment"></i>&nbsp;討論區
						</button></a> &emsp;&emsp;&emsp;&emsp;

					<div></div>
				</div>

			</li>
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
					<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
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
					</a> </a>
				</div></li>

			<!-- 			<li class="nav-item nav-profile dropdown"> -->
			<!-- 			<a -->
			<!-- 				class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" -->
			<!-- 				id="profileDropdown"> <img src="/images/jacky/login/admin.jpg" -->
			<!-- 					alt="profile" /> -->
			<!-- 			</a> -->
			<li class="nav-item nav-profile dropdown"><a
				class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
				id="profileDropdown"> <img src="/images/jacky/login/admin.jpg"
					alt="profile" />
			</a>

				<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
					aria-labelledby="profileDropdown">
					<a href="/uvmember/toMemberHomePage" class="dropdown-item"> <i
						class="ti-power-off text-primary"></i>
						<button>會員登入</button>
					</a> <a class="dropdown-item"> <i class="ti-settings text-primary"></i>
						<button>設定</button>
					</a> <a href="/logout" class="dropdown-item"> <i
						class="ti-power-off text-primary"></i>
						<button>登出</button>
					</a>
				</div></li>


			<li class="nav-item nav-settings d-none d-lg-flex"><a
				class="nav-link" href="#"> <i class="icon-ellipsis"></i>
			</a></li>
		</ul>
		
		
		
		<button
			class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
			type="button" data-toggle="offcanvas">
			<span class="icon-menu"></span>
		</button>


<!-- 		<div class="dropdown"> -->
<!-- 			<button class="btn btn-secondary dropdown-toggle" type="button" -->
<!-- 				data-toggle="dropdown" aria-expanded="false">Dropdown</button> -->
<!-- 			<div class="dropdown-menu"> -->
<!-- 				<button class="dropdown-item" type="button">Action</button> -->
<!-- 				<button class="dropdown-item" type="button">Another action</button> -->
<!-- 				<button class="dropdown-item" type="button">Something else -->
<!-- 					here</button> -->
<!-- 			</div> -->
<!-- 		</div> -->

	</div>
</nav>