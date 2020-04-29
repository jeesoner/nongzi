var integralModule = angular.module("adminMainApp", []);
integralModule.controller("adminMainCtrl", function ($http, $scope) {
    initBind($http, $scope);
});

function initBind($http, $scope) {
    $('#easyUILayoutBody').layout();

    $("#loginOut").on('click', function () {
        $.ajax({
            url: '/nongzi/admin/login',
            type: 'delete',
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result.status == '20001') {
                    location.href = "/nongzi" + "/admin/login";
                }
            }
        });
    })

}