<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<title>書籍の追加｜シアトルライブラリ｜シアトルコンサルティング株式会社</title>
<link href="<c:url value="/resources/css/reset.css" />" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+JP" rel="stylesheet">
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/js/thumbnail.js"></script>
</head>
<body class="wrapper">
    <header>
        <div class="left">
            <img class="mark" src="resources/img/logo.png" />
            <div class="logo">Seattle Library</div>
        </div>
        <div class="right">
            <ul>
                <li><a href="<%=request.getContextPath()%>/home" class="menu">Home</a></li>
                <li><a href="https://www.google.co.jp/?client=safari&channel=mac_bm" target="_blank">Google</a></li>
                <li><a href="<%=request.getContextPath()%>/addFavorite" class="menu">お気に入り</a></li>
                <li><a href="<%=request.getContextPath()%>/Inquiries" class="menu">お問い合わせ</a></li>
                <li><a id="logOut">ログアウト</a></li>
            </ul>
        </div>
        <!--ドロワーメニューのコード-->
        <div class="overlay"></div>
        <nav class="nav">
            <div class="toggle">
                <span id="deleteconpo" class="toggler"></span>
            </div>
            <div class="logo-menu">
                <a href="#">Seattle Library</a>
            </div>
            <ul>
                <li><a href="<%=request.getContextPath()%>/home" class="menu">Home</a></li>
                <li><a href="https://www.google.co.jp/?client=safari&channel=mac_bm" target="_blank">Google</a></li>
                <li><a href="<%=request.getContextPath()%>/favoriteList" class="menu">お気に入り</a></li>
                <li><a href="<%=request.getContextPath()%>/Inquiries" class="menu">お問い合わせ</a></li>
                <li><a id="logOut-menu">ログアウト</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <form action="<%=request.getContextPath()%>/home" method="get" enctype="multipart/form-data" id="data_search_form">
            <h1>書籍の詳細検索</h1>
            <div class="content_body search_book_content">
                <div>
                    <c:if test="${!empty errorList}">
                        <div class="error">
                            <c:forEach var="error" items="${errorList}">
                                <p>${error}</p>
                            </c:forEach>
                        </div>
                    </c:if>
                    <div class="box1">
                        <p>
                            書籍名:<br> <input type="text" name="title">
                        </p>
                    </div>
                    <div class="box2">
                        <p>
                            著者名:<br> <input type="text" name="author">
                        </p>
                    </div>
                    <div class="box3">
                        <p>
                            出版社:<br> <input type="text" name="publisher">
                        </p>
                    </div>
                    <div class="box4">
                        <p>
                            出版日:<br> <input type="text" name="publishDate">
                        </p>
                    </div>
                    <div class="box5">
                        <p>
                            ISBN:<br> <input type="text" name="isbn">
                        </p>
                    </div>
                </div>
                <div>
                    <input type="hidden" id="bookId" name="bookId" value="${bookInfo.bookId}">
                </div>
            </div>
            <div class="bookBtn_box">
                <button type="submit" id="search-btn" class="btn_detailedSearchBook">検索</button>
            </div>
        </form>
    </main>
    <!--モーダルウィンドウjsp -->
    <div class="modal">
        <div class="logOut-check" id="logOut-check">
            <h2>ログアウトしてよろしいですか？</h2>
            <form method="get" action="modalLogOut" />
            <button type="submit" class="btn-logOut-check">はい</button>
            </form>
            <form method="get" action="detailedSearchBooks" />
            <button type="submit" class="btn-logOut-check">いいえ</button>
            </form>
        </div>
    </div>
    <!-- ドロワーメニューのjs -->
    <script>
    const toggler = document.querySelector(".toggle");

    window.addEventListener("click", event => {
      if(event.target.className == "toggle" || event.target.className == "toggle") {
        document.body.classList.toggle("show-nav");
        document.getElementById("deleteconpo").classList.toggle("deleteclass")
      } else if (event.target.className == "overlay") {
        document.body.classList.remove("show-nav");
    document.getElementById("deleteconpo").classList.toggle("deleteclass")
      }

    });
</script>
    <!-- ログアウトのモーダルウィンドウのjs -->
    <script>
                    $(function() {
                        $('#logOut').click(function() {
                            $('.modal').fadeIn();
                        })
                    });
                </script>
    <script>
                    $(function() {
                        $('#logOut-menu').click(function() {
                            $('.modal').fadeIn();
                        })
                    });
                </script>
</body>
</html>