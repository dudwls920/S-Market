<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/control/resources/css/style.css?">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	<style>
		img{
			width : 200px;
			height : 200px;
		}
		div .swiper-slide.box{
			margin: 0px;
		}
		.box h3{
		font-size:25px;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
		height:40px;
		}
	</style>
</head>
<body>
<%@include file="Header.jsp"%>

<!-- home section starts 페이지중단시작  -->

<!-- 슬라이드쇼 시작-->
<script>

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) { slideIndex = 1 }
        if (n < 1) { slideIndex = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }
    let slideIndex = 1;
    window.onload = function(){
        showSlides(slideIndex);
        setInterval("plusSlides(1)",3000);
    }

    // Next/previous controls
    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    // Thumbnail image controls
    function currentSlide(n) {
        showSlides(slideIndex = n);
    }
    
    document.addEventListener("DOMContentLoaded", function() {

        var mySwiper = new Swiper('.swiper-container', {
            slidesPerView: 4,
            slidesPerGroup: 4,
            observer: true,
            observeParents: true,
            spaceBetween: 24,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            breakpoints: {
                1280: {
                    slidesPerView: 3,
                    slidesPerGroup: 3,
                },
                720: {
                    slidesPerView: 1,
                    slidesPerGroup: 1,
                }
            }
        });
        
    });

</script>
<!-- Slideshow container -->
<div class="slideshow-container">

    <!-- Full-width images with number and caption text -->
    <div class="mySlides fade" style="margin-top : 20px;">
      <img src="resources/img/category-1.jpg" style="width:100%">
    </div>
  
    <div class="mySlides fade" style="margin-top : 20px;">
      <img src="resources/img/category-2.jpg" style="width:100%">
    </div>
  
    <div class="mySlides fade" style="margin-top : 20px;">
      <img src="resources/img/category-3.jpg" style="width:100%">
    </div>
  
    <!-- Next and previous buttons -->
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
  </div>
  <br>
  
  <!-- The dots/circles -->
  <div style="text-align:center">
    <span class="dot" onclick="currentSlide(1)"></span>
    <span class="dot" onclick="currentSlide(2)"></span>
    <span class="dot" onclick="currentSlide(3)"></span>
  </div>

<!-- <section class="home" id="home">
원래 최상단에 있었던 섹션임 일단 주석
</section> -->

<!-- home section ends -->

<!-- banner section starts 

<section class="banner-container">

    <div class="banner">
        <img src="images/banner-1.jpg" alt="">
        <div class="content">
            <h3>special offer</h3>
            <p>upto 45% off</p>
            <a href="#" class="btn">check out</a>
        </div>
    </div>

    <div class="banner">
        <img src="images/banner-2.jpg" alt="">
        <div class="content">
            <h3>limited offer</h3>
            <p>upto 50% off</p>
            <a href="#" class="btn">check out</a>
        </div>
    </div>

</section>

 banner section ends -->

<!-- category section starts  -->

<section class="category" id="category">

    <h1 class="heading">제일 잘나가는상품</span></h1>
	<div class="swiper-container">
    	<div class="swiper-wrapper">
    	<c:forEach items="${ProductBestSales}" var="best">
				<div class="swiper-slide box" style="margin-right: 0">
					<h3 style="font-size:25px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; height:40px;">${best.productname}</h3>
					<img src="resources\img${best.productimage}"> 
					<a href="/control/productdetail?productnum=${best.productnum}" class="btn" style="width:80%;">Shop Now</a>
					</div>
				</c:forEach>
    		</div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
</div>


</section>

<!-- category section ends -->

<!-- product section starts  -->

<section class="product" id="product">

    <h1 class="heading">latest <span>products</span></h1>

    <div class="box-container">

        <div class="box">
            <span class="discount">-20%</span>
            <img src="resources/img/appliances/refrigerator2.PNG" alt="">
            <h3>BESPOKE 냉장고 4도어 프리스탠딩 875 L</h3>
            <div class="price"> 1,840,000원 <span> 2,300,000원 </span> </div>
            <a href="/control/productdetail?productnum=A-08" class="btn" style="width:100%;">Shop Now</a>
        </div>

        <div class="box">
            <span class="discount">-15%</span>
            <img src="resources/img/appliances/audio1.PNG" alt="">
            <h3>하만카돈 RADIANCE 2400</h3>
            <div class="price"> 5,355,000원 <span> 6,300,000원 </span> </div>
            <a href="/control/productdetail?productnum=A-22" class="btn" style="width:100%;">Shop Now</a>
        </div>

        <div class="box">
            <span class="discount">-30%</span>
            <img src="resources/img/cloth/cloth26.PNG" alt="">
            <h3>오리지널 M-1965 피쉬테일 파카_Vintage Black</h3>
            <div class="price"> 143,500원 <span> 205,000원 </span> </div>
            <a href="/control/productdetail?productnum=C-14" class="btn" style="width:100%;">Shop Now</a>
        </div>
        <div class="box">
            <span class="discount">-40%</span>
            <img src="resources/img/cloth/cloth24.PNG" alt="">
            <h3>WARM UP QUILTING JACKET BLACK</h3>
            <div class="price"> 99,000원 <span> 165,000원 </span> </div>
           <a href="/control/productdetail?productnum=C-24" class="btn" style="width:100%;">Shop Now</a>
        </div>

        <div class="box">
            <span class="discount">-50%</span>
            <img src="resources/img/food/food-6.PNG" alt="">
            <h3>모짜렐라핫도그</h3>
            <div class="price"> 49,800원 <span> 24,900원 </span> </div>
            <a href="/control/productdetail?productnum=F-06" class="btn" style="width:100%;">Shop Now</a>
        </div>

        <div class="box">
            <span class="discount">-30%</span>
            <img src="resources/img/food/food-10.PNG" alt="">
            <h3>한우 등심 500G</h3>
            <div class="price"> 51,100원 <span> 73,000원 </span> </div>
            <a href="/control/productdetail?productnum=F-10" class="btn" style="width:100%;">Shop Now</a>
        </div>

        <div class="box">
            <span class="discount">-25%</span>
            <img src="resources/img/sports/sports-16.PNG" alt="">
            <h3>모토벨로 G7 DUAL 18인치 전기자전거</h3>
            <div class="price"> 697,500원 <span> 930,000원 </span> </div>
            <a href="/control/productdetail?productnum=S-16" class="btn" style="width:100%;">Shop Now</a>
        </div>

        <div class="box">
            <span class="discount">-50%</span>
            <img src="resources/img/sports/sports-25.PNG" alt="">
            <h3>대형 물놀이 플라밍고 홍학 튜브</h3>
            <div class="price"> 20,700원 <span> 41,400원 </span> </div>
			<a href="/control/productdetail?productnum=S-25" class="btn" style="width:100%;">Shop Now</a>
        </div>

        <div class="box">
            <span class="discount">-45%</span>
            <img src="resources/img/sports/sports-9.PNG" alt="">
            <h3>휠라 레인저 1RM01141E100</h3>
            <div class="price"> 49,500원 <span> 90,000원 </span> </div>
			<a href="/control/productdetail?productnum=S-09" class="btn" style="width:100%;">Shop Now</a>
        </div>

    </div>

</section>

<!-- product section ends -->

<!-- footer section starts  -->
<%@include file="Footer.jsp"%>

<!-- footer section ends -->



















<!-- custom js file link  -->
<script src="js/script.js"></script>
    
</body>
</html>