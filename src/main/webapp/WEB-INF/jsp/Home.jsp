<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-Hant">

<head>
<meta charset="utf-8">
<title>ChiTou</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link rel="stylesheet"
	href="/css/beforehomepage/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="/css/beforehomepage/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" href="/css/beforehomepage/css/tiny-slider.css">
<link rel="stylesheet" href="/css/beforehomepage/css/aos.css">
<link rel="stylesheet" href="/css/beforehomepage/css/style.css">


</head>


<body>


	<!-- header 頭列 -->

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<nav class="site-nav">
	<div class="container">
		<div class="menu-bg-wrap" style="background-color: lightblue">
			<div class="site-navigation">
				<img src="/css/beforehomepage/images/chitou.png" /> <a href=""
					class="logo m-0 start"> ChiTou </a>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
					<li><a href="Home.jsp">Home</a></li>
					<li class="has-children"><a href="">交通住宿</a>
						<ul class="dropdown">
							<li><a href="/member/yee">住宿訂購</a></li>
							<li><a href="flightTicket">機票訂購</a></li>

						</ul></li>
					<li><a href="listAttractions">景點門票</a></li>
					<li><a href="article.main">評論區</a></li>
					<li class="has-children"><a href="">個人</a>
						<ul class="dropdown">
							<li><a href="/manager/AdminHomePage">會員專區</a></li>
							<!-- <li><a href="weber-journeyMain.jsp">我的行程</a></li> -->
							<li><a href="index">個人購物車</a></li>
						</ul>
				</ul>


				<a href="#"
					class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
				</a>

			</div>
		</div>
	</div>
	</nav>
	<!-- 照片 -->
	<div class="hero">

		<link rel="stylesheet" href="/css/beforehomepage/css/style.css">

		<div class="hero-slide">
			<!--             <div class="img overlay" style="background-image: url('images/image1.jpg')"></div> -->
			<!--             <div class="img overlay" style="background-image: url('images/image2.jpg')"></div> -->
			<div class="img overlay"
				style="background-image: url('/css/beforehomepage/images/image1.jpg')"></div>
			<div class="img overlay"
				style="background-image: url('/css/beforehomepage/images/image2.jpg')"></div>
			<div class="img overlay"
				style="background-image: url('/css/beforehomepage/images/image3.jpg')"></div>
		</div>

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center">
					<h1 class="heading" data-aos="fade-up">全世界最棒的旅遊體驗</h1>
					<form action="#"
						class="narrow-w form-search d-flex align-items-stretch mb-3"
						data-aos="fade-up" data-aos-delay="200">
						<input type="text" class="form-control px-4"
							placeholder="輸入目的地、景點、體驗行程或活動名稱....">
						<button type="submit" class="btn btn"
							style="background-color: lightblue">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-lg-6">
					<h2 class="font-weight-bold text-primary heading">熱門飯店</h2>
				</div>
				<div class="col-lg-6 text-lg-end">
					<p>
						<a href="#" target="_blank"
							class="btn btn-primary text-white py-3 px-4"
							style="background-color: lightblue">查看更多飯店</a>
					</p>
				</div>
			</div>

			<div class="row">

				<div class="col-12">


					<div class="property-slider-wrap">



						<div class="property-slider">

							<div class="property-item">

								<a href="property-single.html" class="img"> <img
									src="/css/beforehomepage/images/image-1.jpg" alt="Image"
									class="img-fluid">
								</a>
								<div class="property-content">
									<div class="price mb-2">
										<span>$1,740</span>
									</div>
									<div>
										<span class="d-block mb-2 text-black-50"><i
											class="fa-solid fa-location-dot"></i> 320桃園市中壢區民權路398號</span> <span
											class="city d-block mb-3">古華花園飯店 Hotel Kuva Chateau</span>

										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span> <span class="caption">1
													bed</span>
											</span> <span class="d-block d-flex align-items-center"> <span
												class="icon-bath me-2"></span> <span class="caption">1
													bath</span>
											</span>
										</div>

										<a href="" class="btn btn-primary py-2 px-3"
											style="background-color: lightblue">詳細</a>
									</div>
								</div>
							</div>

							<!-- .item -->

							<div class="property-item">

								<a href="property-single.html" class="img"> <img
									src="/css/beforehomepage/images/image-2.jpg" alt="Image"
									class="img-fluid">
								</a>

								<div class="property-content">
									<div class="price mb-2">
										<span>$1,200,0</span>
									</div>
									<div>
										<span class="d-block mb-2 text-black-50"><i
											class="fa-solid fa-location-dot"></i> 110台北市信義區忠孝東路五段10號</span> <span
											class="city d-block mb-3">台北W飯店</span>

										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span> <span class="caption">2
													beds</span>
											</span> <span class="d-block d-flex align-items-center"> <span
												class="icon-bath me-2"></span> <span class="caption">2
													baths</span>
											</span>
										</div>

										<a href="" class="btn btn-primary py-2 px-3"
											style="background-color: lightblue">詳細</a>
									</div>
								</div>
							</div>
							<!-- .item -->

							<div class="property-item">

								<a href="property-single.html" class="img"> <img
									src="/css/beforehomepage/images/image-3.jpg" alt="Image"
									class="img-fluid">
								</a>

								<div class="property-content">
									<div class="price mb-2">
										<span>$4,840</span>
									</div>
									<div>
										<span class="d-block mb-2 text-black-50"><i
											class="fa-solid fa-location-dot"></i> 880澎湖縣馬公市同和路168號</span> <span
											class="city d-block mb-3">澎澄飯店 Discovery Hotel</span>

										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span> <span class="caption">2
													beds</span>
											</span> <span class="d-block d-flex align-items-center"> <span
												class="icon-bath me-2"></span> <span class="caption">1
													bath</span>
											</span>
										</div>

										<a href="" class="btn btn-primary py-2 px-3"
											style="background-color: lightblue">詳細</a>
									</div>
								</div>
							</div>
							<!-- .item -->

							<div class="property-item">

								<a href="property-single.html" class="img"> <img
									src="/css/beforehomepage/images/japan-1.jpg" alt="Image"
									class="img-fluid">
								</a>
								<div class="property-content">
									<div class="price mb-2">
										<span>$1,247,5</span>
									</div>
									<div>
										<span class="d-block mb-2 text-black-50"><i
											class="fa-solid fa-location-dot"></i> 2 Chome-1-1
											Nihonbashimuromachi, Chuo City, Tokyo 103-8328日本</span> <span
											class="city d-block mb-3">東京文華東方酒店</span>

										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span> <span class="caption">2
													beds</span>
											</span> <span class="d-block d-flex align-items-center"> <span
												class="icon-bath me-2"></span> <span class="caption">1
													bath</span>
											</span>
										</div>

										<a href="" class="btn btn-primary py-2 px-3"
											style="background-color: lightblue">詳細</a>
									</div>
								</div>
							</div>
							<!-- .item -->

							<div class="property-item">

								<a href="property-single.html" class="img"> <img
									src="/css/beforehomepage/images/japan-2.jpg" alt="Image"
									class="img-fluid">
								</a>

								<div class="property-content">
									<div class="price mb-2">
										<span>$1,291,000</span>
									</div>
									<div>
										<span class="d-block mb-2 text-black-50"><i
											class="fa-solid fa-location-dot"></i> 163-1055 東京都
											新宿區Nishishinjuku 3-7-1-2 Nishi Shinjuku</span> <span
											class="city d-block mb-3">東京凱悅花園酒店</span>

										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span> <span class="caption">2
													beds</span>
											</span> <span class="d-block d-flex align-items-center"> <span
												class="icon-bath me-2"></span> <span class="caption">2
													baths</span>
											</span>
										</div>

										<a href="" class="btn btn-primary py-2 px-3"
											style="background-color: lightblue">詳細</a>
									</div>
								</div>
							</div>
							<!-- .item -->

							<div class="property-item">

								<a href="property-single.html" class="img"> <img
									src="/css/beforehomepage/images/japan-2.jpg" alt="Image"
									class="img-fluid">
								</a>

								<div class="property-content">
									<div class="price mb-2">
										<span>$1,632,4</span>
									</div>
									<div>
										<span class="d-block mb-2 text-black-50"><i
											class="fa-solid fa-location-dot"></i> 1 Chome-1-1 Marunouchi,
											Chiyoda City, Tokyo 100-0005日本</span> <span
											class="city d-block mb-3"> 東京皇宮酒店</span>

										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span> <span class="caption">2
													beds</span>
											</span> <span class="d-block d-flex align-items-center"> <span
												class="icon-bath me-2"></span> <span class="caption">2
													baths</span>
											</span>
										</div>

										<a href="" class="btn btn-primary py-2 px-3"
											style="background-color: lightblue">詳細</a>
									</div>
								</div>
							</div>
							<!-- .item -->

							<div class="property-item">

								<a href="property-single.html" class="img"> <img
									src="/css/beforehomepage/images/usa-2.jpg" alt="Image"
									class="img-fluid">
								</a>
								<div class="property-content">
									<div class="price mb-2">
										<span>$5,691</span>
									</div>
									<div>
										<span class="d-block mb-2 text-black-50"><i
											class="fa-solid fa-location-dot"></i> 400 West 42nd Street,
											NY 10036</span> <span class="city d-block mb-3">Pod Times
											Square（龐德時代酒店）</span>

										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span> <span class="caption">1
													bed</span>
											</span> <span class="d-block d-flex align-items-center"> <span
												class="icon-bath me-2"></span> <span class="caption">1
													bath</span>
											</span>
										</div>

										<a href="" class="btn btn-primary py-2 px-3"
											style="background-color: lightblue">詳細</a>
									</div>
								</div>
							</div>
							<!-- .item -->

							<div class="property-item">

								<a href="property-single.html" class="img"> <img
									src="/css/beforehomepage/images/usa-2.jpg" alt="Image"
									class="img-fluid">
								</a>

								<div class="property-content">
									<div class="price mb-2">
										<span>$6,590</span>
									</div>
									<div>
										<span class="d-block mb-2 text-black-50"><i
											class="fa-solid fa-location-dot"></i> 140 West 28th Street</span> <span
											class="city d-block mb-3">SpringHill Suites by
											Marriott New York Manhattan Chelsea</span>

										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span> <span class="caption">2
													beds</span>
											</span> <span class="d-block d-flex align-items-center"> <span
												class="icon-bath me-2"></span> <span class="caption">1
													bath</span>
											</span>
										</div>

										<a href="" class="btn btn-primary py-2 px-3"
											style="background-color: lightblue">詳細</a>
									</div>
								</div>
							</div>
							<!-- .item -->

							<div class="property-item">

								<a href="property-single.html" class="img"> <img
									src="/css/beforehomepage/images/usa-3.jpg" alt="Image"
									class="img-fluid">
								</a>

								<div class="property-content">
									<div class="price mb-2">
										<span>$6,141</span>
									</div>
									<div>
										<span class="d-block mb-2 text-black-50"><i
											class="fa-solid fa-location-dot"></i> 481 Eighth Avenue,</span> <span
											class="city d-block mb-3">The New Yorker, A Wyndham
											Hotel（溫德姆紐約客飯店）</span>

										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span> <span class="caption">1
													bed</span>
											</span> <span class="d-block d-flex align-items-center"> <span
												class="icon-bath me-2"></span> <span class="caption">1
													bath</span>
											</span>
										</div>

										<a href="" class="btn btn-primary py-2 px-3"
											style="background-color: lightblue">詳細</a>
									</div>
								</div>
							</div>
							<!-- .item -->


						</div>


						<div id="property-nav" class="controls" tabindex="0"
							aria-label="Carousel Navigation">
							<span class="prev" data-controls="prev" aria-controls="property"
								tabindex="-1">往前</span> <span class="next" data-controls="next"
								aria-controls="property" tabindex="-1">往後</span>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>

	<section class="features-1">
	<div class="container">
		<div class="row">
			<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
				<div class="box-feature">
					<span class="flaticon-house"></span>
					<h3 class="mb-3">我</h3>
					<p>我是分隔線</p>
					<p>
						<a href="#" class="learn-more">Learn More</a>
					</p>
				</div>
			</div>
			<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
				<div class="box-feature">
					<span class="flaticon-building"></span>
					<h3 class="mb-3">是</h3>
					<p>我是分隔線</p>
					<p>
						<a href="#" class="learn-more">Learn More</a>
					</p>
				</div>
			</div>
			<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
				<div class="box-feature">
					<span class="flaticon-house-3"></span>
					<h3 class="mb-3">假</h3>
					<p>我是分隔線</p>
					<p>
						<a href="#" class="learn-more">Learn More</a>
					</p>
				</div>
			</div>
			<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="600">
				<div class="box-feature">
					<span class="flaticon-house-1"></span>
					<h3 class="mb-3">的</h3>
					<p>我是分隔線</p>
					<p>
						<a href="#" class="learn-more">Learn More</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	</section>



	<div class="section sec-testimonials">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-md-6">
					<h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">熱門景點</h2>
				</div>
				<div class="col-md-6 text-md-end">
					<div id="testimonial-nav">
						<span class="prev" data-controls="prev">往前</span> <span
							class="next" data-controls="next">往後</span>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-4"></div>
			</div>
			<div class="testimonial-slider-wrap">
				<div class="testimonial-slider">
					<div class="item">
						<div class="testimonial">
							<img src="/css/beforehomepage/images/xpark.png" alt="Image"
								class="img-fluid w-100 mb-100">
							<div class="rate">
								<br> <span class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span>
							</div>
							<h3 class="h5 text-primary mb-4">Xpark 都會型水生公園門票</h3>
							<blockquote>
								<p>Xpark
									為台灣首座新都會型水生公園。將生活在地球上各種地域的生物們的環境，透過空間演出與科技的融合，加以忠實的重現。
									在連氣溫、濕度、味道及聲音都經過縝密計算的空間裡，從天花板到地坪、延伸至水槽的影像演出呈現出 360° 具魄力的沉浸式空間。
									來訪旅客彷彿真的身歷其境，使用五感體驗各真實場景。主角，是生活在那裡的生物們，隨環境變遷而演變進化的生物們的不思議，
									從各種角度將其魅力性襯托出來的環境演出也是一大特徵。</p>
							</blockquote>
							<p class="text-black-50">
								<i class="fa-solid fa-location-dot"></i> 桃園市中壢區春德路105號
							</p>
						</div>
					</div>

					<div class="item">
						<div class="testimonial">
							"/css/beforehomepage/images/image4.jpg" <img
								src="/css/beforehomepage/images/image4.jpg" alt="Image"
								class="img-fluid w-100 mb-100 ">
							<div class="rate">
								<br> <span class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span>
							</div>
							<h3 class="h5 text-primary mb-4">花蓮遠雄海洋公園</h3>
							<blockquote>
								<p>–七月限定「海洋冰風暴2-冰怪來襲」活動 海洋公園獨家暑期限定活動【海洋冰風暴2-冰怪來襲】
									炎熱的夏日即將到來！我們將極凍整個夏天！ 水槍水車激起的水花大戰，帶領大家持續清涼high酷到最高點！</p>
							</blockquote>
							<p class="text-black-50">
								<i class="fa-solid fa-location-dot"></i> 台灣花蓮縣壽豐鄉189號
							</p>
						</div>
					</div>

					<div class="item">
						<div class="testimonial">
							<img src="/css/beforehomepage/images/image5.jpg" alt="Image"
								class="img-fluid w-100 mb-100">
							<div class="rate">
								<br> <span class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span>
							</div>
							<h3 class="h5 text-primary mb-4">台中麗寶樂園・馬拉灣</h3>
							<blockquote>
								<p>麗寶樂園是全台首屈一指的大型遊樂園，共分為三大園區，分別是探索樂園、馬拉灣及天空之夢——摩天輪
									陸上的「探索樂園」擁有豐富的刺激設施，吸引眾多遊客前來朝聖，若你喜歡極限挑戰，絕對不能錯過全台唯一的斷軌式雲霄飛車「 搶救地心
									」，是雲霄飛車迷必搭的首選設施 家喻戶曉的馬拉灣水上樂園（夏日限定），園區內擁有 10
									項以上的水上設施，如高空快速滑水道「急速勇士」和巨大的 U 型滑板「巫師飛艇」，彎曲的滑道與驚人的高度，令人興奮又期待
									天空之夢為全台最高摩天輪-海拔總高度 384M，約等同台北 101 大樓 88 層觀景台
									全台唯一完全由台灣專業團隊負責，無任何外籍技師參與組裝完成的摩天輪，堪稱台灣之光。</p>
							</blockquote>
							<p class="text-black-50">
								<i class="fa-solid fa-location-dot"></i> 台灣台中市后里區福容路8號
							</p>
						</div>
					</div>

					<div class="item">
						<div class="testimonial">
							<img src="/css/beforehomepage/images/image6.jpg" alt="Image"
								class="img-fluid  w-100 mb-100">
							<div class="rate">
								<br> <span class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span> <span
									class="icon-star text-warning"></span>
							</div>
							<h3 class="h5 text-primary mb-4">六福村主題樂園</h3>
							<blockquote>
								<p>由「 美國大西部 」、「 南太平洋 」、「 阿拉伯皇宮 」以及「 非洲部落 」等四大異國主題村所建構成， 加上
									2012 年推出「六福水樂園」，高達75公頃的廣闊遊樂場域，除了擁有 30
									項以上廣受年輕人喜愛的驚險刺激遊樂設施以及適合親子同遊的野生動物園外，
									還有定時演出的音樂水舞秀、媲美迪士尼的大型花車遊行等各項精彩歌舞表演，期望能帶給消費者更多身心靈上的感動與滿足。</p>
							</blockquote>
							<p class="text-black-50">
								<i class="fa-solid fa-location-dot"></i> 新竹縣關西鎮仁安里拱子溝60號
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div class="section section-4 bg-light">
		<div class="container">
			<div class="row justify-content-center  text-center mb-5">
				<div class="col-lg-5">
					<h2 class="font-weight-bold heading text-primary mb-4">嚴格把關只為了讓您安心旅遊!!!</h2>
					<p class="text-black-50">為了您的安全，我們聘請了1000000人，來審核每個飯店景點。</p>
					<br>
					<p class="text-black-50">為了及時回復您的訊息，我們聘請了2000000人，24小時即時回復您。</p>

				</div>
			</div>
			<div class="row justify-content-between mb-5">
				<div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
					<div class="img-about dots"></div>
				</div>



				<div class="col-lg-4">
					<div class="d-flex feature-h">
						<span class="wrap-icon me-3"> <span class="icon-home2"></span>
						</span>
						<div class="feature-text">
							<h3 class="heading">安全住宿</h3>
							<p class="text-black-50">每個飯店透過人工審核上架</p>
						</div>
					</div>

					<div class="d-flex feature-h">
						<span class="wrap-icon me-3"> <span class="icon-person"></span>
						</span>
						<div class="feature-text">
							<h3 class="heading">安全個資</h3>
							<p class="text-black-50">絕不會讓您的資料外洩，如外洩一定是您自身問題造成</p>
						</div>
					</div>


				</div>
			</div>
			<div class="row section-counter mt-5">
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="300">
					<div class="counter-wrap mb-5 mb-lg-0">
						<span class="number"><span class="countup text-primary">9333</span></span>
						<span class="caption text-black-50">#至今的景點數量</span>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="400">
					<div class="counter-wrap mb-5 mb-lg-0">
						<span class="number"><span class="countup text-primary">7414</span></span>
						<span class="caption text-black-50">#至今的飯店數量</span>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="500">
					<div class="counter-wrap mb-5 mb-lg-0">
						<span class="number"><span class="countup text-primary">9316</span></span>
						<span class="caption text-black-50">#至今的會員數量</span>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="600">
					<div class="counter-wrap mb-5 mb-lg-0">
						<span class="number"><span class="countup text-primary">7191</span></span>
						<span class="caption text-black-50">#至今的評論區文章數量</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="row justify-content-center footer-cta" data-aos="fade-up">
			<div class="col-lg-7 mx-auto text-center">
				<h2 class="mb-4 ">如何成為ChiTou成員?</h2>
				<p>
					<a href="#" target="_blank"
						class="btn btn-primary text-white py-3 px-4"
						style="background-color: lightblue">加入會員</a>
				</p>
			</div>
			<!-- /.col-lg-7 -->
		</div>
		<!-- /.row -->
	</div>

	<div class="section section-5 bg-light">
		<div class="container">
			<div class="row justify-content-center  text-center mb-5">
				<div class="col-lg-6 mb-5">
					<h2 class="font-weight-bold heading text-primary mb-4">我們的成員</h2>
					<p class="text-black-50"></p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0">
					<div class="h-100 person">

						<img src="/css/beforehomepage/images/dog1.jpg"
							class="img-responsive" alt="Cinque Terre">

						<div class="person-contents">
							<h2 class="mb-0">
								<a href="#">組長:李芝宇</a>
							</h2>
							<span class="meta d-block mb-3">負責項目:購物車功能</span>
							<p>自介:</p>

							<ul class="social list-unstyled list-inline dark-hover">
								<li class="list-inline-item"><a href="#"><span
										class="icon-twitter"></span></a></li>
								<li class="list-inline-item"><a href="#"><span
										class="icon-facebook"></span></a></li>
								<li class="list-inline-item"><a href="#"><span
										class="icon-linkedin"></span></a></li>
								<li class="list-inline-item"><a href="#"><span
										class="icon-instagram"></span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0">
					<div class="h-100 person">

						<img src="/css/beforehomepage/images/dog2.jpg"
							class="img-responsive" alt="Cinque Terre">

						<div class="person-contents">
							<h2 class="mb-0">
								<a href="#">技術長:馬新傑</a>
							</h2>
							<span class="meta d-block mb-3">負責項目:會員功能</span>
							<p>自介:</p>


							<ul class="social list-unstyled list-inline dark-hover">
								<li class="list-inline-item"><a href="#"><span
										class="icon-twitter"></span></a></li>
								<li class="list-inline-item"><a href="#"><span
										class="icon-facebook"></span></a></li>
								<li class="list-inline-item"><a href="#"><span
										class="icon-linkedin"></span></a></li>
								<li class="list-inline-item"><a href="#"><span
										class="icon-instagram"></span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0">
					<div class="h-100 person">

						<img src="/css/beforehomepage/images/dog3.jpg"
							class="img-responsive" alt="Cinque Terre">

						<div class="person-contents">
							<h2 class="mb-0">
								<a href="#">組員:陳韋翰</a>
							</h2>
							<span class="meta d-block mb-3">負責項目:個人旅程功能</span>
							<p>自介:</p>

							<ul class="social list-unstyled list-inline dark-hover">
								<li class="list-inline-item"><a href="#"><span
										class="icon-twitter"></span></a></li>
								<li class="list-inline-item"><a href="#"><span
										class="icon-facebook"></span></a></li>
								<li class="list-inline-item"><a href="#"><span
										class="icon-linkedin"></span></a></li>
								<li class="list-inline-item"><a href="#"><span
										class="icon-instagram"></span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0">
			<div class="h-100 person">

				<img src="/css/beforehomepage/images/dog4.jpg"
					class="img-responsive" alt="Cinque Terre">

				<div class="person-contents">
					<h2 class="mb-0">
						<a href="#">組員:康芷婷</a>
					</h2>
					<span class="meta d-block mb-3">負責項目:景點功能</span>
					<p>自介:</p>

					<ul class="social list-unstyled list-inline dark-hover">
						<li class="list-inline-item"><a href="#"><span
								class="icon-twitter"></span></a></li>
						<li class="list-inline-item"><a href="#"><span
								class="icon-facebook"></span></a></li>
						<li class="list-inline-item"><a href="#"><span
								class="icon-linkedin"></span></a></li>
						<li class="list-inline-item"><a href="#"><span
								class="icon-instagram"></span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0">
			<div class="h-100 person">

				<img src="/css/beforehomepage/images/dog5.jpg"
					class="img-responsive" alt="Cinque Terre">

				<div class="person-contents">
					<h2 class="mb-0">
						<a href="#">組員:林文琦</a>
					</h2>
					<span class="meta d-block mb-3">負責項目:機票酒店功能</span>
					<p>自介:</p>

					<ul class="social list-unstyled list-inline dark-hover">
						<li class="list-inline-item"><a href="#"><span
								class="icon-twitter"></span></a></li>
						<li class="list-inline-item"><a href="#"><span
								class="icon-facebook"></span></a></li>
						<li class="list-inline-item"><a href="#"><span
								class="icon-linkedin"></span></a></li>
						<li class="list-inline-item"><a href="#"><span
								class="icon-instagram"></span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0">
			<div class="h-100 person">

				<img src="/css/beforehomepage/images/dog6.jpg"
					class="img-responsive" alt="Cinque Terre">

				<div class="person-contents">
					<h2 class="mb-0">
						<a href="#">組員:鍾思雅</a>
					</h2>
					<span class="meta d-block mb-3">負責項目:評論區功能</span>
					<p>自介:</p>

					<ul class="social list-unstyled list-inline dark-hover">
						<li class="list-inline-item"><a href="#"><span
								class="icon-twitter"></span></a></li>
						<li class="list-inline-item"><a href="#"><span
								class="icon-facebook"></span></a></li>
						<li class="list-inline-item"><a href="#"><span
								class="icon-linkedin"></span></a></li>
						<li class="list-inline-item"><a href="#"><span
								class="icon-instagram"></span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	<div class="site-footer">
		<div class="container">

			<div class="row">
				<div class="col-lg-4">
					<div class="widget">
						<h3>Contact</h3>
						<address>43 Raymouth Rd. Baltemoer, London 3910</address>
						<ul class="list-unstyled links">
							<li><a href="tel://11234567890">+1(123)-456-7890</a></li>
							<li><a href="tel://11234567890">+1(123)-456-7890</a></li>
							<li><a href="mailto:info@mydomain.com">info@mydomain.com</a></li>
						</ul>
					</div>
					<!-- /.widget -->
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<div class="widget">
						<h3>Sources</h3>
						<ul class="list-unstyled float-start links">
							<li><a href="#">About us</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">Vision</a></li>
							<li><a href="#">Mission</a></li>
							<li><a href="#">Terms</a></li>
							<li><a href="#">Privacy</a></li>
						</ul>
						<ul class="list-unstyled float-start links">
							<li><a href="#">Partners</a></li>
							<li><a href="#">Business</a></li>
							<li><a href="#">Careers</a></li>
							<li><a href="#">Blog</a></li>
							<li><a href="#">FAQ</a></li>
							<li><a href="#">Creative</a></li>
						</ul>
					</div>
					<!-- /.widget -->
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<div class="widget">
						<h3>Links</h3>
						<ul class="list-unstyled links">
							<li><a href="#">Our Vision</a></li>
							<li><a href="#">About us</a></li>
							<li><a href="#">Contact us</a></li>
						</ul>

						<ul class="list-unstyled social">
							<li><a href="#"><span class="icon-instagram"></span></a></li>
							<li><a href="#"><span class="icon-twitter"></span></a></li>
							<li><a href="#"><span class="icon-facebook"></span></a></li>
							<li><a href="#"><span class="icon-linkedin"></span></a></li>
							<li><a href="#"><span class="icon-pinterest"></span></a></li>
							<li><a href="#"><span class="icon-dribbble"></span></a></li>
						</ul>
					</div>
					<!-- /.widget -->
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->

			<div class="row mt-5">
				<div class="col-12 text-center">
					<!-- 
          **==========
          NOTE: 
          Please don't remove this copyright link unless you buy the license here https://untree.co/license/  
          **==========
        -->

					<p>
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						. All Rights Reserved. &mdash; Designed with love by <a
							href="https://untree.co">Untree.co</a>
						<!-- License information: https://untree.co/license/ -->
					</p>

				</div>
			</div>
		</div>
		<!-- /.container -->
	</div>
	<!-- /.site-footer -->


	<!-- Preloader -->
	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="visually-hidden">Loading...</span>
		</div>
	</div>

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		var logout = ${logout}
		console.log('logout:' + logout)
		

		if (logout == 1) {
			Swal.fire(
					  'Thanks!',
					  'You have logged out!',
					  'success'
					)
		}
	</script>

	<script src="/js/coco/off-canvas.js"></script>


	<script src="/css/beforehomepage/js/bootstrap.bundle.min.js"></script>
	<script src="/css/beforehomepage/js/tiny-slider.js"></script>
	<script src="/css/beforehomepage/js/aos.js"></script>
	<script src="/css/beforehomepage/js/navbar.js"></script>
	<script src="/css/beforehomepage/js/counter.js"></script>
	<script src="/css/beforehomepage/js/custom.js"></script>
	<script src="https://kit.fontawesome.com/6c4c414686.js"
		crossorigin="anonymous"></script>
</body>

</body>

</html>