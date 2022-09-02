<!--Форма ввода отзывов:-->


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
