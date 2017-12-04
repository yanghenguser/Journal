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
	
	$("#register").click(function(){
		$('#login').addClass("load");
		$('#login').html('注册中...');
		$.ajax({
			url:"../Journal/register"  ,
			type:"POST",
			data:$('#registerform').serialize(),
			scriptCharset: 'utf-8',
			success: function(data){
				
				if(data=="error"){
					$('#error').html("注册失败！请检查你所填写的字段");
					$('#error').dialog("open");
					setTimeout(function(){
						$('#error').dialog("close");
						$('#login').html("登 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录");
						$('#login').removeClass("load");
					},1000);
				}else{	
					$.cookie('user',data);
					$('#register').removeClass("load");
					$('#register').css('background','url(img/success.gif) no-repeat 20px center').html('注册成功...正在登陆');
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
	});
})