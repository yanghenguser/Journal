<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>NP报刊订阅</title>
		<link rel="shortcut icon" href="http://cdn-img.easyicon.net/png/11881/1188114.gif" />
		<link rel="stylesheet" type="text/css" href="css/jquery-ui.theme.css"/>
		<link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
		<link rel="stylesheet" href="css/index.css" type="text/css" />
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
            <li class="ldh1"><a id="jnzshop" class="adh1" href="javascript:void(0)"><img src="img/gou.png" alt="" />&nbsp;&nbsp;购物车</a></li>
			</ul>
		</div>
	    <div id="main">
	    	<div id="logo">
	    	
	    		<div id="re">
	    			<span>热  线  电  话：</span><br>
	    			<span>15937623547</span>
	    		</div>
	    		<div class="bar1">
                    <form id="searchform">
                      <input type="text" name="searchname" id="searchname" placeholder="请输入您要搜索的内容...">
                      <button id="search">搜 索</button>
                     </form>
                     <p id="rmss">热门搜索：
                     <a class="adh1" href="">演讲与口才</a>
                     <a class="adh1" href="">国家地理</a>
                     <a class="adh1" href="">看天下</a>
                     <a class="adh1" href="">商界</a></p>                    
                </div>
                <div id="dao">
                <ul class="nav-vertival">
                	<li><a href="#0f">政治时事</a></li>
                	<li><a href="#1f">生活休闲</a></li>
                	<li><a href="#2f">商务财经</a></li>
                	<li><a href="#3f">通信科技</a></li>
                	<li><a href="#4f">艺术传媒</a></li>
                	<li><a href="#5f">人文科学</a></li>
                	<li><a href="#6f">文学教育</a></li>
                	<li><a href="#7f">医疗保健</a></li>
                	<li><a href="#8f">综合类</a></li>
                </ul>    	
                </div>
	    	</div>
	    	
	    	<div id="rightmain">
	    		
	    	</div>
	    </div>
	    <div title="请选择" id="choosedlg">
	    	<p>请选择你所购买的数量和月份</p>
	    	<p>
			  <label for="num">数量：</label>
			  <input id="num" name="value">份
			</p>
			<p>
			  <label for="time">时间：</label>
			  <input id="time" name="value">个月
			</p>
			<button id="shop">确定添加</button>
			<button id="reset">取消</button>
	    </div>
	    <div id="error">
			添加出错了...
		</div>
	    <script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
	</body>
</html>
