function areYouSureDel() {
    var x = confirm('Вы уверены, что хотите удалить?');
    if(!x) {//пользователь отказался
        return false;
    }
}
//вызов функции: <a onclick="return areYouSureDel()">Удалить статью</a>
