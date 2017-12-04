<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>

	(function($){
		$(window).load(function(){
			
			$("a[rel='load-content']").click(function(e){
				e.preventDefault();
				var url=$(this).attr("href");
				$.get(url,function(data){
					$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
					//scroll-to appended content 
					$(".content").mCustomScrollbar("scrollTo","h2:last");
				});
			});
			
			$(".content").delegate("a[href='top']","click",function(e){
				e.preventDefault();
				$(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
			});
			
		});
	})(jQuery);
</script>
</head>
<body>
<!--header-->
<header>
 <h1><img src="img/admin_logo.png"/></h1>
 <ul class="rt_nav">
  <li><a href="../Journal/main" target="_blank" class="website_icon">站点首页</a></li>
  <li><a href="login.html" class="quit_icon">安全退出</a></li>
 </ul>
</header>
<!--aside nav-->
<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
 <ul>
  <li>
   <dl>
    <dt>报刊管理</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="admin" >报刊种类</a></dd>
    <dd><a href="addnewspaper">添加报刊</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>用户管理</dt>
    <dd><a href="../Journal/userlist" class="active">用户列表</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>订单信息</dt>
    <dd><a href="orderlist">订单详情</a></dd>
   </dl>
  </li>
  
 </ul>
</aside>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">用户列表</h2>
      </div>
      <table class="table">
       <tr>
        <th>账号</th>
        <th>姓名</th>
        <th>身份证号码</th>
        <th>手机号码</th>
        <th>发货地址</th>
       </tr>
       
      <c:forEach items="${list}" var="data">
       <tr>
        <td class="newsnum">${data.name }</td>
        <td class="center newsname">${data.realname }</td>
        <td class="center newsclass">${data.idcard }</td>
        <td class="center press">${data.phone }</td>
        <td class="center press">${data.address }</td>
       </tr>
       </c:forEach>
      </table>
 </div>
</section>

     
	<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/newsmanager.js"></script>
</body>
</html>