function confirmEdit(){
    $("#modal-message").html("确认修改吗？");
    $("#modal").modal("show");
}

function confirmNew(){
    $("#modal-message").html("确认新建吗？");
    $("#modal").modal("show");
}

function formSubmit() {
    $("#form")[0].submit();
}