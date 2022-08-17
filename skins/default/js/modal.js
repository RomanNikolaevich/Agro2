//модальное окно - решение для id:
//const openPopUpLogin = document.getElementById('open_pop_up_login');
const openPopUp = document.getElementById('open_pop_up');
const closePopUp = document.getElementById('pop_up_close');
const popUp = document.getElementById('pop_up');

/*отслеживаем нажатие на кнопку: + отмена перехода по ссылке*/
/*openPopUpLogin.addEventListener('click', function (e) {
    e.preventDefault();//отмена действия браузера по умолчанию
    popUp.classList.add('active'); //добавить класс
})*/

openPopUp.addEventListener('click', function (e) {
    e.preventDefault();
    popUp.classList.add('active');
})

/*выполненение действия по закрытию модального окна*/
closePopUp.addEventListener('click', () => {
    popUp.classList.remove('active')//удалить класс
})
