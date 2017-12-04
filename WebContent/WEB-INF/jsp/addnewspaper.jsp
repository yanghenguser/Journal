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
    <dd><a href="addnewspaper" class="active">添加报刊</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>用户管理</dt>
    <dd><a href="userlist">用户列表</a></dd>
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
       <h2 class="fl">添加报刊信息</h2>
       <a href="../Journal/admin" class="fr top_rt_btn">返回报刊列表</a>
      </div>
     <section>
      <ul class="ulColumn2">
       <li>
        <span class="item_name" style="width:120px;">报刊名称：</span>
        <input type="text" class="textbox textbox_295" name="newsname" id="newsname" placeholder="报刊名称..."/>
       </li>
       <li>
        <span class="item_name" style="width:120px;">报刊编号：</span>
        <input type="text" name="newsnum" id="newsnum" class="textbox" placeholder="报刊编号..."/>
       </li>
       <li>
        <span class="item_name" style="width:120px;">报刊类型：</span>
        <select name="newsclass" id="newsclass" class="select">
         <c:forEach items="${list}" var="data">
         <option val=${data.classnum}>${data.classname}</option>
         </c:forEach>
        </select>
       </li>
       <li>
         
        <span class="item_name" style="width:120px;">出版社：</span>
        <input type="text" name="press" id="press" class="textbox" placeholder="出版社名称..."/>
       </li>
       <li>
        <span class="item_name" style="width:120px;">出版周期：</span>
        <input type="text" name="publish" id="publish" class="textbox" placeholder="出版周期"/>
       </li>
        <li>
        <span class="item_name" style="width:120px;">季度报价：</span>
        <input type="text" name="quarterly" id="quarterly" class="textbox" placeholder="季度报价"/>
       </li>
       <li>
        <span class="item_name" style="width:120px;">封面图片名称：</span>
       <input type="text" name="piclocation" id="piclocation" class="textbox" placeholder="图片名称"/><span class="errorTips">请上传图片到服务器的newspic文件夹下</span>
       </li>
       <li>
       <span class="item_name" style="width:120px; position:relative;top:-50px;">报刊介绍：</span>
       <textarea style="width:500px;height:100px" id="content" name="content"></textarea>
       </li>
        <li>
       		<button id="addnews" class="add">添加报刊</button>
	   </li>
       </ul>
       </form>
       </section>
       </div>
       </section>
     
	<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/newsmanager.js"></script>
</body>
</html>