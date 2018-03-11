var element;
var $;
var layer;
layui.use(['element','jquery','layer'],function(){
    element = layui.element;
    $ = layui.jquery;
    layer=layui.layer
    element.on('nav(top-menu)', function(elem){
    	layer.msg(elem[0].innerText);
        addTab(elem[0].innerText,elem[0].attributes[1].nodeValue,elem[0].id);
    	
    });
    //监听tab选项卡切换
    element.on('tab(tab-switch)', function(data){
        if(data.elem.context.attributes != undefined){
            var id = data.elem.context.attributes[0].nodeValue;
            layer.msg(id);
            layui.each($(".layui-layout-left"), function () {
                $(this).find("li").removeClass("layui-this");
                $(this).find("dd").removeClass("layui-this");
            });
            	$("#"+id).addClass("layui-this");
        }
    });

	    
    $('#changepwd').on('click', function() {
		layer.open({
			type : 2,
			title : "修改密码",
			skin : 'layui-layer-rim', // 样式类名
			shadeClose : true, // 开启遮罩关闭
			area : [ '500px', '300px' ], // 宽高
			content : $('#basePath').val()+'menu/changepwd'
		});
	});
    
    $('#change_save').on('click', function() {
    	var oldpwd=$('#oldpwd').val(),
    	newpwd=$('#newpwd').val(),
    	confirpwd=$('#confirpwd').val();
    	if(oldpwd==null||oldpwd=='undefined'||newpwd==null||newpwd=='undefined'||confirpwd==null||confirpwd=='undefined'){
    		larer.msg("密码不能为空！")
    	}else if(newpwd!=confirpwd){
    		larer.msg("两次输入的密码不一致！请重新输入")
    	}else{
    	$.ajax({
			type : "post",
			url : "changepwd_save",
			data : {
				"oldpwd":$('#oldpwd').val(),
				"newpwd":$('#newpwd').val(),
				"confirpwd":$('#confirpwd').val()
			},
			success : function(cbm) {
				if (cbm.status == '1') {
					var temp=cbm.map.tempcode;
					larer.msg(cbm.message)
					var index = parent.layer.getFrameIndex(window.name);
					setTimeout(function(){parent.layer.close(index)}, 1000);
				} else {
					larer.msg(cbm.message);
				}
			},
			error : function() {

			}
		});
    	}
	});
    
    $('#change_cancel').on('click', function() {
    	var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	});
    //用户注销登录方法
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
  			//一秒钟后跳转至登录页面
  			setTimeout(function(){window.location.href = $('#basePath').val()+'login';}, 1000);
  		}, function() {
  			layer.msg('已取消');
  		});
    });
});

/**
 * 新增tab选项卡，如果已经存在则打开已经存在的，不存在则新增
 * 
 * @param tabTitle
 *            选项卡标题名称
 * @param tabUrl
 *            选项卡链接的页面URL
 * @param tabId
 *            选项卡id
 */
function addTab(tabTitle,tabUrl,tabId){
    if ($(".layui-tab-title li[lay-id=" + tabId + "]").length > 0) {
        element.tabChange('tab-switch', tabId);
    }else{
        element.tabAdd('tab-switch', {
            title: tabTitle
            ,content: '<iframe src='+tabUrl+' width="100%" style="min-height: 500px;" frameborder="0" scrolling="auto" onload="setIframeHeight(this)"></iframe>' // 选项卡内容，支持传入html
            ,id: tabId //选项卡标题的lay-id属性值
        });
        element.tabChange('tab-switch', tabId); //切换到新增的tab上
    }
}

/**
 * ifrme自适应页面高度，需要设定min-height
 * @param iframe
 */
function setIframeHeight(iframe) {
    if (iframe) {
        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
        if (iframeWin.document.body) {
            iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
        }
    }
};