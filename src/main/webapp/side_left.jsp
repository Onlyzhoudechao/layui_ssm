<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="layui/layui.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<script>
        layui.use('element', function () {
            var $ = layui.jquery
            , element = layui.element
            });
            //Tab的切换功能，切换事件监听等，需要依赖element模块
</script>
</head>
<body>
	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll" id="daohang">
			<!--        左侧导航区域（可配合layui已有的垂直导航） -->
			<ul class="layui-nav layui-nav-tree" lay-filter="test">
				<li class="layui-nav-item layui-nav-itemed"><a class=""
					href="javascript:;">所有商品</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;" data-rel="列表一">列表一</a>
						</dd>
						<dd>
							<a href="javascript:;" data-rel="列表二">列表二</a>
						</dd>
						<dd>
							<a href="javascript:;" data-rel="列表三">列表三</a>
						</dd>
						<dd>
							<a href="">超链接</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;">列表一</a>
						</dd>
						<dd>
							<a href="javascript:;">列表二</a>
						</dd>
						<dd>
							<a href="">超链接</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">云市场</a></li>
				<li class="layui-nav-item"><a href="">发布商品</a></li>
			</ul>
		</div>
	</div>
</body>
</html>