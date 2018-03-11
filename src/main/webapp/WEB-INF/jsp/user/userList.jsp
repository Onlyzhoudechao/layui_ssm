<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${basePath}layui/layui.js"></script>
<link rel="stylesheet" href="${basePath}layui/css/layui.css">
<title>Insert title here</title>
</head>
<body>
 
<table class="layui-hide" id="test"></table>
<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
    ,url:'${basePath}/menu/listUser'
    ,height: 'full-20'
    ,width:'100%'
    ,cols: [[
      {type:'checkbox'}
      ,{field:'userCode', width:80, title: '账号', sort: true}
      ,{field:'userName', width:150, title: '用户名'}
      ,{field:'gender', width:60, title: '性别'}
      ,{field:'age', width:70, title: '年龄', sort: true}
      ,{field:'telephone', width:120, title: '电话'}
      ,{field:'qq', width:120, title: 'QQ'}
      ,{field:'wechat', width:120, title: '微信'}
      ,{field:'eMail', width:200, title: '邮箱'}
      ,{field:'address', width:250, title: '地址'}
      ,{field:'userrole', width:80, title: '角色'}
      ,{field:'changedate' ,width:140, title: '变更时间'}
      ,{field:'lastPwdModify', width:140, title: '上次改密时间'}
      ,{field:'islocked', width:92, title: '禁用'}
    ]]
    ,page: true
  });
});
</script>
</body>
</html>