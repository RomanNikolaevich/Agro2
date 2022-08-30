<!--Форма ввода отзывов:-->
<div class="container mt-4">
    <div class="row">
        <div class="form-group">
            <h2>ОТЗЫВЫ</h2>
            <h5>Если Вы остались довольны услугами <span>"AGRO.UNITED"</span> или вам что-то не понравилось,
                то можете оставить свой отзыв</h5>
            <?php if(isset($_SESSION['user'])) { ?>
                <!-- Start "Видимый блок отзывов для авторизированных пользователей" -->
                <?php if (!isset($_SESSION['commentOk'])) { ?>
                    <?php if (!empty($errors['comment'])): ?>
                        <span style="color:red" id="commentError"><?=$errors['comment']?></span><br>
                    <?php endif ?>
                    <form id="feedBack" method="post" >
                        <input type="hidden" name="login" id="login" placeholder="" value="<?= $_SESSION['user']['login'] ?>">
                        <textarea class="form-control" name="comment" id="comment"
                                  placeholder="Оставьте свой отзыв *"></textarea><br>
                        <p style="font-size:12px;">* - поле обязательное для заполнения</p>
                        <button class="btn btn-suc" name="do_signup" type="submit">Отправить</button>
                    </form>
                <?php } else {
                    unset($_SESSION['commentOk']); ?>
                    <div id="commentWasAdded">Спасибо за Ваш отзыв!</div>
                <?php } ?>
                <br>
                <!-- End "Видимый блок отзывов для авторизированных пользователей" -->
            <?php } else { ?>
                <span>Отзывы могут оставлять только зарегистрированные
                    пользователи.</span><br>
                <span>Для регистрации перейдите по ссылке: </span><a style=" text-decoration: none; color: red;"
                                                                     href="/auth/regin">Регистрация</a><br>
                <span>если вы уже зарегистрированы, то пройдите авторизацию:</span>
                <a style=" text-decoration: none; color: red;"
                   href="/auth/login">Авторизация</a><br>
            <?php } ?>
        </div>
    </div>
</div>

<script>
/*
    window.onload = function () {
        document.getElementById('feedBack').onsubmit = myAjaxComments; //вызов функции myAjax при клике на div
    }
*/






/*    // Using validation to check for the presence of an input
    $( "#feedBack" ).submit(function( event ) {
        // If .required's value's length is zero
        if ( $( ".comment" ).val().length === 0 ) {
            // Usually show some kind of error message here
            alert('Вы не заполнили поле комментариев!');
            // Prevent the form from submitting
            event.preventDefault();
        } else {
            // Run $.ajax() here
            let dataForm = $(this).serialize()
            $.ajax({
                url: './modules/comments/add.php',
                method: 'post',
                dataType: 'text',
                data: dataForm,
                success: function (data){
                    console.log(data);
                    //var = JSON.parse(data);
                    //console.log(var);
                }
        }
        }
    });*/







/*$(function(){
    $("#feedBack").on("submit", function () {
        let dataForm = $(this).serialize()
        $.ajax({
            url: './modules/comments/add.php',
            method: 'post',
            dataType: 'text',
            data: dataForm,
            success: function (data){
                console.log(data);
                //var = JSON.parse(data);
                //console.log(var);
            }
        });

    })
})*/
</script>
