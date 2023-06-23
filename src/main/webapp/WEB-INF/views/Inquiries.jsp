<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=utf8"%>
<%@ page import="java.util.*"%>
<html>
<head>
<title>書籍の追加｜シアトルライブラリ｜シアトルコンサルティング株式会社</title>
<link href="<c:url value="/resources/css/reset.css" />" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+JP" rel="stylesheet">
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/js/thumbnail.js"></script>
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
                <li><a id="logOut-menu">ログアウト</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h1>お問い合わせ</h1>
        <form method="post" action="<%=request.getContextPath()%>/check" class="inquiries" th:object="${InquiriesForm}">
            <div class="content">
                <div>
                    <c:if test="${!empty errorList}">
                        <div class="error">
                            <c:forEach var="error" items="${errorList}">
                                <p>${error}</p>
                            </c:forEach>
                        </div>
                    </c:if>
                    <div>
                        <span>お名前：</span><span class="care care2">必須</span>
                        <div class="contents_name">
                            <input th:valule="<%=request.getParameter("name")%>" id="name" name="name" type="text">
                        </div>
                    </div>
                    <div>
                        <span>メールアドレス：</span><span class="care care2">必須</span>
                        <div class="contents_email">
                            <input th:valule="<%=request.getParameter("email")%>" id="email" name="email" type="email">
                        </div>
                    </div>
                    <div>
                        <span>お問い合わせ内容：</span><span class="care care2">必須</span>
                        <div class="contents_detail">
                            <textarea th:field="<%=request.getParameter("contents")%>" id="contents" name="contents" rows="10" cols="40"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="inquiriesBtn_box">
                <button type="submit" id="check-btn" class="btn_check">確認</button>
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
            <form method="get" action="Inquiries" />
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