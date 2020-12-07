<%--
  Created by IntelliJ IDEA.
  User: 馒头尼桑
  Date: 2020/12/6
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<div id="head">
    <ul >
        <li class="first"><a href="" >首页</a></li>
        <li class="first"><a href="">商品管理</a>
            <ul id="sp"></ul>
        </li>
        <li class="first"><a href="">订单管理</a>
            <ul id="dd">

            </ul>
        </li >
        <li class="first"><a href="">财务管理</a>
            <ul id="cw">

            </ul>
        </li>
        <li class="first"><a href="">报关管理</a>
            <ul id="bg">

            </ul>
        </li>
        <li class="first"><a href="">数据维护</a>
            <ul id="sj">

            </ul>
        </li>
        <li class="first"><a href="">系统管理</a>
            <ul id="xt">

            </ul>
        </li>
        <li class="first"><a href="javascript:;">当前用户:${user.realName}</a></li>
        <div id="final">
            <li class="first"><a href="javascript:;">武汉纺织大学:${user.jurisdiction}</a></li>
        </div>
    </ul>
</div>
<div id="demo" class="carousel slide" data-ride="carousel">
    <!-- 指示符 -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>

    <!-- 轮播图片 -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="ImgSource/4.jpg">
        </div>
        <div class="carousel-item">
            <img src="ImgSource/5.png">
        </div>
        <div class="carousel-item">
            <img src="ImgSource/6.jpg">
        </div>
    </div>

    <!-- 左右切换按钮 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>

</div>
<div id="middle_title">
    <h1>跨境电商综合服务</h1>
    <p>为企业提供订单,支付,物流,通关相结合的一体化服务</p>
</div>
<div id="middle_content">
    <div class="dt_1">
        <h3>商品管理</h3>
        <p>企业商品信息的录入。备案
            申请、商品审核、浏览、维
            护等操作。支持在一账号下
            维护多销售渠道的商品。</p>
        <img src="ImgSource/ds.png" alt="">
    </div>
    <div class="dt_1">
        <h3>订单管理</h3>
        <p>订单的excel格式文件的批量
            上传、有效性检查、订单的
            审核、订单状态的查询、历
            史订单的下载导出。</p>
        <img src="ImgSource/sd.png" alt="">
    </div>
    <div class="dt_1">
        <h3>财务管理</h3>
        <p>整合全方位数据,自动生成
            销售、财务等各类报表,完
            成对支付的确认,执行批量
            退款业务等操作。
        </p>
        <img src="ImgSource/zs.png" alt="">
    </div>
    <div class="dt_1">
        <h3>报关管理</h3>
        <p>订单、支付单、物流单三单
            合-推送海关，产品出库手
            续齐备,有据可循,符合海
            关对跨境业务的要求。</p>
        <img src="ImgSource/sk.png" alt="">
    </div>
    <div>
        <h3>系统管理</h3>
        <p>商品类目、产地等基础信息
            的维护，商家、用户、角
            色、权限等管理,各类参数
            的配置。</p><br>
        <img src="ImgSource/zc.png" alt="">
    </div>
</div>
<div id="foot">
    <p>Copyright◎2017版权所有武汉市海欢商贸有限公司</p>
    <p>客服热线: 400-076- 6288</p>
    <p> 鄂ICP备14061524号:2</p>
</div>
</body>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    function get_menu(index,doc)
    {
        var xhr=new XMLHttpRequest();
        xhr.open("post","MenuServlet");
        xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
        xhr.send("id="+index);
        xhr.onreadystatechange=function () {
            if(xhr.readyState==4 && xhr.status==200)
            {
                var obj=xhr.responseText;
                var res=JSON.parse(obj);
                var _html="";
                for(i=0;i<res.length;i++)
                {
                    doc.innerHTML+="<li><a href="+res[i].link+">"+res[i].sFile+"</a></li>";
                }
            }
        }
    }
    $(function () {
        var doc1=document.getElementById("sp");
        var doc2=document.getElementById("dd");
        var doc3=document.getElementById("cw");
        var doc4=document.getElementById("bg");
        var doc5=document.getElementById("sj");
        var doc6=document.getElementById("xt");
        get_menu(2,doc1);
        get_menu(3,doc2);
        get_menu(4,doc3);
        get_menu(5,doc4);
        get_menu(6,doc5);
        get_menu(7,doc6);

    });



</script>
</html>
