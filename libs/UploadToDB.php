<?php
/*
class UploadToDB extends Uploader
{
    public int $id;
    public string $imageDB = 'users'; // BD_GOODS
//запись картинок в БД
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
    }
}*/
