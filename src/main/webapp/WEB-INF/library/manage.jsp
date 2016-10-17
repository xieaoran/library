<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <s:if test="%{null != resultBook}">
        <title>修改图书 - <s:property value="%{resultBook.title}"/></title>
    </s:if>
    <s:else><title>新建图书</title></s:else>
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
                    <s:if test="%{null != resultBook}">
                        action="<s:url action="editSubmit"/>"
                    </s:if>
                    <s:else>
                        action="<s:url action="createSubmit"/>"
                    </s:else>
                  class="form-horizontal" role="form">
                <s:if test="%{null != resultBook}">
                    <s:hidden name="isbn" value="%{resultBook.isbn}"/>
                    <div class="form-group">
                        <label for="isbnView" class="col-sm-2 control-label">ISBN</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="isbnView" disabled="disabled"
                                   value="<s:property value="%{resultBook.isbn}"/>">
                        </div>
                    </div>
                </s:if>
                <s:else>
                    <div class="form-group">
                        <label for="isbn" class="col-sm-2 control-label">ISBN</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="isbn" name="isbn" placeholder="9787000000000">
                        </div>
                    </div>
                </s:else>
                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="title" name="title"
                        <s:if test="%{null != resultBook}">
                               value="<s:property value="%{resultBook.title}"/>"
                        </s:if>
                               placeholder="活着">
                    </div>
                </div>
                <div class="form-group">
                    <label for="authorId" class="col-sm-2 control-label">作者</label>
                    <div class="col-sm-10">
                        <s:if test="%{null != resultBook}">
                            <s:set var="oAuthorId" value="%{resultBook.author.id}"/>
                        </s:if>
                        <s:else>
                            <s:set var="oAuthorId" value="%{1}"/>
                        </s:else>
                        <select class="form-control" id="authorId" name="authorId">
                            <s:iterator value="%{allAuthors}">
                                <option value="<s:property value="%{id}"/>"
                                        <s:if test="%{#oAuthorId == id}">selected="selected"</s:if>>
                                    <s:property value="%{name}"/>
                                </option>
                            </s:iterator>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="publisher" class="col-sm-2 control-label">出版社</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="publisher" name="publisher"
                        <s:if test="%{null != resultBook}">
                               value="<s:property value="%{resultBook.publisher}"/>"
                        </s:if>
                               placeholder="作家出版社">
                    </div>
                </div>
                <div class="form-group">
                    <label for="publishDate" class="col-sm-2 control-label">出版日期</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" id="publishDate" name="publishDate"
                        <s:if test="%{null != resultBook}">
                               value=
                                   "<s:date name="%{resultBook.publishDate}" format="yyyy-MM-dd"/>"
                        </s:if>>
                    </div>
                </div>
                <div class="form-group">
                    <label for="price" class="col-sm-2 control-label">价格</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="price" name="price"
                        <s:if test="%{null != resultBook}">
                               value="<s:property value="%{resultBook.price}"/>"
                        </s:if>
                               placeholder="20.0">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button"
                                <s:if test="%{null != resultBook}">
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
