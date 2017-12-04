$(function(){
	$('#error').dialog({
		autoOpen:false,
		modal:true,
		closeOnEscape:false,
		resizable:false,
		draggable:false, 
		width:220,
		height:50,
	}).parent().find('.ui-widget-header').hide();
	
	$('#login').click(function(){
		if($('#user').val()!="" && $('#psw').val()!=""){
			$('#login').addClass("load");
			$('#login').html('登录中...');
			$.ajax({
				url:"login"  ,
				type:"GET",
				data:$('#userinfo').serialize(),
				scriptCharset: 'utf-8',
				success: function(data){
					if(data=="error"){
						$('#error').html("账号或密码错误");
						$('#error').dialog("open");
						setTimeout(function(){
							$('#error').dialog("close");
							$('#login').html("登 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录");
							$('#login').removeClass("load");
							$('#user').html("");
							$('#psw').html("");
						},1000);
					}else{
						
						$.cookie('user',data);
						$('#login').removeClass("load");
						$('#login').css('background','url(img/success.gif) no-repeat 90px center').html('登录成功...');
						setTimeout(function(){
							window.location.href="../Journal/main";
						},1000)
						
					}
				},
				error:function(XHR){
					$('#error').html("无法连接到网络");
					$('#error').dialog("open");
					setTimeout(function(){
						$('#error').dialog("close");
						$('#login').html("登 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录");
						$('#login').removeClass("load");
					},2000);
				}
			}); //end ajax
		
		}else{
			$('#error').html("账号或密码不得为空");
			$('#error').dialog('open');
			setTimeout(function(){
				$('#error').dialog('close');
			},1000);
		} //end if
		
	});
	
});