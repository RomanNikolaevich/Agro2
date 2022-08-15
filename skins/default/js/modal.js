//модальное окно:
const openPopUpLogin = document.getElementById('open_pop_up_login');
const openPopUpRegin = document.getElementById('open_pop_up_regin');
const closePopUp = document.getElementById('pop_up_close');
const popUp = document.getElementById('pop_up');

/*отслеживаем нажатие на кнопку: + отмена перехода по ссылке*/
openPopUpLogin.addEventListener('click', function (e) {
    e.preventDefault();//отмена действия браузера по умолчанию
    popUp.classList.add('active'); //добавить класс
})

openPopUpRegin.addEventListener('click', function (event) {
    event.preventDefault();
    popUp.classList.add('active');
})

/*выполненение действия по закрытию модального окна*/
closePopUp.addEventListener('click', () => {
    popUp.classList.remove('active')//удалить класс
})
