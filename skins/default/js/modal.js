//модальное окно для авторизации:
const openModalAuth = document.getElementById('modal_authorization_open');//login //ссылка из шапки
const modalAuth = document.getElementById('modal_login');
const closeModalAuth = document.getElementById('modal_authorization_close');

//модальное окно для регистрации:
const openModalRegin = document.getElementById('modal_registration_open'); //regin
const modalRegin = document.getElementById('modal_regin');
const closeModalRegin = document.getElementById('modal_registration_close');

//модальное окно для авторизации:
/*отслеживаем нажатие на кнопку: + отмена перехода по ссылке*/
openModalAuth.addEventListener('click', function (e) {
    e.preventDefault();//отмена действия браузера по умолчанию
    modalAuth.classList.add('active'); //добавить класс
})

/*выполненение действия по закрытию модального окна*/
closeModalAuth.addEventListener('click', () => {
    modalAuth.classList.remove('active')//удалить класс
})

//модальное окно для регистрации:
openModalRegin.addEventListener('click', function (e) {
    e.preventDefault();
    modalRegin.classList.add('active');
})

closeModalRegin.addEventListener('click', () => {
    modalRegin.classList.remove('active')
})

function lengthCheckLogin() {
    let lengthLoginAuth = document.getElementById('login_auth').value.length;
    //alert(lengthLoginAuth);
    let lengthPasswordAuth = document.getElementById('password_auth').value.length;
    //alert(lengthPasswordAuth);

    if (lengthLoginAuth < 5) {
        alert('Вы не заполнили поле "Логин"! Минимум 5 символов! Вы ввели только' + lengthLoginAuth);
        return false; //запрос поиска не выполнится
    } else if (lengthPasswordAuth < 5) {
        alert('Вы не заполнили поле "Пароль"! Минимум 5 символов! Вы ввели только' + lengthPasswordAuth);
        return false;
    }
}

function lengthCheckRegin() {
    let lengthLoginReg = document.getElementById('login_reg').value.length;
    let lengthPasswordReg = document.getElementById('password_reg').value.length;

    if (lengthLoginReg < 5 || lengthPasswordReg < 5) {
        alert('Вы не заполнили поле "Логин"! Минимум 5 символов! Вы ввели только ' + lengthLoginReg);
        alert('Вы не заполнили поле "Пароль"! Минимум 5 символов! Вы ввели только ' + lengthPasswordReg);
        return false; //запрос поиска не выполнится
    } /*else if (lengthPasswordReg < 5) {
        alert('Вы не заполнили поле "Пароль"! Минимум 5 символов! Вы ввели только' + lengthPasswordReg);
        return false;
    }*/
}
