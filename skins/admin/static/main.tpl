<h4 style="margin-left: 150px;">Главная страница</h4>
<?php if(isset($_SESSION['user']) && $_SESSION['user']['access']==2) { ?>
    <p style="margin-left: 50px;">
               Контент для тех кто с правами админа. Управлять контентом админы могут как непосредственно из админки
        так и непосредственно со страниц сайта.
    </p>
    <p style="margin-left: 50px;">
        Обычные пользователи кнопок управления сайтом не видят.
    </p>
    <p style="margin-left: 50px;">
        Админы могут модерировать пользователей повышая им права или блокировать их. Функционал удаления
        пользователяиз админки не предусмотрен. Так же админы могут модерировать раздел отзывывов, путем
        сокрытия или одобрения отзывов. Функция сокрытия предусмотрена на сокрытия от пользователей спама.
    </p>
<?php } ?>
