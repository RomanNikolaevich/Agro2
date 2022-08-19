//модальное окно для авторизации:
const openModalAuth = document.getElementById('modal_authorization_open');//login //ссылка из шапки
const modalAuth = document.getElementById('modal_login');
const closeModalAuth = document.getElementById('modal_authorization_close');

//модальное окно для регистрации:
const openModalRegin = document.getElementById('modal_registration_open'); //regin
const modalRegin = document.getElementById('modal_regin');
const closeModalRegin = document.getElementById('modal_registration_close');

    /*отслеживаем нажатие на кнопку: + отмена перехода по ссылке*/
    openModalAuth.addEventListener('click', function (e) {
        e.preventDefault();//отмена действия браузера по умолчанию
        modalAuth.classList.add('active'); //добавить класс
    })

    /*выполненение действия по закрытию модального окна*/
    closeModalAuth.addEventListener('click', () => {
        modalAuth.classList.remove('active')//удалить класс
    })

    /*отслеживаем нажатие на кнопку: + отмена перехода по ссылке*/
    openModalRegin.addEventListener('click', function (e) {
        e.preventDefault();
        modalRegin.classList.add('active');
    })

    /*выполненение действия по закрытию модального окна*/
    closeModalRegin.addEventListener('click', () => {
        modalRegin.classList.remove('active')
    })
