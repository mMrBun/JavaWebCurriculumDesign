<%@ page import="com.xxxx.service.UserService" %>
<%@ page import="com.xxxx.entity.vo.MessageModel" %><%--
  Created by IntelliJ IDEA.
  User: Xu hui
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <link rel="stylesheet" href="css/Login.css">

</head>
<body>
<div class="titlepage">
    <form action="login" method="post" id="loginForm">
        <div id="div_uname">
            <img class="img_uname" src="ImgSource/user%20(1).png"width="25px"height="25px">
            <input type="text" name="uname" id="uname" value="${messageModel.object.userName}" >
        </div>
        <div id="div_upwd">
            <img class="img_pwd" src="ImgSource/password.png"width="25px"height="25px">
            <input type="password" name="upwd" id="upwd" value="${messageModel.object.userPwd}"> <br>
        </div>
        <div id="div_validationCode">
            <img class="img_validationCode" src="ImgSource/code%20(2).png"width="25px"height="25px">
            <input type="text" name="validationCode" id="validationCode" placeholder="请输入验证码" lay-verify="required">
        </div>
        <div id="div_validationCode_img">
            <img src="validate.jsp" id="validationCode_img" title="看不清?换一个" onclick="loadimage();return false;" name="validationCode_img" align="middle">
        </div>
        <br>
        <input type="checkbox"name="OneWeekLogin"value="ok">一周免登录 <br>
        <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span> <br>
        <div class="tel">
            <p style="font-size:30px;font-family: 'Microsoft YaHei UI Light';color:white">立即登陆</p>
        </div>
    </form>
</div>
</body>
<%-- 引入Jquery的js文件 --%>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    /**
     * 登录表单验证
         1. 给登录按钮绑定点击事件（通过id选择器绑定）
         2. 获取用户姓名和密码的值
         3. 判断姓名是否为空
            如果姓名为空，提示用户（span标签赋值），并且return
         4. 判断密码是否为空
            如果密码为空，提示用户（span标签赋值），并且return
         5. 如果都不为空，则手动提交表单
     */
    window.addEventListener("beforeunload",function (ev) {
        <%
        Cookie[]cookies=request.getCookies();
        String usrname="";
        String usrpwd="";
        if (cookies!=null&&cookies.length>0) {
            for (Cookie cookie : cookies) {
                String name = cookie.getName();
                if (name.equals("uname")) {
                    usrname = cookie.getValue();
                }
                String pwd = cookie.getName();
                if (pwd.equals("upwd")) {
                    usrpwd = cookie.getValue();
                }
            }
            if (usrname != null && usrpwd != null) {
                UserService userService = new UserService();
                MessageModel messageModel = userService.userLogin(usrname, usrpwd, true);
                if (messageModel.getCode() == 1) {
                    request.getSession().setAttribute("user", messageModel.getObject());
                    request.getSession().setAttribute("dwnFile1", messageModel.getFile1());
                    request.getSession().setAttribute("dwnFile2", messageModel.getFile2());
                    request.getSession().setAttribute("dwnFile3", messageModel.getFile3());
                    response.sendRedirect("index.jsp");
                }
            }
        }
        %>
    });
    $(".tel").click(function () {
        // 获取用户姓名和密码的值
        var uname = $("#uname").val();
        var upwd = $("#upwd").val();
        var ucode=$("#validationCode").val();
        // 判断姓名是否为空
        if (isEmpty(uname)) {
            // 如果姓名为空，提示用户（span标签赋值），并且return  html()
            $("#msg").html("用户姓名不可为空！");
            return;
        }
        // 判断密码是否为空
        if (isEmpty(upwd)) {
            // 如果密码为空，提示用户（span标签赋值），并且return  html()
            $("#msg").html("用户密码不可为空！");
            return;
        }
        if(isEmpty(ucode))
        {
            $("#msg").html("验证码不能为空");
            return;
        }
        // 如果都不为空，则手动提交表单
        $("#loginForm").submit();
    });
    //加载验证码图片，后面加时间可以保证每次页面刷新时验证码也刷新
    function loadimage(){
        document.getElementById("validationCode_img").src= "validate.jsp?time=" + new Date().getTime();
    }
    /**
     * 判断字符串是否为空
     *      如果为空，返回true
     *      如果不为空，返回false
     * @param str
     * @returns {boolean}
     */

    function isEmpty(str) {
        if (str == null || str.trim() == "") {
            return true;
        }
        return  false;
    }
</script>
</html>
