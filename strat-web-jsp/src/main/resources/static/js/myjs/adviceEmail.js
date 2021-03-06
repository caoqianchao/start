var locat = (window.location + '').split('/');
$(function () {
    if ('advice' == locat[3]) {
        locat = locat[0] + '//' + locat[2];
    } else {
        locat = locat[0] + '//' + locat[2] + '/' + locat[3];
    }
});

$(top.hangge());
//发送
function sendEm() {

    if ($("#TYPE").val() == "1") {
        $("#CONTENT").val(getContentTxt());
    } else {
        $("#CONTENT").val(getContent());
    }
    if ($("#EMAIL").val() == "") {
        $("#EMAIL").tips({
            side: 3,
            msg: '请输入邮箱',
            bg: '#AE81FF',
            time: 2
        });
        $("#EMAIL").focus();
        return false;
    }
    if ($("#TITLE").val() == "") {
        $("#TITLE").tips({
            side: 3,
            msg: '请输入标题',
            bg: '#AE81FF',
            time: 2
        });
        $("#TITLE").focus();
        return false;
    }
    if ($("#CONTENT").val() == "") {

        $("#nr").tips({
            side: 1,
            msg: '请输入内容',
            bg: '#AE81FF',
            time: 3
        });
        return false;
    }

    $("#zhongxin").hide();
    $("#zhongxin2").show();

    var EMAIL = $("#EMAIL").val();
    var TYPE = $("#TYPE").val();
    var TITLE = $("#TITLE").val();
    var CONTENT = $("#CONTENT").val();

    var fmsg = "${pd.msg}";

    $.ajax({
        type: "POST",
        url: locat + '/advice/sendEmail.do?tm=' + new Date().getTime(),
        data: {EMAIL: EMAIL, TYPE: TYPE, TITLE: TITLE, CONTENT: CONTENT, fmsg: fmsg},
        dataType: 'json',
        cache: false,
        success: function (data) {
            $.each(data.list, function (i, list) {
                if (list.msg == 'ok') {
                    var count = list.count;
                    var ecount = list.ecount;
                    $("#msg").tips({
                        side: 3,
                        msg: '成功发出' + count + '条,失败' + ecount + '条',
                        bg: '#68B500',
                        time: 4
                    });
                    setTimeout("close()", 6000);
                } else {
                    $("#msg").tips({
                        side: 3,
                        msg: '邮件发送失败,请联系管理员检查邮件服务器配置是否正确!',
                        bg: '#FF0000',
                        time: 6
                    });
                    setTimeout("close()", 6000);
                }
            });
        }
    });

}
function setType(value) {
    $("#TYPE").val(value);
}
function close() {
    top.Dialog.close();
}

//打开编辑邮箱
function dialog_open() {
    $("#EMAILs").val($("#EMAIL").val());
    $("#dialog-add").css("display", "block");
}
//关闭编辑邮箱
function cancel_pl() {
    $("#dialog-add").css("display", "none");
}
//保存编辑邮箱
function saveEmail() {
    $("#EMAIL").val($("#EMAILs").val());
    $("#dialog-add").css("display", "none");
}

//ueditor纯文本
function getContentTxt() {
    var arr = [];
    arr.push(UE.getEditor('editor').getContentTxt());
    return arr.join("");
}
//ueditor有标签文本
function getContent() {
    var arr = [];
    arr.push(UE.getEditor('editor').getContent());
    return arr.join("");
}

setTimeout("ueditor()", 500);
function ueditor() {
    var ue = UE.getEditor('editor');
}
