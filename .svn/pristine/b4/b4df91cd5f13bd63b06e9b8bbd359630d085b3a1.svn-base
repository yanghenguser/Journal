$(function(){
	
	var news_id=null;
	var classname=new Array('政治时事', '生活休闲', '商务财经', '通信科技', '艺术传媒', '人文科学', '文学教育', '医疗保健', '综合类')
	$('#search').button({
	      text: true,
	      icons: {
	        primary: "ui-icon-search"
	      }
	    });
	$('#error').dialog({
		autoOpen:false,
		modal:true,
		closeOnEscape:false,
		resizable:false,
		draggable:false, 
		width:220,
		height:50,
	}).parent().find('.ui-widget-header').hide();
	
	$('#choosedlg').dialog({
		autoOpen:false,
		modal:false,
		closeOnEscape:true,
		resizable:true,
		draggable:true, 
		width:350,
		height:300,
	});
	 $( "input[type=submit], button" )
     .button()
     .click(function( event ) {
       event.preventDefault();
     });
	 var num = $( "#num" ).spinner();
	 var time = $( "#time" ).spinner();
	if($.cookie("user")){
		$('#logining').hide();
		$('#register').hide();
		$('#username').html($.cookie('user')).show();
		$('#logout').html("退出").show();
	}
	$('#logout').click(function(){
		$.removeCookie('user');
		window.location.href="main";
	});
	
	$.ajax({
		url:"../Journal/getnews",
		type:"POST",
		dataType:"json",
		
		success: function(data){
			  for(var i=0;i<data.length;i+=2){
				  $('#rightmain').append('<div class="geceng"><a name='+i/2+'f></a><strong>'+classname[i/2]+
							'</strong><span class="more">更多>></span>'+
			    		'</div><figure><img src=../Journal'+data[i].piclocation+
			    		'><div class="left"><figcaption><strong class="title">&lt'+data[i].newsname+
			    		'&gt</strong>'+
			    		data[i].content.substring(0,75)	+'...'+
			    		'</figcaption>'+
			    		'<span class="price">¥ <strong>'+data[i].quarterly+
			    		'</strong>/季度</span>'+
						
						'<div class="btn buy">'
						+'加入购物车<span style="display:none">'+data[i].newsid+'</span>'+
						'</div></div></figure>'+
						
						'</div><figure><img src=../Journal'+data[i+1].piclocation+
			    		'><div class="left"><figcaption><strong class="title">&lt'+data[i+1].newsname+
			    		'&gt</strong>'+
			    		data[i+1].content.substring(0,75)	+'...'+
			    		'</figcaption>'+
			    		'<span class="price">¥ <strong>'+data[i+1].quarterly+
			    		'</strong>/季度</span>'+
						
						'<div class="btn buy">'
						+'加入购物车<span style="display:none">'+data[i+1].newsid+'</span>'+
						'</div></div></figure>'
						);
			  }	
			  $('#rightmain').append('<div class="geceng"></div>');
		}
	});
	
	
	$("#rightmain").on('click','.buy',function(){
		
		if($.cookie("user")){
			news_id=$(this).find("span").html();
			$('#choosedlg').dialog("open");
		}else{
			$('#error').css('background','url(img/error.png) no-repeat 20px center').html("请登录后重试...");
			$('#error').dialog("open");
			setTimeout(function(){
				news_id=null;
				$('#error').dialog("close");
			},2000);
		}
		
	});
	$("#shop").click(function(){
		$.ajax({
			url:"../Journal/buygoods",
			data:{
				newsid:news_id,
				username:$.cookie('user'),
				number:num.spinner("value"),
				stime:time.spinner("value")
			},
			success: function(data){
				$('#choosedlg').dialog("close");
				if(data=="success"){
					$('#error').css('background','url(img/success.gif) no-repeat 20px center').html("成功添加到购物车");
					$('#error').dialog("open");
					setTimeout(function(){
						num.spinner("value",null);
						time.spinner("value",null);
						news_id=null;
						$('#error').dialog("close");
					},2000);
				}else{
					$('#choosedlg').dialog("close");
					$('#error').css('background','url(img/error.png) no-repeat 20px center').html("未知的错误发生了");
					$('#error').dialog("open");
					setTimeout(function(){
						num.spinner("value",null);
						time.spinner("value",null);
						news_id=null;
						$('#error').dialog("close");
					},1000);
				}
			}
		});
	});
	$("#reset").click(function(){
		$('#choosedlg').dialog("close");
		num.spinner("value",null);
		time.spinner("value",null);
		news_id=null;
	});
	
	$('#jnzshop').click(function(){
		if($.cookie("user")){
			window.location.href="../Journal/shoppage?username="+$.cookie("user");
		}else{
			$('#error').css('background','url(img/error.png) no-repeat 20px center').html("请登录后重试...");
			$('#error').dialog("open");
			setTimeout(function(){
				$('#error').dialog("close");
			},2000);
		}
		
	});
	$('#jnzmynp').click(function(){
		
		if($.cookie("user")){
			window.location.href="../Journal/mynppage?username="+$.cookie("user");
		}else{
			$('#error').css('background','url(img/error.png) no-repeat 20px center').html("请登录后重试...");
			$('#error').dialog("open");
			setTimeout(function(){
				$('#error').dialog("close");
			},2000);
		}
		
	});
	
	$("#search").click(function(){
		$.ajax({
			url:"../Journal/search",
			data:{
				newsname:$("#searchname").val(),
			},
			success:function(data){
				 $('#rightmain').empty();
				 for(var i=0;i<data.length;i++){
					 if(i%2==0){
						 $('#rightmain').append('<div class="geceng"><strong>搜索栏</strong><span class="more"></span>'+
						    		'</div>');
					  }
					  $('#rightmain').append('<figure><img src=../Journal'+data[i].piclocation+
					    		'><div class="left"><figcaption><strong class="title">&lt'+data[i].newsname+
					    		'&gt</strong>'+
					    		data[i].content.substring(0,75)	+'...'+
					    		'</figcaption>'+
					    		'<span class="price">¥ <strong>'+data[i].quarterly+
					    		'</strong>/季度</span>'+
								
								'<div class="btn buy">'
								+'加入购物车<span style="display:none">'+data[i].newsid+'</span>'+
								'</div></div></figure>'
							);
					  
				  }	
			}
		})
	});
});