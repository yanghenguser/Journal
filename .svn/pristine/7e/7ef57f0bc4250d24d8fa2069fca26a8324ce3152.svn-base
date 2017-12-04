$(function(){
	$(".delete").click(function(){
		$.ajax({
			url:"../Journal/deletenewspaper",
			data:{
				newsnum:$(this).parent().parent().find(".newsnum").html(),
			},
			success:function(){
				alert("删除成功！");
			}
		});
	});
	
	$("#addnews").click(function(){
		alert($("#newsname").val());
		
		$.ajax({
			url:"../Journal/addnews",
			data:{
				newsname:$("#newsname").val(),
				newsnum:$("#newsnum").val(),
				newsclass:$("#newsclass option:selected").text(),
				press:$("#press").val(),
				publish:$("#publish").val(),
				quarterly:$("#quarterly").val(),
				piclocation:$("#piclocation").val(),
				content:$("#content").val(),	
			},
			success:function(data){
				alert(data);
			}
		});
	});
});