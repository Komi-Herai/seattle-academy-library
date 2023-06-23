<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=utf8"%>
<%@ page import="java.util.*"%>
<html>
<head>
<title>ホーム｜シアトルライブラリ｜シアトルコンサルティング株式会社</title>
<link href="<c:url value="/resources/css/reset.css" />" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+JP" rel="stylesheet">
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
                <li><a href="<%=request.getContextPath()%>/favoriteList" class="menu">お気に入り</a></li>
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
                <li><a id="logOut">ログアウト</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h1>送信完了</h1>
        <h2>お問合せありがとうございました。</h2>
        <p>3営業日以内に返信がない場合は、お手数ですが再度お問合せをお願いいたします。</p>
    </main>
    <!--モーダルウィンドウjsp -->
    <div class="modal">
        <div class="logOut-check" id="logOut-check">
            <h2>ログアウトしてよろしいですか？</h2>
            <form method="get" action="modalLogOut" />
            <button type="submit" class="btn-logOut-check">はい</button>
            </form>
            <form method="get" action="home" />
            <button type="submit" class="btn-logOut-check">いいえ</button>
            </form>
        </div>
    </div>
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
</body>
</html>
