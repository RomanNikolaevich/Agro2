<?php

class class_Uploader
{
    public static int $size = 100; //450
    public static string $file_path = './uploaded/mini/'; //'./uploaded/goods/';
    public static string $imageDB = 'goods'; //'users';
    public static int $id = 0;
    public static string $type ='';
    public $name;

        static function uploadFile($file_path, $imageDB, $id)
    {
        $array = ['image/gif', 'image/jpeg', 'image/png'];
        $array2 = ['jpg', 'jpeg', 'gif', 'png'];

        if (isset($_POST['submit'])) {
            if ($_FILES['file']['error'] == 0) {
                //wtf($_FILES['file']);
                if ($_FILES['file']['size'] < 5000 || $_FILES['file']['size'] > 50000000) {
                    $_SESSION['info'] = 'Размер изображения нам не подходит';
                } else {
                    preg_match('#\.([a-z]+)$#iu', $_FILES['file']['name'], $matches);
                    if (isset($matches[1])) {
                        $matches[1] = mb_strtolower($matches[1]);
                        $temp = getimagesize($_FILES['file']['tmp_name']);
                        if (!in_array($matches[1], $array2)) {
                            $_SESSION['info'] = 'Не подходит расширение изображения';
                        } elseif (!in_array($temp['mime'], $array)) {
                            $_SESSION['info'] = 'Не подходит тип файла, можно загружать только изображения';
                        } else {
                            if ($temp['mime'] == 'image/jpeg') {
                                $type = 'jpeg';
                            } elseif ($temp['mime'] == 'image/png') {
                                $type = 'png';
                            } elseif ($temp['mime'] == 'image/gif') {
                                $type = 'gif';
                            }
                            $name = date('Ymd-His') . 'img' . rand(10000, 99999) . '.' . $type;
                            //$pattern = '#^.{10}(.+)#ui';
                            //preg_match($pattern, $name, $matches2);
                            //wtf($matches2[1]); //[1] => 20220705-164551img16546.jpeg
                            //exit();
                            if ($temp[1] / $temp[0] < 0.4 || $temp[0] / $temp[1] < 0.4) {
                                $_SESSION['info'] = 'не подходящая пропорция - выберите другое изображение';
                            } else {
                                if (!move_uploaded_file($_FILES['file']['tmp_name'], $file_path . $name)) {
                                    $_SESSION['info'] = 'Изображение еще не загружено! Ошибка';
                                } else {
                                    $_SESSION['info'] = 'Изображение загружено верно';

                                    //загрузка в базу картинки
                                    //uploadToDB($name, $imageDB, $id);
                                }
                            }

                        }

                    } else {
                        echo 'Данный файл не являетися картинкой. Принимаемые типы файлов: jpg, png, gif';
                    }
                }
            }
        }
    }

//изменение размера изображения:
    public static function resize($file_path, $name, $size, $type)
    {
        //изменяем размер изображения:
        // Cоздаём исходное изображение (тип GdImage) на основе исходного файла
        if ($type == 'jpeg') {
            $img = imagecreatefromjpeg($file_path . self::$name);
        } elseif ($type == 'png') {
            $img = imagecreatefrompng($file_path . self::$name);
        } elseif ($type == 'gif') {
            $img = imagecreatefromgif($file_path . self::$name);
        }
        // Определяем ширину и высоту изображения
        $img_width = imageSX($img); // ширина
        $img_height = imageSY($img); //высота

        if ($img_width > $img_height) {
            $k = (int)round($img_width / $size, 3);
            $new_img_width = $size;
            $new_img_heigth = $img_height / $k;
        } else {
            $k = (int)round($img_height / $size, 3);
            $new_img_heigth = $size;
            $new_img_width = $img_width / $k;
        }

        // Создаём пустую картинку
        $new_img = imagecreatetruecolor((int)$new_img_width, (int)$new_img_heigth);
        // Копируем старое изображение в новое с изменением параметров
        $res = (int)imagecopyresampled($new_img, $img, 0, 0, 0, 0,
            (int)$new_img_width, (int)$new_img_heigth, $img_width, $img_height);

        // Вывод картинки
        if ($type == 'jpeg') {
            $res = imagejpeg($new_img, $file_path . $name, 100);
        } elseif ($type == 'png') {
            $res = imagepng($new_img, $file_path . $name, 100);
        } elseif ($type == 'gif') {
            $res = imagegif($new_img, $file_path . $name);
        }
        //Очистка памяти
        imagedestroy($new_img);
        imagedestroy($img);
}

//запись картинок в БД
    static function uploadToDB($name, $imageDB, $id)
    {
        if ($imageDB == 'users') {
            q("
        UPDATE `users` SET
        `img`       = '" . mres($name) . "'
        WHERE `id`    = " . $id . "
    ");
        } elseif ($imageDB == 'news') {
            q("
        UPDATE `news` SET
        `img`       = '" . mres($name) . "'
        WHERE `id`    = " . $id . "
    ");
        } else {
            q("
        UPDATE `goods` SET
        `img`       = '" . mres($name) . "'
        WHERE `id`    = " . $id . "
    ");
        }
    }

}
