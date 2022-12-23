<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vege-Table</title>
    <link href="<c:url value='../resources/css/landingpage.css' />" rel="stylesheet">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  	
     <c:if test="${joinProc != null }">
         <script type="text/javascript">
         if ("${joinProc}" == false ) {
              alert("회원가입에 실패했습니다. 다시 시도해 주세요.");
           }
         </script>
    </c:if>
    </head>

<body style="margin:0px;">
    <!-- main 시작 -->

    <div class="landingPage">

        <div class="between"></div>
        <!--main-page 시작-->
        <div class="main-page">

            <!-- carousel 시작 -->
            <div id="carouselExampleInterval" class="carousel slide col-lg-6" data-bs-ride="carousel">

                <div class="carousel-inner" style="height:200px">
                    <div class="carousel-item active" data-bs-interval="10000" style="height:200px">
                        <img src="<c:url value='../resources/img/banner/banner_upper1.png' />" class="d-block w-100 carousel" alt="...">
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <img src="<c:url value='../resources/img/banner/banner_upper2.png' />" class="d-block w-100 carousel" alt="...">
                    </div>
                </div>

                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span> 
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!-- carousel 끝 -->

            <div class="between"></div>

            <!-- card 시작 -->
            <nav class="nav col-lg-6">
                <div class="wrap">

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg1.jpg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">꽁티드툴레아</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg2.jpg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">이노베이티브</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg3.jpeg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">라뽀즈</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg4.jpg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">드렁큰비건</p>
                        </div>
                    </div>

                </div>
            </nav>
            <!-- card 끝 -->

            <div class="between"></div>

            <!-- card 시작 -->
            <nav class="nav col-lg-6">
                <div class="wrap">

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg5.jpg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">비건식당 공간녹음</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg6.jpeg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">비건 앤 비욘드</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg7.jpg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">어라운드 그린</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg8.jpg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">슬런치</p>
                        </div>
                    </div>

                </div>
            </nav>
            <!-- card 끝 -->

            <div class="between"></div>

            <!-- carousel 시작 -->
            <div id="carouselExampleCaptions" class="carousel slide col-lg-6" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                </div>
                <div class="carousel-inner" style="height:200px">
                    <div class="carousel-item active">
                        <img src="<c:url value='../resources/img/banner/banner_under1.png' />" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="<c:url value='../resources/img/banner/banner_under2.png' />" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!-- carousel 끝 -->

            <div class="between"></div>

            <!-- card 시작 -->
            <nav class="nav col-lg-6">
                <div class="wrap">

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg9.jpg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">그리가닉 샐러드</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg10.jpeg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">푸드더즈매터</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg11.jpeg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">Alfreebe</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg12.jpeg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">셰발레리</p>
                        </div>
                    </div>

                </div>
            </nav>
            <!-- card 끝 -->

            <div class="between"></div>

            <!-- card 시작 -->
            <nav class="nav col-lg-6">
                <div class="wrap">

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg13.jpeg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">Chez Valerie</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg14.jpeg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">베제투스</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg15.jpeg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">몽크스부처</p>
                        </div>
                    </div>

                    <div class="card wrap-item">
                        <img src="<c:url value='../resources/img/resto_main_setting/restoimg16.jpg' />" class="card-img-top cardMain" alt="...">
                        <div class="card-body">
                            <p class="card-text">플랜튜</p>
                        </div>
                    </div>

                </div>
            </nav>
            <!-- card 끝 -->
            <div class="between"></div>

        </div> <!-- content div -->

    </div>
    <!-- main-page 끝-->
    <!-- main 끝 -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

</body>

</html>