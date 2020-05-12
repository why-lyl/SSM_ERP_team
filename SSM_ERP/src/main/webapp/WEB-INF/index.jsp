<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@taglib uri="http://shiro.apache.org/tags"  prefix="shiro"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>若愚企管系统主页</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<link rel="stylesheet" href="css/cutsom-style.css">
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>

<style type="text/css">

        @font-face {font-family: "iconfont";
          src: url('fonts/index/iconfont.eot'); /* IE9*/
          src: url('fonts/index/iconfont.eot#iefix') format('embedded-opentype'), /* IE6-IE8 */
          url('fonts/index/iconfont.woff') format('woff'), /* chrome, firefox */
          url('fonts/index/iconfont.ttf') format('truetype'), /* chrome, firefox, opera, Safari, Android, iOS 4.2+*/
          url('fonts/index/iconfont.svg#iconfont') format('svg'); /* iOS 4.1- */
        }

        .iconfont {
          font-family:"iconfont" !important;
          font-size:16px;
          font-style:normal;
          -webkit-font-smoothing: antialiased;
          -webkit-text-stroke-width: 0.2px;
          -moz-osx-font-smoothing: grayscale;
        }

    </style>

</head>
<body>
	<!-- 顶部开始 -->
	<div class="container">
		<div class="logo">
			<a href="index.jsp">若愚企管系统</a>
		</div>
		<div class="left_open">
			<i title="展开左侧栏" class="iconfont">&#xe699;</i>
		</div>
	<!--  	<ul class="layui-nav left fast-add" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">+下拉菜单</a>
				<dl class="layui-nav-child">
					
					<dd>
						<a onclick="x_admin_show('资讯','http://www.baidu.com')"><i
							class="iconfont">&#xe6a2;</i>模拟窗口A</a>
					</dd>
					<dd>
						<a onclick="x_admin_show('图片','http://www.baidu.com')"><i
							class="iconfont">&#xe6a8;</i>模拟窗口B</a>
					</dd>
					<dd>
						<a onclick="x_admin_show('用户','http://www.baidu.com')"><i
							class="iconfont">&#xe6b8;</i>模拟窗口C</a>
					</dd>
				</dl></li>
		</ul> -->
		<ul class="layui-nav right">
			<li class="layui-nav-item"><a href="javascript:;"><span style="color:blue ">登录账号:</span>${USERNAME}</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a onclick="x_admin_show('个人信息','userController/goWelcome.do')">个人中心</a>
					</dd>
					<dd>
						<a href="userController/loginOut.do">退出登录</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item to-index"><a href="userController/index.do">系统首页</a></li>
		</ul>

	</div>
	<!-- 顶部结束 -->
	<!-- 中部开始 -->
	<!-- 左侧菜单开始 -->
	<div class="left-nav">
		<div id="side-nav">
			<ul id="nav">
				
				<!-- 示例：这是一个下拉菜单 -->
				<shiro:hasRole name="stm">
				<li><img  src=""><a href="javascript:;"> <i class="iconfont">&#xe6b8;</i> <cite>用户管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<!-- 这是一个普通按钮 -->
						<li><a _href="staffController/goStaff.do"> <i
								class="iconfont">&#xe6a7;</i> <cite>职工管理</cite>
						</a></li>
						<!-- 按钮结束 -->
						<!-- <li><a _href="departmentController/goOrganization.do"> <i
								class="iconfont">&#xe6a7;</i> <cite>组织结构</cite>
						</a></li> -->
						<li><a _href="departmentController/goDepartment.do"> <i
								class="iconfont">&#xe6a7;</i> <cite>部门管理</cite>
						</a></li>
					</ul></li>
				</shiro:hasRole>
				<!-- 这组下拉菜单结束 -->
				
				<!-- 这是另一组菜单示例 -->
				<shiro:hasRole name="autm">
				<li><a href="javascript:;"> <i class="iconfont">&#xe629;</i> 
				<cite>权限管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="authorityController/goStaffAuthority.do"> <i class="iconfont">&#xe6a7;</i> <cite>职工权限分配</cite>
						</a></li>
						<li><a _href="authorityController/goDepartsAuthority.do"> <i class="iconfont">&#xe6a7;</i> <cite>部门权限分配</cite>
						</a></li>
					</ul></li>
				</shiro:hasRole>
				<!-- 示例结束 -->
				
				<!-- 这是另一组菜单示例 -->
				<shiro:hasRole name="assr">
				<li><a href="javascript:;"> 
				<i class="iconfont">&#xe607;</i> 
				<cite>资产查看</cite> 
				<i class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="applyController/showApplyByUserName.do"> <i class="iconfont">&#xe6a7;</i> <cite>在用资产</cite>
						</a></li>
						<li><a _href="applyController/addApply.do"> <i class="iconfont">&#xe6a7;</i> <cite>资产申请</cite>
						</a></li>
						<li><a _href="porchaseController/showPorchaseByUserName.do"> <i class="iconfont">&#xe6a7;</i> <cite>采购资产</cite>
						</a></li>
					</ul></li>
				</shiro:hasRole>
				<!-- 示例结束 -->
				
				<!-- 这是另一组菜单示例 -->
				<shiro:hasRole name="prom">
				<li><a href="javascript:;"> 
				<i class="iconfont">&#xe602;</i> 
				 <cite>采购管理</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
					<!--写在这里表示写过这个接口，但是后面进行了修改 "purchaseController/goApply.do  -->
					    <li><a _href=purchaseController/goPurchaseAdd.do"> <i class="iconfont">&#xe6a7;</i> <cite>申请采购</cite>
						</a></li>
						<li><a _href="purchaseController/goPurchase.do"> <i class="iconfont">&#xe6a7;</i> <cite>采购批准</cite>
						</a></li>
						<!-- <li><a _href="assetsController/goAllAsseets.do"> <i class="iconfont">&#xe6a7;</i> <cite>申请报废批准</cite>
						</a></li> -->
					</ul></li>
			    </shiro:hasRole>
				<!-- 示例结束 -->
				
					<!-- 这是另一组菜单示例 -->
				<shiro:hasRole name="fac">
				<li><a href="javascript:;"> 
				<i class="iconfont">&#xe68f;</i> 
				 <cite>资金核算</cite> <i
						class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="view/porchase/quary_bill.jsp"> <i class="iconfont">&#xe6a7;</i> <cite>采购核算</cite>
						</a></li>
					</ul></li>
			    </shiro:hasRole>
				<!-- 示例结束 -->
				
				
				<!-- 这是另一组菜单示例 -->
				<shiro:hasRole name="invm">
				<li><a href="javascript:;"> 
				<i class="iconfont">&#xe613;</i> 
				<cite>库存管理</cite> 
				<i class="iconfont nav_right">&#xe697;</i>
				</a>
					<ul class="sub-menu">
						<li><a _href="inventoryController/goAllInventory.do"> <i class="iconfont">&#xe6a7;</i> <cite>库存资产</cite>
						</a></li>
						<!-- <li><a _href="inventoryController/showBorrowreturn.do"> <i class="iconfont">&#xe6a7;</i> <cite>资产流动记录</cite>
						</a></li> -->
					</ul></li>
					</shiro:hasRole>
				<!-- 示例结束 -->
			</ul>
		</div>
	</div>

	<!-- 左侧菜单结束 -->
	<!-- 右侧主体开始 -->
	<div class="page-content">
		<div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
			<!-- 打开的标签页，无需手动添加 -->
			<ul class="layui-tab-title">
				<li>欢迎进入若愚企管系统</li>
			</ul>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<iframe src='userController/goWelcome.do' frameborder="0" scrolling="yes"
						class="x-iframe"></iframe>
				</div>
			</div>
			<!-- 标签页结束 -->
		</div>
	</div>
	<div class="page-content-bg"></div>
	<!-- 右侧主体结束 -->
	<!-- 中部结束 -->
	<!-- 底部开始 -->
	<div class="footer">
		<div class="copyright">liu©2020 前端：x-admin v2.3
			后端：liu-java EE项目</div>
	</div>
	<!-- 底部结束 -->
	
</body>
</html>