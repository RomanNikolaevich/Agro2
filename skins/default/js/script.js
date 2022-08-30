//Функция оповещения с подтверждением удаления
//вызов функции: <a onclick="return areYouSureDel()">Удалить статью</a>
function areYouSureDel() {
    let x = confirm('Вы уверены, что хотите удалить?');
    if (!x) {//пользователь отказался
        return false;
    }
}

//Функция сокрытие/отображение блока
//вызов функции: <div style="font-size:16px;" onclick="hideShow('yyy')">НАЖМИ НА МЕНЯ</div>
function hideShow(id) {
    let x = document.getElementById(id);
    if (x.style.display == 'block') {
        x.style.display = 'none';
    } else {
        x.style.display = 'block';
    }
}

/*function checkLength(id, errorId) {
    let length = document.getElementById(id).value.length;
    if (length < 3) {
        document.getElementById(errorId).innerHTML = 'минимум 3 символа. Вы ввели: ' + length;
        return false;
    } else {
        document.getElementById(errorId).innerHTML = '';
        return true;
    }
}*/

//;(function($, undefined){
//$(function(){
/*    function myAjaxComments() {
        var comment = $('#comment').value;//document.getElementById('comment').value;
        //alert(comment);
        var login = $('#login').value;//document.getElementById('login').value;
        //alert(login);
        $.ajax({
            url: '/comments/add',
            type: "POST",
            cache: false,
            dataType: "json",
            data: {login: login, comment: comment},
            success: function (msg) {
                var commentJson = JSON.parse(msg);
                $('#login').attr("value", "");
                $('#comment').attr("value", "");
                //alert(commentJson);
                //document.getElementById('commentWasAdded').style.display = 'block';
                //document.getElementById('addedCommentLoginAndDate').innerHTML = commentJson.login + '<br>';
                //document.getElementById('addedCommentText').innerHTML = commentJson.comment + '<hr>';
            },
        });

        //$('#allComments').innerHTML = $('#addedComment').innerHTML + $('#allComments').innerHTML;
    }*/
//});
//})(jQuery);
