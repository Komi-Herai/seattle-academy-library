<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta name="description" content="社内の書籍検索や貸出を行うことができます。" />
<meta name="robots" content="noindex,nofollow" />
<meta http-equiv="content-type" content="text/html" charset="utf-8" />
<title>ログイン｜シアトルライブラリ｜シアトルコンサルティング株式会社</title>
<link href="<c:url value="/resources/css/reset.css" />" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+JP" rel="stylesheet">
<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="wrapper">
        <div class="authorization_head">
            <img class="mark" src="resources/img/logo.png" />
            <div class="logo">Seattle Library</div>
        </div>
        <p class = "hours" id="greeting">時間</p>
        <script>
									const hours = new Date().getHours();

									if (hours >= 4 && hours < 11) {
										document.getElementById('greeting').textContent = "おはようございます！今日も1日頑張りましょう！";

									} else if (hours >= 11 && hours < 18) {
										document.getElementById('greeting').textContent = "こんにちは！来てくれてありがとうございます！";
									} else {
										document.getElementById('greeting').textContent = "こんばんは！今日も1日お疲れ様です！";
									}
								</script>
        <div class="authorization">
            <div class="authorization_form">
                <form method="post" action="login">
                    <div class="title">ログイン</div>
                    <label class="label">メールアドレス</label> <input type="text" class="input" name="email" id="email" autocomplete="off" required /> <label class="label">パスワード</label> <input type="password" class="input" id="password" name="password" required />
                    <c:if test="${!empty errorMessage}">
                        <div class="error">${errorMessage}</div>
                    </c:if>
                    <input type="submit" class="button primary" value="ログイン" />
                </form>
            </div>
            <div class="authorization_navi">
                <label class="authorization_text">まだアカウントをお持ちでないですか？</label> <a class="authorization_link marker" href="<%=request.getContextPath()%>/newAccount">アカウント作成</a>
            </div>
        </div>
        <div id="particles-js">
            <div id="wrapper"></div>
        </div>
        <script src="http://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
        <script>
									particlesJS(
											"particles-js",
											{
												"particles" : {
													"number" : {
														"value" : 50,//この数値を変更するとホタルの数が増減できる
														"density" : {
															"enable" : true,
															"value_area" : 1602.3971861905397
														}
													},
													"color" : {
														"value" : "#f3fa8b"//色
													},
													"shape" : {
														"type" : "circle",//形状はcircleを指定
														"stroke" : {
															"width" : 0,
														}
													},
													"opacity" : {
														"value" : 1,
														"random" : true,//透過をランダムに
														"anim" : {
															"enable" : false,
															"speed" : 1.10115236356258881,
															"opacity_min" : 0,
															"sync" : false
														}
													},
													"size" : {
														"value" : 4.005992965476349,
														"random" : true,//サイズをランダムに
														"anim" : {
															"enable" : true,
															"speed" : 24.345709068776642,
															"size_min" : 0.1,
															"sync" : false
														}
													},
													"line_linked" : {
														"enable" : false,
													},
													"move" : {
														"enable" : true,
														"speed" : 6,//この数値を小さくするとゆっくりな動きになる
														"direction" : "none",//方向指定なし
														"random" : true,//動きはランダムに
														"straight" : false,//動きをとどめない
														"out_mode" : "out",//画面の外に出るように描写
														"bounce" : false,//跳ね返りなし
														"attract" : {
															"enable" : false,
															"rotateX" : 600,
															"rotateY" : 600
														}
													}
												},
												"interactivity" : {
													"detect_on" : "canvas",
													"events" : {
														"onhover" : {
															"enable" : false
														},
														"onclick" : {
															"enable" : false
														},
														"resize" : true
													}
												},
												"retina_detect" : true
											});
								</script>
        <footer>
            <div class="copyright">© 2019 Seattle Consulting Co., Ltd. All rights reserved.</div>
        </footer>
    </div>
</body>
</html>
