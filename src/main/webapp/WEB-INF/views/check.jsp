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
                <li><a id="logOut-menu">ログアウト</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h1>お問い合わせ内容確認</h1>
        <div class="contentsCheck">
            <p>入力内容をご確認ください。</p>
        </div>
        <div class="content_check">
            <p>
                お名前：<%=request.getParameter("name")%></p>
            <p>
                メールアドレス：<%=request.getParameter("email")%></p>
            <p>
                お問合せ内容：<%=request.getParameter("contents")%></p>
        </div>
        <form method="post" action="Inquiries" th:object="${InquiriesForm}">
            <input type="hidden" name="name" value="<%=request.getParameter("name")%>"> <input type="hidden" name="email" value="<%=request.getParameter("email")%>"> <input type="hidden" name="contents" value="<%=request.getParameter("contents")%>">
            <div class="bookBtn_box">
                <button type="submit" class="btn_back">戻る</button>
            </div>
        </form>
        <div class="bookBtn_box">
            <button class="btn_sending modalOpen" onclick="openModal()">送信</button>
        </div>
        </form>
    </main>
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h2>送信確認</h2>
            <p>本当に送信しますか？</p>
            <form method="post" action="sending" />
            <input type="hidden" name="name" th:value="*{name}" /><input type="hidden" name="email" th:value="*{email}" /> <input type="hidden" name="contents" th:value="*{contents}" />
            <button type="submit" class="check_sending">送信</button>
            </form>
        </div>
    </div>
    <script>
    function openModal() {
      var modal = document.getElementById("modal");
      modal.style.display = "block";
    }
    
    function closeModal() {
      var modal = document.getElementById("modal");
      modal.style.display = "none";
    }
  </script>
    <script const doObserve=(element)=> {
  const targets = document.querySelectorAll('.typeWriter'); /* ターゲットの指定 */
  const options = {
    root: null,
    rootMargin: '0px',
    threshold: 0
  };
  const observer = new IntersectionObserver((items) => {
    items.forEach((item) => {
      if (item.isIntersecting) {

const typeWriter = selector => {
  const el = document.querySelector(selector);
  const text = el.innerHTML;

  (function _type(i = 0) {
    if (i === text.length) return;
    el.innerHTML = text.substring(0, i + 1) + '<span aria-hidden="true"></span>';
    setTimeout(() => _type(i + 1), 150);
  })();
};

typeWriter(".typeWriter");
      } else {
        item.target.classList.remove('typing'); /* 表示域から外れた時にターゲットから削除するclassの指定 */
      }
    });
  }, options);
  Array.from(targets).forEach((target) => {
    observer.observe(target);
  });
</script>
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
</html>