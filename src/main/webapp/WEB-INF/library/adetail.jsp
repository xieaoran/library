<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>详细信息 - <s:property value="%{resultAuthor.name}"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../../static/custom/css/common.css">
    <link rel="stylesheet" href="../../static/custom/css/detail.css">
    <script src="../../static/jquery/jquery-3.1.1.min.js"></script>
    <script src="../../static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th colspan="2">作者信息</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>编号</td>
                    <td><s:property value="%{resultAuthor.id}"/></td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td><s:property value="%{resultAuthor.name}"/></td>
                </tr>
                <tr>
                    <td>年龄</td>
                    <td><s:property value="%{resultAuthor.age}"/></td>
                </tr>
                <tr>
                    <td>国家</td>
                    <td><s:property value="%{resultAuthor.country}"/></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
<%--    <s:if test="%{pageType == 1}">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <h3 class="panel-title">确认删除这个作者吗？</h3>
                    </div>
                    <div class="panel-body">
                        <a href="<s:url action="aDeleteSubmit"><s:param name="id" value="%{resultAuthor.id}"/></s:url>" class="btn btn-danger">确认</a>
                        <button type="button" class="btn btn-default" onclick="window.close()">取消</button>
                    </div>
                </div>
            </div>
        </div>
    </s:if>--%>
    <s:if test="%{pageType == 2}">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><s:property value="%{message}"/></h3>
                    </div>
                    <div class="panel-body">
                        <button type="button" class="btn btn-default" onclick="window.close()">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </s:if>
</div>
</body>
</html>
