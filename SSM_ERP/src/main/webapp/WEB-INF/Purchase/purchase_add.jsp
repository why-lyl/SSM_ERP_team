<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>添加用户</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<script type="text/javascript">
layui.use(['form','layer','laydate'], function(){
    $ = layui.jquery;
  var form = layui.form
  ,layer = layui.layer
  ,laydate=layui.laydate;
	
	
  //日期
  laydate.render({
	elem: '#date1'
	});
laydate.render({
	elem: '#date2'
	});
  //自定义验证规则
  form.verify({
    accountIdRule: function(value){
      if(value.length < 2){
        return '请至少添加2个字符';
      }
    }
    ,pass: [/(.+){3,12}$/, '密码必须3到12位']
    ,repass: function(value){
        if($('#AccountPassword').val()!=$('#ReAccountPassword').val()){
            return '两次密码不一致';
        }
    }
  }); 
  //监听提交
  form.on('submit(add)', function(data){
    console.log(data);
    //发异步，把数据提交给php
    console.log(data);
    $.ajax({
		type : "POST",
		data : $('#form1').serialize(),
		dataType : "text",
		url :"purchaseController/purchaseAdd.ajax",
		success : function(result) {
		 //发异步，把数据提交给php
         layer.msg("申请提交成功,请等待管理员审核",{
      		icon : 1,
       		time: 500,
       	},function () {
             // 获得frame索引
             var index = parent.layer.getFrameIndex(window.name);
             //关闭当前frame
             parent.location.reload();
             parent.layer.close(index);
         });
		},
		error : function() {
			layer.msg('无法连接服务器', {icon: 2});
		}
	});   
    return false;
  });
  });
  </script>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">采购管理</a>
        <a>
          <cite>申请采购</cite></a><!--这里是小的导航栏上面的显示  -->
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
	<div class="x-body">
	
   
		<!-- <form class="layui-form" method="post"
			action="porchaseController/addPorchase.do">
			<div class="layui-form-item">
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"><span
						class="x-red">*</span>类型 </label>
					<div class="layui-input-inline">
						</label> <select name="bigtypeName" id="quiz3" lay-filter="myselect2">
							<option value="" selected="selected">请选择类型</option>
							<option value="固定资产">固定资产</option>
							<option value="非实物资产">非实物资产</option>
							<option value="低值易耗损品">低值易耗损品</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item" id="panel">
					<label for="L_repass" class="layui-form-label"><span
						class="x-red">*</span>分类 </label>
					<div class="layui-input-inline">
						<select name="malltypeName" id="quiz4" lay-filter="myselect3">
							<option value="" selected="selected">请选择分类</option>
							<option value="固定资产">固定资产</option>
							<option value="非实物资产">非实物资产</option>
							<option value="低值易耗损品">低值易耗损品</option>
						</select>
					</div>
				</div>


				<div class="layui-form-item" id="panel3">
					<label for="L_repass" class="layui-form-label"><span
						class="x-red">*</span>名称 </label>
					<div class="layui-input-inline">
						<select name="propertyName" id="quiz1" lay-filter="myselect">
							<option value="" selected="selected">请选择资产</option>
						</select>
					</div>
				</div>


				<div class="layui-form-item" id="panel5">
					<label for="L_repass" class="layui-form-label"> <span
						class="x-red">*</span>型号
					</label>
					<div class="layui-input-inline">
						<select name="type" id="quiz2">
							<option value="">请选择型号</option>
							<option value="杭州">杭州</option>
							<option value="宁波" disabled="">宁波</option>
							<option value="温州">温州</option>
							<option value="温州">台州</option>
							<option value="温州">绍兴</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_pass" class="layui-form-label"> <span
						class="x-red">*</span>单价
					</label>
					<div class="layui-input-inline">
						<input name="propertyPrece" lay-verify="number" type="text"
							id="L_pass" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_pass" class="layui-form-label"> <span
						class="x-red">*</span>数量
					</label>
					<div class="layui-input-inline">
						<input name="propertyNum" type="text" id="L_pass"
							autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">1到10个字符</div>
				</div>

				<div class="layui-form-item">
					<label for="L_name" class="layui-form-label"> <span
						class="x-red">*</span>采购时间
					</label>
					<div class="layui-input-inline">
						<input name="finishTime" type="text" onClick="WdatePicker()"
							readonly="readonly" value="1900-01-01" id="L_name"
							autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"> </label>
					<button class="layui-btn" type="submit">提交</button>
					<button class="layui-btn" type="button"
						onclick="returnUserPorchase()">返回</button>
				</div>
		</form>
 -->	
  <form id="form1" class="layui-form">
          <div class="layui-form-item">
              <label for="staffname" class="layui-form-label">
                  <span class="x-red"></span>申请人姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="staffname" name="purchaseStaff" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
         </div>
         <div class="layui-form-item">
              <label for="purchasesort" class="layui-form-label">
                  <span class="x-red"></span>采购物品种类
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="staffname" name="purchaseSort" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
         </div>
         <div class="layui-form-item">
              <label for="purchasename" class="layui-form-label">
                  <span class="x-red"></span>采购物品名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="staffname" name="purchaseName" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
         </div>
          <div class="layui-form-item">
              <label for="purchaseamount" class="layui-form-label">
                  <span class="x-red"></span>采购物品数量
              </label>
              <div class="layui-input-inline">
                  <input type="number" id="staffname" name="purchaseAmount" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
         </div>
         <div class="layui-form-item">
              <label for="purchaseprice" class="layui-form-label">
                  <span class="x-red"></span>采购物品单价
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="staffname" name="purchasePrice" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
         </div><div class="layui-form-item">
              <label for="purchasetotal" class="layui-form-label">
                  <span class="x-red"></span>申请总资金
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="staffname" name="purchaseTotal" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
         </div>
               <div class="layui-form-item">
              <label for="applytime" class="layui-form-label">
                  <span class="x-red"></span>申请日期
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="date1" name="applyTime" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="purchasetime" class="layui-form-label">
                  <span class="x-red"></span>采购日期
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="date2" name="purchaseTime" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          
               <div class="layui-form-item">
              <label for="ReAccountPassword" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                 提交申请
              </button>
          </div>
      </form>
 
 
 
 
 </div>
	<script>
		/* layui.use('laydate', function() {
			var laydate = layui.laydate;
			//执行一个laydate实例
			laydate.render({
				elem : '#L_entry' //指定元素
			});
		}); */
		/* 	function addmember() {
				 
					//提交信息……
					// 获得frame索引
					var index = parent.layer.getFrameIndex(window.name);
					//关闭当前frame
					parent.layer.close(index);
				});
			} */

		function returnUserPorchase() {
			window.location.href = "porchaseController/showPorchaseByUserName.do";
		}

		/*一級 联动下拉框 */
		layui.use([ 'layer', 'form' ], function() {
			var layer = layui.layer, form = layui.form;
			form.on('select(myselect2)', function(data) {
				var bigtypeName = $("#quiz3").val();
				$.ajax({
					type : 'POST',
					url : 'propertyController/returnMalltypeName.ajax',
					data : {
						"bigtypeName" : bigtypeName
					},
					dataType : 'json',
					success : function(allproperty) {
						var str = "";
						$("#quiz4").empty();
						str += "<option>请选择分类</option>"
						$("#quiz4").html(str);

						for (var i = 0; i < allproperty.length; i++) {
							var property = allproperty[i];
							$("#quiz4").append(
									"<option >" + property.malltypeName
											+ "</option>");
							form.render('select');
							$("#quiz4").get(0).selectedIndex = 0;
						}
					},
					error : function(msg) {
						alert("无法连接服务器");
					}
				});
			});
		});
		/*二級 联动下拉框 */
		layui.use([ 'layer', 'form' ], function() {
			var layer = layui.layer, form = layui.form;
			form.on('select(myselect3)', function(data) {
				var malltypeName = $("#quiz4").val();
				$.ajax({
					type : 'POST',
					url : 'propertyController/returnPropertyName.ajax',
					data : {
						"malltypeName" : malltypeName
					},
					dataType : 'json',
					success : function(allproperty) {
						var str = "";
						$("#quiz1").empty();
						str += "<option>请选择资产</option>"
						$("#quiz1").html(str);

						for (var i = 0; i < allproperty.length; i++) {
							var property = allproperty[i];
							$("#quiz1").append(
									"<option >" + property.propertyName
											+ "</option>");
							form.render('select');
							$("#quiz1").get(0).selectedIndex = 0;
						}
					},
					error : function(msg) {
						alert("无法连接服务器");
					}
				});
			});

		});
		/*三級 联动下拉框 */
		layui.use([ 'layer', 'form' ], function() {
			var layer = layui.layer, form = layui.form;
			form.on('select(myselect)', function(data) {
				var propertyName = $("#quiz1").val();
				$.ajax({
					type : 'POST',
					url : 'applyController/returnType.do',
					data : {
						"propertyName" : propertyName
					},
					dataType : 'json',
					success : function(allproperty) {
						var str = "";
						$("#quiz2").empty();
						str += "<option>请选择型号</option>"
						$("#quiz2").html(str);

						for (var i = 0; i < allproperty.length; i++) {
							var property = allproperty[i];
							$("#quiz2").append(
									"<option >" + property.type + "</option>");
							form.render('select');
							$("#quiz2").get(0).selectedIndex = 0;
						}
					},
					error : function(msg) {
						alert("无法连接服务器");
					}
				});
			});

		});
	</script>
</body>

</html>