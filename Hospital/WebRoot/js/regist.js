/*注册的校验*/
$(function() {
	/*
	 * 1. 得到所有的错误信息，循环遍历之。调用一个方法来确定是否显示错误信息！
	 */
	$(".errorClass").each(function() {
		showError($(this));//遍历每个元素，使用每个元素来调用showError方法
	});

	/*
	 * 2. 切换注册按钮的图片
	 */
	$("#submitBtn").hover(
			function() {
				$("#submitBtn").attr("src", "/Hospital/images/reg1.jpg");
			},
			function() {
				$("#submitBtn").attr("src", "/Hospital/images/reg.jpg");
			}
	);

	/*
	 * 3. 输入框得到焦点隐藏错误信息
	 */
	$(".inputClass").focus(function() {
		var labelId = $(this).attr("id") + "Error";//通过输入框找到对应的label的id
		$("#" + labelId).text("");//把label的内容清空！
		showError($("#" + labelId));//隐藏没有信息的label
	});

	/*
	 * 4. 输入框失去焦点进行校验
	 */
	$(".inputClass").blur(function() {
		var id = $(this).attr("id");//获取当前输入框的id
		var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到对应的校验函数名

		eval(funName);//执行函数调用
	});

	/*
	 * 5. 表单提交时进行校验
	 */
	$("#registForm").submit(function() {
		var bool = true;//表示校验通过
		if(!validateUsername()) {
			bool = false;
		}
		if(!validatePassword()) {
			bool = false;
		}
		if(!validatePassword1()) {
			bool = false;
		}
		if(!validatePhone()) {
			bool = false;
		}
		if(!validateEmail()) {
			bool = false;
		}
		if(!validateNumber()) {
			bool = false;
		}
		if(!validateAddress()) {
			bool = false;
		}
		if(!validateQuestion()) {
			bool = false;
		}
		if(!validateAnswer()) {
			bool = false;
		}
		return bool;
	});
});

/*
 * 登录名校验方法
 */
function validateUsername() {
	var id = "username";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("用户名不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length < 2 || value.length > 20) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("用户名长度必须在3 ~ 20之间！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 3. 是否注册校验

    	$.ajax({
    		url:"/goods/UserServlet",//要请求的servlet
    		data:{method:"ajaxValidateLoginname", loginname:value},//给服务器的参数
    		type:"POST",
    		dataType:"json",
    		async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
    		cache:false,
    		success:function(result) {
    			if(!result) {//如果校验失败
    				$("#" + id + "Error").text("用户名已被注册！");
    				showError($("#" + id + "Error"));
    				return false;
    			}
    		}
    	});*/
	return true;
}

/*
 * 登录密码校验方法
 */
function validatePassword() {
	var id = "password";
	var value = $("#" + id).val();//获取输入框内容

	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length < 3 || value.length > 20) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("密码长度必须在3 ~ 20之间！");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;	
}

/*
 * 确认密码校验方法
 */
function validatePassword1() {
	var id = "password1";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */

	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("确认密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 两次输入是否一致校验
	 */
	if(value != $("#password").val()) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("两次输入不一致！");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;	
}
/*
 * 电话号码的校验方法
 */
function validatePhone() {
	var id = "phone";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("电话号码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 格式校验
	 */
	if(!/^\d+$/.test(value)) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("请输入数字的格式！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 3. 长度校验
	 */
	if(value.length  !=11) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("电话号码应该是11位");
		showError($("#" + id + "Error"));
		return false;
	}

	return true;

}
/*
 * Email校验方法
 */
function validateEmail() {
	var id = "email";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("Email不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. Email格式校验
	 */
	if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("错误的Email格式！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 3. 是否注册校验

    	$.ajax({
    		url:"/goods/UserServlet",//要请求的servlet
    		data:{method:"ajaxValidateEmail", email:value},//给服务器的参数
    		type:"POST",
    		dataType:"json",
    		async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
    		cache:false,
    		success:function(result) {
    			if(!result) {//如果校验失败
    				$("#" + id + "Error").text("Email已被注册！");
    				showError($("#" + id + "Error"));
    				return false;
    			}
    		}
    	});*/
	return true;		
}
/*
 * 身份证号码的校验
 */
function validateNumber() {
	var id = "number";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("身份证号码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 格式校验
	 */
	if(!/^\d+$/.test(value)) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("请输入数字的格式！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 3. 长度校验
	 */
	if(value.length  !=18) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("身份证号码应该是18位");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;
}
/**
 * 地址校验
 * @returns
 */
function validateAddress() {
	var id = "address";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("地址不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}

	/*
	 * 2. 长度校验
	 */
	if(value.length < 3 ) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("地址长度不能太简单！");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;
}
/**
 * 问题校验
 * @returns
 */
function validateQuestion() {
	var id = "question";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("一定要设置问题！");
		showError($("#" + id + "Error"));
		return false;
	}

	/*
	 * 2. 长度校验
	 */
	if(value.length < 3 ) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("问题不能设置太短！");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;
}
/**
 * 
 * @returns 
 */
function validateAnswer() {
	var id = "answer";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("必须要设置答案！");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;
}
/*
 * 验证码校验方法

    function validateVerifyCode() {
    	var id = "verifyCode";
    	var value = $("#" + id).val();//获取输入框内容

 * 1. 非空校验

    	if(!value) {

 * 获取对应的label
 * 添加错误信息
 * 显示label

    		$("#" + id + "Error").text("验证码不能为空！");
    		showError($("#" + id + "Error"));
    		return false;
    	}

 * 2. 长度校验

    	if(value.length != 4) {

 * 获取对应的label
 * 添加错误信息
 * 显示label

    		$("#" + id + "Error").text("错误的验证码！");
    		showError($("#" + id + "Error"));
    		false;
    	}

 * 3. 是否正确

    	$.ajax({
    		url:"/goods/UserServlet",//要请求的servlet
    		data:{method:"ajaxValidateVerifyCode", verifyCode:value},//给服务器的参数
    		type:"POST",
    		dataType:"json",
    		async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
    		cache:false,
    		success:function(result) {
    			if(!result) {//如果校验失败
    				$("#" + id + "Error").text("验证码错误！");
    				showError($("#" + id + "Error"));
    				return false;
    			}
    		}
    	});
    	return true;		
    }*/

/*
 * 判断当前元素是否存在内容，如果存在显示，不页面不显示！
 */
function showError(ele) {
	var text = ele.text();//获取元素的内容
	if(!text) {//如果没有内容
		ele.css("display", "none");//隐藏元素
	} else {//如果有内容
		ele.css("display", "");//显示元素
	}
}

/* 
 * 换一张验证码

    function _hyz() {

 * 1. 获取<img>元素
 * 2. 重新设置它的src
 * 3. 使用毫秒来添加参数

    	$("#imgVerifyCode").attr("src", "/goods/VerifyCodeServlet?a=" + new Date().getTime());
    }*/
