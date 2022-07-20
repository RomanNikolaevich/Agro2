<?php

class Uploader
{
    //public int $sizeWidth; //максимальная ширина
    //public int $sizeHeight; //максимальная высота
    //public string $imageDB = 'users'; // BD_GOODS
    //public int $id;
    public string $filePath='./uploaded/goods/'; //= IMG_MINI; //IMG_GOODS;
    public string $error;
    private string $imgType;
    public string $name;

    public function uploadFile($file): void
    {
        $array = ['image/gif', 'image/jpeg', 'image/png'];
        $array2 = ['jpg', 'jpeg', 'gif', 'png'];

        if ($file['error'] == 0) {
            //wtf($_FILES['file']);
            if ($file['size'] < 5000 || $file['size'] > 50000000) {
                $error = 'Размер изображения нам не подходит';
            } else {
                preg_match('#\.([a-z]+)$#iu', $file['name'], $matches);
                if (isset($matches[1])) {
                    $matches[1] = mb_strtolower($matches[1]);
                    $temp = getimagesize($_FILES['file']['tmp_name']);
                    //echo 111;
                    //exit();
                    if (!in_array($matches[1], $array2)) {
                        $error = 'Не подходит расширение изображения';
                    } elseif (!in_array($temp['mime'], $array)) {
                        $error = 'Не подходит тип файла, можно загружать только изображения';
                    } else {
                        //echo 1;
                        //exit();
                        if ($temp['mime'] == 'image/jpeg') {
                            $this->imgType = 'jpeg';
                        } elseif ($temp['mime'] == 'image/png') {
                            $this->imgType = 'png';
                        } elseif ($temp['mime'] == 'image/gif') {
                            $this->imgType = 'gif';
                        }
                        //echo 2;
                        //exit();
                        $this->name = date('Ymd-His') . 'img' . rand(10000, 99999) . '.' . $this->imgType;
                        //$pattern = '#^.{10}(.+)#ui';
                        //preg_match($pattern, $name, $matches2);
                        //wtf($matches2[1]); //[1] => 20220705-164551img16546.jpeg
                        //echo 3;
                        //wtf($this->name);
                        //exit();
                        if ($temp[1] / $temp[0] < 0.4 || $temp[0] / $temp[1] < 0.4) {
                            $error = 'не подходящая пропорция - выберите другое изображение';
                        } else {
                            //echo 4;
                            if (!move_uploaded_file($_FILES['file']['tmp_name'], $this->filePath . $this->name)) {
                                //echo 5;
                                $error = 'Изображение еще не загружено! Ошибка';
                                //exit();
                            } else {
                                //echo 6;
                                $error = 'Изображение загружено верно';
                                //exit();
                            }
                            //echo 7;
                            //exit();
                        }
                        //echo 8;
                        exit();
                    }
                } else {
                    $error = 'Данный файл не являетися картинкой. Принимаемые типы файлов: jpg, png, gif';
                }
            }
        }
    }


//изменение размера изображения:
    public function resize($sizeWidth, $sizeHeight): void
    {
        //изменяем размер изображения:
        // Создаём исходное изображение (тип GdImage) на основе исходного файла
        if ($this->imgType == 'jpeg') {
            $img = imagecreatefromjpeg($this->filePath . $this->name);
        } elseif ($this->imgType == 'png') {
            $img = imagecreatefrompng($this->filePath . $this->name);
        } elseif ($this->imgType == 'gif') {
            $img = imagecreatefromgif($this->filePath . $this->name);
        }
        // Определяем ширину и высоту изображения
        $imgWidth = imageSX($img); // ширина
        $imgHeight = imageSY($img); //высота

        if ($imgWidth > $imgHeight) {
            $k = (int)round($imgWidth / $sizeWidth, 3);
            $newImgWidth = $sizeWidth;
            $newImgHeigth = $imgHeight / $k;
        } else {
            $k = (int)round($imgHeight / $sizeHeight, 3);
            $newImgHeigth = $sizeHeight;
            $newImgWidth = $imgWidth / $k;
        }

        // Создаём пустую картинку
        $newImg = imagecreatetruecolor((int)$newImgWidth, (int)$newImgHeigth);

        //Задание режима сопряжения цветов для изображения
        imagealphablending($newImg, false);
        //устанавливает флаг, определяющий, будет ли сохраняться полная информация альфа-канала
        // (в противовес одноцветной прозрачности) и сохраняет PNG изображение
        imagesavealpha($newImg, true);
        //Создание цвета для изображения + alpha (уровень прозрачности)
        $transparent = imagecolorallocatealpha($newImg, 255, 255, 255, 127);
        //Рисование закрашенного прямоугольника
        imagefilledrectangle($newImg, 0, 0, $imgWidth, $imgHeight, $transparent);

        // Копируем старое изображение в новое с изменением параметров
        (int)imagecopyresampled($newImg, $img, 0, 0, 0, 0,
            (int)$newImgWidth, (int)$newImgHeigth, (int)$imgWidth, (int)$imgHeight);

        // Вывод картинки
        if ($this->imgType == 'jpeg') {
            imagejpeg($newImg, $this->filePath . $this->name, 100);
        } elseif ($this->imgType == 'png') {
            imagepng($newImg, $this->filePath . $this->name, 100);
        } elseif ($this->imgType == 'gif') {
            imagegif($newImg, $this->filePath . $this->name);
        }
        //Очистка памяти
        imagedestroy($newImg);
        imagedestroy($img);
    }

/*//запись картинок в БД
    public function uploadToDB($id): void
    {
        $name=$this->name;
        if ($this->imageDB == 'users') {
            q("
        UPDATE `users` SET
        `img`       = '" . mres($name) . "'
        WHERE `id`    = " . $id . "
    ");
        } elseif ($this->imageDB == 'news') {
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
    }*/
}
