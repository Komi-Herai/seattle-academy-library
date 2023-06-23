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
        <form action="<%=request.getContextPath()%>/updateBook" method="post" enctype="multipart/form-data" id="data_upload_form">
            <h1>書籍の編集</h1>
            <div class="content_body add_book_content">
                <div>
                    <span>書籍の画像</span> <span class="care care1">任意</span>
                    <div class="book_thumnail">
                        <c:if test="${empty bookInfo.thumbnailUrl}">
                            <img class="book_noimg" src="resources/img/noImg.png">
                        </c:if>
                        <c:if test="${!empty bookInfo.thumbnailUrl}">
                            <img class="book_noimg" src="${bookInfo.thumbnailUrl}">
                        </c:if>
                    </div>
                    <input type="file" accept="image/*" name=thumbnail id="thumbnail">
                </div>
                <div class="content_right">
                    <div>
                        <c:if test="${!empty errorList}">
                            <div class="error">
                                <c:forEach var="error" items="${errorList}">
                                    <p>${error}</p>
                                </c:forEach>
                            </div>
                        </c:if>
                        <span>書籍名</span><span class="care care2">必須</span> <input type="text" name="title" value="${bookInfo.title}">
                    </div>
                    <div>
                        <span>著者名</span><span class="care care2">必須</span> <input type="text" name="author" value="${bookInfo.author}">
                    </div>
                    <div>
                        <span>出版社</span><span class="care care2">必須</span> <input type="text" name="publisher" value="${bookInfo.publisher}">
                    </div>
                    <div>
                        <span>出版日</span><span class="care care2">必須</span> <input type="text" name="publishDate" value="${bookInfo.publishDate}">
                    </div>
                    <div>
                        <span>ISBN</span><span class="care care1">任意</span>
                        <c:if test="${!empty bookInfo}">
                            <input type="text" name="isbn" value="${bookInfo.isbn}">
                        </c:if>
                        <c:if test="${empty bookInfo}">
                            <input type="text" name="isbn">
                        </c:if>
                    </div>
                    <div>
                        <span>説明文</span><span class="care care1">任意</span>
                        <c:if test="${!empty bookInfo}">
                            <input type="text" name="description" value="${bookInfo.description}">
                        </c:if>
                        <c:if test="${empty bookInfo}">
                            <input type="text" name="description">
                        </c:if>
                    </div>
                    <div>
                        <span>ジャンル</span><span class="care care2">必須</span> <select id="genre" required name="genre" value="${genre}">
                            <option value="" selected disabled>選択してください</option>
                            <option value="小説">小説</option>
                            <option value="エッセイ・詩">エッセイ・詩</option>
                            <option value="コミック">コミック</option>
                            <option value="料理">料理</option>
                            <option value="スポーツ">スポーツ</option>
                            <option value="旅行">旅行</option>
                            <option value="育児">育児</option>
                            <option value="絵本・児童書">絵本・児童書</option>
                            <option value="ビジネス">ビジネス</option>
                            <option value="学習参考書">学習参考書</option>
                            <option value="専門書">専門書</option>
                            <option value="その他">その他</option>
                        </select>
                    </div>
                    <input type="hidden" id="bookId" name="bookId" value="${bookInfo.bookId}">
                </div>
            </div>
            <div class="bookBtn_box">
                <button type="submit" id="add-btn" class="btn_updateBook">更新</button>
        </form>
        <form method="post" action="deleteBook" name="delete">
            <button type="submit" id="delete-btn" class="btn_deleteBook" name="bookId" value="${bookInfo.bookId}">削除</button>
        </form>
        </div>
    </main>
    <!--モーダルウィンドウjsp -->
    <div class="modal">
        <div class="logOut-check" id="logOut-check">
            <h2>ログアウトしてよろしいですか？</h2>
            <form method="get" action="modalLogOut" />
            <button type="submit" class="btn-logOut-check">はい</button>
            </form>
            <form method="get" action="editBook" />
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
    <script>
    	 let genreSelect = document.getElementById('genre'); 
         genreSelect.options[1].selected = true; 
         let book_thumnail = document.getElementById('book_thumnail'); 
         book_thumnail.addEventListener('click', book_thumnail);
    });
  </script>
</body>
</html>