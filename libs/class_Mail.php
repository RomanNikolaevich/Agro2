<?php

class class_Mail
{
	public static string $subject = 'Вы зарегистрировались на нашем сайте'; //по умолчанию
	public static string $from = 'roman.nikolaevich@gmail.com';
	public static string $to = 'qintrony@gmail.com';
	public static string $text = 'Шаблонное письмо';
	public static string $headers = '';

	public static function testSend()
	{
		if (mail(self::$to, 'english words', 'english words')) {
			echo 'Письмо отправилось';
		} else {
			echo 'Письмо не отправилось';
		}
		exit();
	}

	public static function send()
	{
		self::$subject = '=?utf-8?b?' . base64_encode(self::$subject) . '?=';//заголовок сообщения перекодированный
		// в base64, чтобы избежать проблем с кодировкой;
		self::$headers = "Content-type: text/html; charset=\"utf-8\"r\n";//тип письма и его кодировка, тип письма обычно
		// указывается html либо plain (текстовая версия);
		self::$headers .= "From: " . self::$from . "\r\n"; //имя и e-mail отправителя;
		self::$headers .= "MIME-Version: 1.0\r\n"; //версия MIME-стандарта;
		self::$headers .= "Date: " . date('D, d M Y h:i:s O') . "\r\n"; //дата отправки;
		self::$headers .= "Procedence: bulk\r\n";// этот заголовок необходим в случае массовой рассылки,
		// значение ставится bulk.

		return mail(self::$to, self::$subject, self::$text, self::$headers);
	}
}
