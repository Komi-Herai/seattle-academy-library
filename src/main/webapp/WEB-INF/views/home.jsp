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
</head>
<body class="wrapper">
    <div id="splash" class="splash">
        <div id="splash-logo">Loding…</div>
        <!--/splash-->
    </div>
    <div class="splashbg1"></div>
    <div class="splashbg2"></div>
    <div id="container">
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
            <h1>Home</h1>
            <a href="<%=request.getContextPath()%>/addBook" class="btn_add_book">書籍の追加</a>
            <div class="content_body">
                <c:if test="${!empty resultMessage}">
                    <div class="error_msg">${resultMessage}</div>
                </c:if>
                <c:if test="${!empty errorMessage}">
                    <div class="error_msg">${errorMessage}</div>
                </c:if>
                <form method="get" action="<%=request.getContextPath()%>/searchBooks" class="btn_search_book">
                    <input type="text" name="search" placeholder="書籍名を入力してください">
                    <button type="submit">検索</button>
                </form>
                <div>
                    <a href="<%=request.getContextPath()%>/detailedSearchBooks" class="btn_detailedSearch_book">詳細検索</a>
                </div>
                <div>
                    <button class="checkbook" onclick="clickBtn1()">一括削除</button>
                </div>
                <div class="genre">
                    <span>ジャンル別表示</span>
                    <form method="post" action="genre">
                        <select required class="select" name="genre">
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
                        <button type="submit">表示</button>
                    </form>
                </div>
                <div class="booklist">
                    <c:forEach var="bookInfo" items="${booklist}">
                        <div>
                            <form method="post" id="form1" name="form1" action="checkDelete" class="allDelete">
                                <input type="checkbox" name="checkbox" id="mycheckbox" value="${bookInfo.bookId}">
                            </form>
                        </div>
                        <div class="books">
                            <form method="get" class="book_thumnail" action="editBook" id="book_thumnail">
                                <a href="javascript:void(0)" onclick="this.parentNode.submit();"> <c:if test="${empty bookInfo.thumbnail}">
                                        <img class="book_noimg" src="resources/img/noImg.png">
                                    </c:if> <c:if test="${!empty bookInfo.thumbnail}">
                                        <img class="book_noimg" src="${bookInfo.thumbnail}">
                                    </c:if>
                                </a> <input type="hidden" name="bookId" value="${bookInfo.bookId}">
                            </form>
                            <c:if test="${bookInfo.favorite!=1}">
                                <form method="GET" action="favoriteBook" name="favorite">
                                    <p align="justify">
                                        <button class="btn btn-primary addtofavorite">⭐︎</button>
                                        <input type="hidden" name="bookId" value="${bookInfo.bookId}">
                                    </p>
                                </form>
                            </c:if>
                            <c:if test="${bookInfo.favorite==1}">
                                <form method="GET" action="unfavoriteBook" name="unfavorite">
                                    <p align="justify">
                                        <span class="favoritedmark fade">︎</span>
                                        <button class="btn btn-primary removefavorite hidden">⭐️</button>
                                        <input type="hidden" name="bookId" value="${bookInfo.bookId}">
                                    </p>
                                </form>
                            </c:if>
                            <ul>
                                <li class="book_title">『${bookInfo.title}』</li>
                                <li class="book_author">(著)${bookInfo.author}</li>
                                <li class="book_publisher">出版社:${bookInfo.publisher}</li>
                                <li class="book_publish_date">出版日:${bookInfo.publishDate}</li>
                                <li class="book_genre">ジャンル:${bookInfo.genre}</li>
                            </ul>
                        </div>
                    </c:forEach>
                </div>
            </div>
    </div>
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
    <!-- アニメーションのjs -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script>
					$(window).on('load', function() {
						$("#splash-logo").delay(1200).fadeOut('slow');//ロゴを1.2秒でフェードアウトする記述

						//=====ここからローディングエリア（splashエリア）を1.5秒でフェードアウトした後に動かしたいJSをまとめる
						$("#splash").delay(1500).fadeOut('slow', function() {//ローディングエリア（splashエリア）を1.5秒でフェードアウトする記述

							$('body').addClass('appear');//フェードアウト後bodyにappearクラス付与

						});
						//=====ここまでローディングエリア（splashエリア）を1.5秒でフェードアウトした後に動かしたいJSをまとめる

						//=====ここから背景が伸びた後に動かしたいJSをまとめたい場合は
						$('.splashbg1').on('animationend', function() {
							//この中に動かしたいJSを記載
						});
						//=====ここまで背景が伸びた後に動かしたいJSをまとめる
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
 function clickBtn1() {
   const arr = [];
   const checkbox = document.form1.checkbox;

   for (let i = 0; i < checkbox.length; i++) {
     if (checkbox[i].checked) {//(chk1[i].checked === true)と同じ
       arr.push(checkbox[i].value);
     }
   }
   let xhr = new XMLHttpRequest();
   xhr.open('POST','http://localhost:8080/SeattleLibrary/checkDelete', true)
   xhr.responseType = 'json'
 }
 </script>
</body>
</html>
