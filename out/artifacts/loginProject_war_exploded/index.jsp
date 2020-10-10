<%@ page import="com.xxxx.controller.UserServlet" %><%--
  Created by IntelliJ IDEA.
  User: XuHui
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="css/Home.css">
  </head>
  <body>
  <div id="usr">
    <p>欢迎${user.userName}登陆</p>
    <a id="safeexit" href="login.jsp">[安全退出]</a>
  </div>
  <div id="logo">
  <img src="ImgSource/logo.png"style="width: 400px;height: 96px;"/>
  </div>
  <div id="nav">
    <ul>
      <li><a href="">首页</a></li>
      <li><a id="btn_Login" href="javascript:;">资源下载</a></li>
      <li><a id="btn_UserControl" href="javascript:;">用户管理</a></li>
      <li><a id="btn_SourceControl" href="javascript:;">资源管理</a></li>
      <li><a id="btn_PersonalHome" href="javascript:;">个人中心</a></li>
    </ul>
  </div>
  <div id="page">
    <div class="var1">
      <img class="" src="ImgSource/pdf.png" alt="">
      <h2 id="file1_name"style="margin-left: 6%">${dwnFile1.name}</h2>
      <p id="file1_size" style="margin-left: 2%;display:block;float: left">大小:${dwnFile1.size}</p>
      <p id="file1_time"style="float: left;display: block;margin-left: 2%">时间:2020-8-30</p>
      <p style="float: left;display: block;margin-left: 2%">星级:</p>
      <img id="file1_level" src="ImgSource/level3.png" style="width: 119.7px;height: 21px;"> <br>
      <p id="file1_description"style="margin-left: 6%">${dwnFile1.description}</p>
      <button id="file1_Download"><a style="text-decoration: none;color:#79D7A9" href="${pageContext.request.contextPath}/DownloadTop">立即下载</a></button>
    </div>
    <div class="var2">
      <img class="" src="ImgSource/pdf.png" alt="">
      <h2 id="file2_name"style="margin-left: 6%">${dwnFile2.name}</h2>
      <p id="file2_size" style="margin-left: 2%;display:block;float: left">大小:${dwnFile2.size}</p>
      <p id="file2_time"style="float: left;display: block;margin-left: 2%">时间:2020-6-28</p>
      <p style="float: left;display: block;margin-left: 2%">星级:</p>
      <img id="file2_level" src="ImgSource/level2.png" style="width: 119.7px;height: 21px;"> <br>
      <p id="file2_description"style="margin-left: 6%">${dwnFile2.description}</p>
      <button id="file2_Download"><a style="text-decoration: none;color:#79D7A9" href="${pageContext.request.contextPath}/Downloadmiddle">立即下载</a></button>
    </div>
    <div class="var3">
      <img class="" src="ImgSource/pdf.png" alt="">
      <h2 id="file3_name"style="margin-left: 6%">${dwnFile3.name}</h2>
      <p id="file3_size" style="margin-left: 2%;display:block;float: left">大小:${dwnFile3.size}</p>
      <p id="file3_time"style="float: left;display: block;margin-left: 2%">时间:2019-1-20</p>
      <p style="float: left;display: block;margin-left: 2%">星级:</p>
      <img id="file3_level" src="ImgSource/level4.png" style="width: 119.7px;height: 21px;"> <br>
      <p id="file3_description"style="margin-left: 6%">${dwnFile3.description}</p>
      <button id="file3_Download"><a style="text-decoration: none;color:#79D7A9" href="${pageContext.request.contextPath}/Download">立即下载</a></button>
    </div>
  </div>
  <div id="else">
  <span id="Content"></span>
  </div>

  </body>
  <script type="text/javascript"src="js/jquery-3.4.1.js"></script>
  <script type="text/javascript">
      $(function () {
          var name ='${user.userName}';
          if(name=="")
          {
              alert("请先登录");
              window.location.href="login.jsp";
          }
          var file1_level=${dwnFile1.start};
          var file2_level=${dwnFile2.start};
          var file3_level=${dwnFile3.start};
          var a=new Array(5);
          a[0]="ImgSource/level1.png";
          a[1]="ImgSource/level2.png";
          a[2]="ImgSource/level3.png";
          a[3]="ImgSource/level4.png";
          a[4]="ImgSource/level5.png";
          $.each(a, function(i,val){
              if(file1_level==i+1)
              {
                  $("#file1_level").attr("src",val);
              }
              if(file2_level==i+1)
              {
                  $("#file2_level").attr("src",val);
              }
              if(file3_level==i+1)
              {
                  $("#file3_level").attr("src",val);
              }
          });
      });
      $("#btn_Login").click(function () {
          document.getElementById("page").style.display="";
          document.getElementById("else").style.display="none";
      })
      $("#btn_PersonalHome").click(function () {
          document.getElementById("page").style.display="none";
          document.getElementById("else").style.display="";
          document.getElementById("Content").innerHTML ="这里是个人中心";
      })
      $("#btn_SourceControl").click(function () {
          var user='${user.jurisdiction}';
          document.getElementById("page").style.display="none";
          document.getElementById("else").style.display="";
          if(user!="管理员")
          {
              document.getElementById("Content").innerText ="您没有权限访问此页面";
          }
          else
          {
              document.getElementById("Content").innerText ="这里是资源管理";
          }
      })
      $("#btn_UserControl").click(function () {
          var user='${user.jurisdiction}';
          document.getElementById("page").style.display="none";
          document.getElementById("else").style.display="";
          if(user!="管理员")
          {
              document.getElementById("Content").innerText ="您没有权限访问此页面";
          }
          else
          {
              document.getElementById("Content").innerText ="这里是用户管理";
          }
      })
    $("#safeexit").click(function () {
        <%
        UserServlet userServlet=new UserServlet();
        userServlet.cookie_name=new Cookie("uname",null);
        userServlet.cookie_pwd=new Cookie("upwd",null);
        userServlet.cookie_name.setMaxAge(0);
        userServlet.cookie_pwd.setMaxAge(0);
        response.addCookie(userServlet.cookie_name);
        response.addCookie(userServlet.cookie_pwd);
        %>
        window.location.href="login.jsp";
    })
  </script>
</html>
