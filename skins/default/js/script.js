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
function myAjaxComments() {
    var login = document.getElementById('login').value;
    var comment = document.getElementById('comment').value;
    var l = document.getElementById('comment').value.length;
    if(l < 10) {
        alert('Вы не заполнили поле, минимум 10 символов! Вы ввели только'+l);
        return false; //запрос поиска не выполнится
    }
    $.ajax({
        url: '/comments/add',
        type: "POST",
        dataType: 'text',
        cache: false,
        data: {
            login: login,
            comment: comment
        },
        success: function (msg) {
            var response = JSON.parse(msg);
            if (response.status == 'ok') {
                document.getElementById('addedComment').hidden = false;//отмена сокрытия блока
                document.getElementById('addedCommentLogin').innerHTML = response.login + '<br>';
                document.getElementById('addedCommentText').innerHTML = response.comment + '<hr>';
                document.getElementById("comment").value = '';//очищаем поле ввода отзывов
            }
        },
    });

    document.getElementById('allComments').innerHTML =
        document.getElementById('addedComment').innerHTML + document.getElementById('allComments').innerHTML;
}

//});
//})(jQuery);
