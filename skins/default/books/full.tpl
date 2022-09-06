<div style="padding:10px">
    <div style="padding:10px">
        <h4>Заголовок книги: <?=htmlspecialchars($row['name'] ?? '');?></h4>
    </div>
    <div style="padding:10px;">
        <img src="/uploaded/books/<?=htmlspecialchars($row['img'] ?? '');?>"
             alt="Card image cap" style="width:350px; float:left;">
    </div>
    <div style="padding:10px;">
        <p><b>Авторы: </b><br><?=htmlspecialchars(booksShowAuthor ((int)$_GET['id']) ?? '');?></p>
    </div>

    <div style="padding:10px">
        <p><b>Количество страниц: </b><?=htmlspecialchars($row['page'] ?? '');?></p>
    </div>
    <div style="padding:10px">
        <p><b>Год издания: </b><?=htmlspecialchars($row['year'] ?? '');?>г.</p>
    </div>
    <div style="padding:10px">
        <p><b>Цена: </b><?=htmlspecialchars($row['price'] ?? '');?> грн.</p>
    </div>
    <div style="padding:10px">
        <p><b>Описание книги: </b><?=htmlspecialchars($row['text'] ?? '');?></p>
    </div>
    <div style="padding-bottom:30px">
        <a class="btn btn-info" href="/books/">К списку книг</a>
    </div>
</div>
