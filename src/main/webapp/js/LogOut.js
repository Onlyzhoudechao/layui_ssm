/*var element;
var $;
var layer;
layui.use('element','jquery','layer', function(){
  var layer = layui.layer;
  $('#logOut').on('click', function() {
	  var layer = layui.layer;
		layer.confirm('确定注销登录？', {
			btn: ['确定', '取消'] //按钮
		}, function() {
			$.ajax({
				type : "post",
				url : $('#basePath').val()+"menu/logOut",
				data : {
					"tempcode" : $('#tempcode').val(),
				}
			});
			layer.msg("已注销");
			window.location.href = $('#basePath').val()+'login';
		}, function() {
			layer.msg('已取消');
		});
  });
});    
*/