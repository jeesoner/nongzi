$(document).ready(function () {
    // 获取管理员的个人信息
    $.ajax({
        url: '/nongzi' + '/admin/info/profile/get',
        type: 'get',
        dataType: "json",
        success: function (result) {
            if (result.status == '10000') {
                $("#adId").val(result.data.adId);
                $("#adUsername").val(result.data.adUsername);
                $("#adPassword").val(result.data.adPassword);
                $("#roleIdT").val(result.data.roleId);
                if (result.data.roleId == 1) {
                    $("#roleId").val("超级管理员");
                } else if (result.data.roleId == 2) {
                    $("#roleId").val("普通管理员");
                } else {
                    $("#roleId").val("小角色");
                }
            }
        }
    });

    $("#changeAdminUser").on('click', function () {
        $.ajax({
            url: '/nongzi' + '/admin/info/profile',
            data: {
                "_method": "put",
                "adId": $("#adId").val(),
                "adUsername": $("#adUsername").val(),
                "adPassword": $("#adPassword").val(),
                "roleId": $("#roleIdT").val()
            },
            type: 'post',
            dataType: "json",
            success: function (result) {
                if (result.status == 10000) {
                    swal('修改成功', 'success');
                    $("#adUsername").val($("#adUsername").val());
                    $("#adPassword").val($("#adPassword").val());
                } else {
                    swal('修改失败', result.msg);
                }
            }
        });
    })


})