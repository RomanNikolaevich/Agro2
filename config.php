<?php

class Core {
    static $SKIN       = 'default'; //можно пробелами выравнивать в столбик, без табов!
    static $CONT       = 'modules';
    static $DB_HOST    = 'localhost';
    static $DB_LOGIN   = 'roman';
    static $DB_PASS    = 'yAjD8lu4SHe';
    static $DB_NAME    = 'roman';
    static $DOMAIN     = 'http://agro2.ua:8081/';
    //static $DOMAIN     = 'https://roman.school-php.com/';
    static $JS         = array();
    static $CSS        = array();
    static $META       = array(
        'title' => 'AGRO.UNITED',
        'description' => 'd',
        'keywords' => 'k'
        );
}

//права доступа
const BLOCKED = 'Blocked';
const NEWUSER = 'NewUser';
const REGULAR = 'Regular';
const ADMIN = 'Admin';
const SUPER_ADMIN = 'SuperAdmin';

//путь для загрузки изображений
const IMG_MINI = './uploaded/mini/'; //уменьшенный размер для аватарок
const IMG_GOODS = './uploaded/goods/'; // в большем размере для товаров
const IMG_BOOKS = './uploaded/books/'; // в большем размере для книг
