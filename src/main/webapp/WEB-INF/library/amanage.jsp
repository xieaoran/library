<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <s:if test="%{null != resultAuthor}">
        <title>修改作者 - <s:property value="%{resultAuthor.name}"/></title>
    </s:if>
    <s:else><title>新建作者</title></s:else>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../../static/custom/css/common.css">
    <link rel="stylesheet" href="../../static/custom/css/manage.css">
    <script src="../../static/jquery/jquery-3.1.1.min.js"></script>
    <script src="../../static/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../static/custom/js/manage.js"></script>
</head>
<body>
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="modalLabel">确认</h4>
            </div>
            <div class="modal-body">
                <p id="modal-message"></p>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="formSubmit()" class="btn btn-primary">确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <form id="form" method="post"
                    <s:if test="%{null != resultAuthor}">
                        action="<s:url action="aEditSubmit"/>"
                    </s:if>
                    <s:else>
                        action="<s:url action="aCreateSubmit"/>"
                    </s:else>
                  class="form-horizontal" role="form">
                <s:if test="%{null != resultAuthor}">
                    <s:hidden name="id" value="%{resultAuthor.id}"/>
                    <div class="form-group">
                        <label for="idView" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="idView" disabled="disabled"
                                   value="<s:property value="%{resultAuthor.id}"/>">
                        </div>
                    </div>
                </s:if>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name"
                        <s:if test="%{null != resultAuthor}">
                               value="<s:property value="%{resultAuthor.name}"/>"
                        </s:if>
                               placeholder="莫言">
                    </div>
                </div>
                <div class="form-group">
                    <label for="age" class="col-sm-2 control-label">年龄</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="age" name="age"
                        <s:if test="%{null != resultAuthor}">
                               value="<s:property value="%{resultAuthor.age}"/>"
                        </s:if>
                               placeholder="61">
                    </div>
                </div>
                <div class="form-group">
                    <label for="country" class="col-sm-2 control-label">国家</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="country" name="country"
                        <s:if test="%{null != resultAuthor}">
                               value=
                                   "<s:property value="%{resultAuthor.country}" />"
                        </s:if>
                               placeholder="中国">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button"
                                <s:if test="%{null != resultAuthor}">
                                    onclick="confirmEdit()"
                                </s:if>
                                <s:else>
                                    onclick="confirmNew()"
                                </s:else>
                                class="btn btn-primary">保存
                        </button>
                        <button type="reset" class="btn btn-warning">重置</button>
                        <button type="button" class="btn btn-default" onclick="window.close()">取消</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>