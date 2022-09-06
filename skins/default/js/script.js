//Функция оповещения с подтверждением удаления
//вызов функции: <a onclick="return areYouSureDel()">Удалить статью</a>
function areYouSureDel() {
    let contentDeleteConfirm = confirm('Вы уверены, что хотите удалить?');
    if (!contentDeleteConfirm) {//пользователь отказался
        return false;
    }
}

//Функция сокрытие/отображение блока
//вызов функции: <div style="font-size:16px;" onclick="hideShow('yyy')">НАЖМИ НА МЕНЯ</div>
function hideShow(id) {
    let hideShow = document.getElementById(id);
    if (hideShow.style.display == 'block') {
        hideShow.style.display = 'none';
    } else {
        x.style.display = 'block';
    }
}

function myAjaxComments() {
    var login = document.getElementById('login').value;
    var comment = document.getElementById('comment').value;
    var commentLengthInput = document.getElementById('comment').value.length;
    if(commentLengthInput > 0 && commentLengthInput < 10) {
        document.getElementById('commentError').innerHTML = 'Ваше сообщение слишком короткое, нужно минимум 10 символов! Вы ввели только  ' +commentLengthInput;
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
                document.getElementById('commentError').innerHTML = '';//очищаем ошибки
            } else {
                //console.log(response.errors);
                document.getElementById('commentError').innerHTML = response.errors.comment;//вывод ошибок из php

            }
        },
    });
}
