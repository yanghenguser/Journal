<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>NP报刊订阅</title>
		<link rel="shortcut icon" href="http://cdn-img.easyicon.net/png/11881/1188114.gif" />
		<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css"/>
		<link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
		<link rel="stylesheet" href="css/shop.css" type="text/css" />
</head>
<body>
<div id="herd">
			<div id="herd1">
			<span >欢迎来到NP报刊订阅网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			    <a id="logining" class="dh"href="../Journal/logining">登录</a>
			    <a id="username" class="dh"href="###"></a>
			    
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    
			    <a id="register" class="dh"href="../Journal/registering">注册</a>
			     <a id="logout" class="dh"href="javascript::void(0)">退出</a>
			    
			    
			</div>
						<ul id="nav">
			<li class="ldh1"><a class="adh1" href="#"><img src="img/wo.png" alt="" />&nbsp;&nbsp;我的报刊</a></li>
            <li class="ldh1"><a id="jnzshop" class="adh1" href="###"><img src="img/gou.png" alt="" />&nbsp;&nbsp;购物车</a></li>
			</ul>
		</div>
<p id="tou">NP报刊订阅———我的报刊</p>

		<div class="catbox">

			<table id="cartTable">
				<thead>
					<tr>
						<th>订单编号</th>
						<th>報刊</th>
						<th>单价</th>
						<th>数量</th>
						<th>订阅时间</th>
						<th>小计</th>
						<th>状态</th>
						
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${shopdatas}" var="data">
			    	<tr>
						<td class="checkbox">${data.orderid}</td>
						<td class="goods"><img src=${data.piclocationl} /><span>${data.newsname}</span></td>
						<td class="price">${data.quarterly }</td>
						<td class="count"> ${data.ordernum} </td>
						<td class="stime">${data.ordermouth } 季度</td>
						<td class="subtotal">${data.price }</td>
						<td class="state">${data.state }</td>
					</tr>
			    </c:forEach>
			    	
					
				</tbody>
			</table>
		</div>
		<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
		<script type="text/javascript" src="js/shop.js"></script>
</body>
</html>