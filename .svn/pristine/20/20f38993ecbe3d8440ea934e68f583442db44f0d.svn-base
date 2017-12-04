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
			<li class="ldh1"><a id="jnzmynp" class="adh1" href="#"><img src="img/wo.png" alt="" />&nbsp;&nbsp;我的报刊</a></li>
            <li class="ldh1"><a class="adh1" href="../Journal/main">&nbsp;&nbsp;返回首页</a></li>
			</ul>
		</div>
<p id="tou">NP報刊訂閱———購物車</p>

		<div class="catbox">

			<table id="cartTable">
				<thead>
					<tr>
						<th><label><input class="check-all check" type="checkbox"/>&nbsp;全选</label></th>
						<th>報刊</th>
						<th>单价</th>
						<th>数量</th>
						<th>订阅时间</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${shopdatas}" var="data">
			    	<tr>
						<td class="checkbox"><input class="check-one check" type="checkbox" /></td>
						<td class="goods"><img src=${data.piclocationl} alt="" /><span>${data.newsname}</span></td>
						<td class="price">${data.quarterly }</td>
						<td class="count"> <input class="count-input" type="text" value=${data.ordernum} /> </td>
						<td class="stime">${data.ordermouth } 季度</td>
						<td class="subtotal">${data.price }</td>
						<td class="operation"><span class="delete">删除</span></td>
					</tr>
			    </c:forEach>
			    	
					
				</tbody>
			</table>

			<div class="foot" id="foot">
				<label class="fl select-all"><input type="checkbox" class="check-all check"/>&nbsp;全选</label>
				<a class="fl delete" id="deleteAll" href="javascript:;">清空购物车</a>
				<div id="pay" class="fr closing">结 算</div>
				<div class="fr total">合计：￥<span id="priceTotal">0.00</span></div>
				<div class="fr selected" id="selected">已选商品<span id="selectedTotal">0</span>件<span class="arrow up">︽</span><span class="arrow down">︾</span></div>
				<div class="selected-view">
					<div id="selectedViewList" class="clearfix">
						<div><img src="newspic/1.jpg"><span>取消选择</span></div>
					</div>
					<span class="arrow">◆<span>◆</span></span>
				</div>
			</div>

		</div>
		
		 <div title="提示" id="paydialog">
	    	<p>你确定要购买这些报刊吗？</p>
			<button id="buy">确定</button>
			<button id="reset">取消</button>
	    </div>
	    <div id="error">
			添加出错了...
		</div>
		 <script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
		<script type="text/javascript" src="js/shop.js"></script>
</body>
</html>