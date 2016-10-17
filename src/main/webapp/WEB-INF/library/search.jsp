<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索<s:if test="%{null != keyword}"> - <s:property value="%{keyword}"/></s:if></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../../static/custom/css/common.css">
    <link rel="stylesheet" href="../../static/custom/css/search.css">
    <script src="../../static/jquery/jquery-3.1.1.min.js"></script>
    <script src="../../static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">图书管理系统</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form method="post" action="<s:url action="search"/>" class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input name="keyword" type="text" class="form-control" placeholder="作者名" value="<s:property value="%{keyword}"/>">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a onclick="window.open('<s:url action="manage"/>',
                        '', 'width=480,height=592,resizable=no,scrollbars=no,toolbar=no,menubar=no');">新建图书</a></li>
                <li><a onclick="window.open('<s:url action="amanage"/>',
                        '', 'width=480,height=330,resizable=no,scrollbars=no,toolbar=no,menubar=no');">新建作者</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>ISBN</th>
                        <th>标题</th>
                        <th>作者</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="%{resultBooks}">
                        <tr>
                            <td><s:property value="%{isbn}"/></td>
                            <td><s:property value="%{title}"/></td>
                            <td><s:property value="%{author.name}"/></td>
                            <td>
                                <div>
                                    <button onclick="window.open('<s:url action="detail"><s:param name="isbn" value="%{isbn}"/></s:url>',
                                            '', 'width=480,height=520,resizable=no,scrollbars=no,toolbar=no,menubar=no');"
                                       type="button" class="btn btn-primary">详细信息</button>
                                    <button onclick="window.open('<s:url action="manage"><s:param name="isbn" value="%{isbn}"/></s:url>',
                                            '', 'width=480,height=610,resizable=no,scrollbars=no,toolbar=no,menubar=no');"
                                            type="button" class="btn btn-warning">更改</button>
                                    <button onclick="window.open('<s:url action="delete"><s:param name="isbn" value="%{isbn}"/></s:url>',
                                            '', 'width=480,height=640,resizable=no,scrollbars=no,toolbar=no,menubar=no');"
                                            type="button" class="btn btn-danger">删除</button>
                                </div>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
