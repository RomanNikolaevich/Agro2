<?php

class Uploader
{
    //public int $sizeWidth; //максимальная ширина
    //public int $sizeHeight; //максимальная высота
    public string $filePath; //='./uploaded/goods/'; //= IMG_MINI; //IMG_GOODS;
    public string $error;
    private string $imgType;
    public string $name;

    public function uploadFile($file): bool
    {
        $array = ['image/gif', 'image/jpeg', 'image/png'];
        $array2 = ['jpg', 'jpeg', 'gif', 'png'];

        if ($file['error'] != 0) {//если есть ошибки
            $this->error = 'Файл не был загружен';
            return false;
        }

        if ($file['size'] < 5000 || $file['size'] > 50000000) {
            $this->error = 'Размер изображения нам не подходит' ;
            return false;
        }

        preg_match('#\.([a-z]+)$#iu', $file['name'], $matches);
        if (!isset($matches[1])) {
            return false;
        } else {
            $matches[1] = mb_strtolower($matches[1]);
            $temp = getimagesize($_FILES['file']['tmp_name']);
        }

        if (!in_array($matches[1], $array2)) {
            $this->error = 'Не подходит расширение изображения';
            return false;
        }

        if (!in_array($temp['mime'], $array)) {
            $this->error = 'Не подходит тип файла, можно загружать только изображения';
            return false;
        }

        if ($temp['mime'] == 'image/jpeg') {
            $this->imgType = 'jpeg';
        } elseif ($temp['mime'] == 'image/png') {
            $this->imgType = 'png';
        } elseif ($temp['mime'] == 'image/gif') {
            $this->imgType = 'gif';
        }

        $this->name = date('Ymd-His') . 'img' . rand(10000, 99999) . '.' . $this->imgType;

        if ($temp[1] / $temp[0] < 0.4 || $temp[0] / $temp[1] < 0.4) {
            $this->error = 'не подходящая пропорция - выберите другое изображение';
            return false;
        }

        if (!move_uploaded_file($_FILES['file']['tmp_name'], $this->filePath . $this->name)) {
            $this->error = 'Изображение еще не загружено! Ошибка';
            return false;
        } else {
            $this->error = 'Изображение загружено верно';
            return true;
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
}
