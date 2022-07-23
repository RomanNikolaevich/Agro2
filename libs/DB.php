<?php
/*
ALIAS:
q(); Запрос
mres(); mysqli_real_escape_string

РАБОТА С ОБЪЕКТОМ ВЫБОРКИ
$res = q(); // Запрос с возвратом результата
$res->num_rows; // Количество возвращенных строк - mysqli_num_rows();
$res->fetch_assoc(); // достаём запись - mysqli_fetch_assoc();
$res->close(); // Очищаем результат выборки

РАБОТА С ПОДКЛЮЧЕННОЙ MYSQL
DB::_()->affected_rows; // Количество изменённых записей
DB::_()->insert_id; // Последний ID вставки
DB::_()->real_escape_string(); // аналог mres();
DB::_()->query(); // аналог q
DB::_()->multi_ query(); // Множественные запросы

DB::close(); // Закрываем соединение с БД
*/

class DB
{
    static public array $mysqli = array();
    static public array $connect = array();
    static public string $error;

    static public function _($key = 0) {
        if(!isset(self::$mysqli[$key])) {
            if(!isset(self::$connect['server']))
                self::$connect['server'] = Core::$DB_HOST;
            if(!isset(self::$connect['user']))
                self::$connect['user'] = Core::$DB_LOGIN;
            if(!isset(self::$connect['pass']))
                self::$connect['pass'] = Core::$DB_PASS;
            if(!isset(self::$connect['db']))
                self::$connect['db'] = Core::$DB_NAME;

            self::$mysqli[$key] = @new mysqli(self::$connect['server'],self::$connect['user'],self::$connect['pass'],self::$connect['db']); // WARNING
            if (mysqli_connect_errno()) {
                self::$error = 'Не удалось подключиться к Базе Данных';
                exit;
            }
            if(!self::$mysqli[$key]->set_charset("utf8")) {
                self::$error = 'Ошибка при загрузке набора символов utf8:'.self::$mysqli[$key]->error;
                exit;
            }
        }
        return self::$mysqli[$key];
    }
    static public function close($key = 0) {
        self::$mysqli[$key]->close();
        unset(self::$mysqli[$key]);
    }
}
