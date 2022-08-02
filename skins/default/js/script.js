//Функция оповещения с подтверждением удаления
//вызов функции: <a onclick="return areYouSureDel()">Удалить статью</a>
function areYouSureDel() {
    var x = confirm('Вы уверены, что хотите удалить?');
    if(!x) {//пользователь отказался
        return false;
    }
}

//Функция сокрытие/отображение блока
//вызов функции: <div style="font-size:16px;" onclick="hideShow(yyy)">НАЖМИ НА МЕНЯ</div>
function hideShow(id) {
    var x = document.getElementById(id);
    if(x.style.display == 'block') {
        x.style.display = 'none';
    } else {
        x.style.display = 'block';
    }
}
