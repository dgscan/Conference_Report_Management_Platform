-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 03 Haz 2018, 22:01:16
-- Sunucu sürümü: 5.7.21
-- PHP Sürümü: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kys_db`
--
CREATE DATABASE IF NOT EXISTS `kys_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `kys_db`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `articletable`
--

DROP TABLE IF EXISTS `articletable`;
CREATE TABLE IF NOT EXISTS `articletable` (
  `articleID` int(15) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) NOT NULL,
  `title` longtext NOT NULL,
  `article` longtext NOT NULL,
  `authors` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `summary` longtext NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `avgScore` int(11) DEFAULT NULL,
  `decision` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`articleID`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `articletable`
--

INSERT INTO `articletable` (`articleID`, `email`, `title`, `article`, `authors`, `contact`, `summary`, `keywords`, `subject`, `avgScore`, `decision`) VALUES
(1, 'dousy25@gmail.com', 'Programlama Makalesi', 'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960\'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.\r\nNeden Kullanırız?\r\n\r\nYinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli \'buraya metin gelecek, buraya metin gelecek\' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında \'lorem ipsum\' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.\r\n\r\nNereden Gelir?\r\n\r\nYaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır. Virginia\'daki Hampden-Sydney College\'dan Latince profesörü Richard McClintock, bir Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri olan \'consectetur\' sözcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır. Lorm Ipsum, Çiçero tarafından M.Ö. 45 tarihinde kaleme alınan \"de Finibus Bonorum et Malorum\" (İyi ve Kötünün Uç Sınırları) eserinin 1.10.32 ve 1.10.33 sayılı bölümlerinden gelmektedir. Bu kitap, ahlak kuramı üzerine bir tezdir ve Rönesans döneminde çok popüler olmuştur. Lorem Ipsum pasajının ilk satırı olan \"Lorem ipsum dolor sit amet\" 1.10.32 sayılı bölümdeki bir satırdan gelmektedir.\r\n\r\n1500\'lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.\r\n', 'Doguscan Yaginli, Dila Yaginli', 'dousy25@gmail.com, dila@gmail.com', 'Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli \'buraya metin gelecek, buraya metin gelecek\' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında \'lorem ipsum\' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.', 'cpu, pc, java, programlama', 'programlama', 3, 'Approve'),
(2, 'ozgun@gmail.com', 'Programlama 2. Makalesi', 'Nereden Gelir?\r\n\r\nYaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır. Virginia\'daki Hampden-Sydney College\'dan Latince profesörü Richard McClintock, bir Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri olan \'consectetur\' sözcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır. Lorm Ipsum, Çiçero tarafından M.Ö. 45 tarihinde kaleme alınan \"de Finibus Bonorum et Malorum\" (İyi ve Kötünün Uç Sınırları) eserinin 1.10.32 ve 1.10.33 sayılı bölümlerinden gelmektedir. Bu kitap, ahlak kuramı üzerine bir tezdir ve Rönesans döneminde çok popüler olmuştur. Lorem Ipsum pasajının ilk satırı olan \"Lorem ipsum dolor sit amet\" 1.10.32 sayılı bölümdeki bir satırdan gelmektedir.\r\n\r\n1500\'lerden beri kullanılmakta olan standard Lorem Ipsum metinleri ilgilenenler için yeniden üretilmiştir. Çiçero tarafından yazılan 1.10.32 ve 1.10.33 bölümleri de 1914 H. Rackham çevirisinden alınan İngilizce sürümleri eşliğinde özgün biçiminden yeniden üretilmiştir.\r\nNereden Bulabilirim?\r\n\r\nLorem Ipsum pasajlarının birçok çeşitlemesi vardır. Ancak bunların büyük bir çoğunluğu mizah katılarak veya rastgele sözcükler eklenerek değiştirilmişlerdir. Eğer bir Lorem Ipsum pasajı kullanacaksanız, metin aralarına utandırıcı sözcükler gizlenmediğinden emin olmanız gerekir. İnternet\'teki tüm Lorem Ipsum üreteçleri önceden belirlenmiş metin bloklarını yineler. Bu da, bu üreteci İnternet üzerindeki gerçek Lorem Ipsum üreteci yapar. Bu üreteç, 200\'den fazla Latince sözcük ve onlara ait cümle yapılarını içeren bir sözlük kullanır. Bu nedenle, üretilen Lorem Ipsum metinleri yinelemelerden, mizahtan ve karakteristik olmayan sözcüklerden uzaktı', 'Ozgun Aydin', 'ozgun@gmail.com', 'Lorem Ipsum pasajlarının birçok çeşitlemesi vardır. Ancak bunların büyük bir çoğunluğu mizah katılarak veya rastgele sözcükler eklenerek değiştirilmişlerdir. Eğer bir Lorem Ipsum pasajı kullanacaksanız, metin aralarına utandırıcı sözcükler gizlenmediğinden emin olmanız gerekir. İnternet\'teki tüm Lorem Ipsum üreteçleri önceden belirlenmiş metin bloklarını yineler. Bu da, bu üreteci İnternet üzerindeki gerçek Lorem Ipsum üreteci yapar. Bu üreteç, 200\'den fazla Latince sözcük ve onlara ait cümle yapılarını içeren bir sözlük kullanır. Bu nedenle, üretilen Lorem Ipsum metinleri yinelemelerden, mizahtan ve karakteristik olmayan sözcüklerden uzaktı', 'programlama, c sharp', 'programlama', NULL, NULL),
(3, 'dila@gmail.com', 'Isletme Makalesi', 'Nereden Bulabilirim?\r\n\r\nLorem Ipsum pasajlarının birçok çeşitlemesi vardır. Ancak bunların büyük bir çoğunluğu mizah katılarak veya rastgele sözcükler eklenerek değiştirilmişlerdir. Eğer bir Lorem Ipsum pasajı kullanacaksanız, metin aralarına utandırıcı sözcükler gizlenmediğinden emin olmanız gerekir. İnternet\'teki tüm Lorem Ipsum üreteçleri önceden belirlenmiş metin bloklarını yineler. Bu da, bu üreteci İnternet üzerindeki gerçek Lorem Ipsum üreteci yapar. Bu üreteç, 200\'den fazla Latince sözcük ve onlara ait cümle yapılarını içeren bir sözlük kullanır. Bu nedenle, üretilen Lorem Ipsum metinleri yinelemelerden, mizahtan ve karakteristik olmayan sözcüklerden uzaktır.\r\n\r\n\r\nNeden Kullanırız?\r\n\r\nYinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli \'buraya metin gelecek, buraya metin gelecek\' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında \'lorem ipsum\' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.\r\n', 'Dila Yaginli', 'dila@gmail.com', 'Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli \'buraya metin gelecek, buraya metin gelecek\' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında \'lorem ipsum\' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.', 'isletme, makro, ekonomi', 'isletme', NULL, NULL),
(7, 'dousy25@gmail.com', 'Operators in Java', 'So, I’m experimenting with Scala because I want to write a parser, and the Scala Parsers API seems like a really good fit. After all, I can implement the parser in Scala and wrap it behind a Java interface, so apart from an additional runtime dependency, there shouldn’t be any interoperability issues.\n\nAfter a few days of getting really really used to the awesomeness of Scala syntax, here are the top 10 things I’m missing the most when going back to writing Java:\n1. Multiline strings\n\nThat is my personal favourite, and a really awesome feature that should be in any language. Even PHP has it: Multiline strings. As easy as writing:\n2. Semicolons\n\nI sincerely haven’t missed them one bit. The way I structure code (and probably the way most people structure code), Scala seems not to need semicolons at all. In JavaScript, I wouldn’t say the same thing. The interpreted and non-typesafe nature of JavaScript seems to indicate that leaving away optional syntax elements is a guarantee to shoot yourself in the foot. But not with Scala.\n\nThis is probably due to Scala’s type safety, which would make the compiler complain in one of those rare ambiguous situations, but that’s just an educated guess.\n3. Parentheses\n\nThis is a minefield and leaving away parentheses seems dangerous in many cases. In fact, you can also leave away the dots when calling a method:\n4. Type inference\n\nThis one is really annoying in Java, and it seems that many other languages have gotten it right, in the meantime. Java only has limited type inference capabilities, and things aren’t as bright as they could be.\n5. Case classes\n\n    I think I’d fancy writing another POJO with 40 attributes, constructors, getters, setters, equals, hashCode, and toString\n\n    — Said no one. Ever\n\nScala has case classes. Simple immutable pojos written in one-liners. Take the Person case class for instance:', 'Doguscan Yaginli', 'dousy25@gmail.com', 'After a few days of getting really really used to the awesomeness of Scala syntax, here are the top 10 things I’m missing the most when going back to writing Java:\n1. Multiline strings\n\nThat is my personal favourite, and a really awesome feature that should be in any language. Even PHP has it: Multiline strings. As easy as writing:\n2. Semicolons\nThis is probably due to Scala’s type safety, which would make the compiler complain in one of those rare ambiguous situations, but that’s just an educated guess.', 'java, computer, programming', 'programlama', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `article_reviewer`
--

DROP TABLE IF EXISTS `article_reviewer`;
CREATE TABLE IF NOT EXISTS `article_reviewer` (
  `articleReviewID` int(11) NOT NULL AUTO_INCREMENT,
  `articleID` int(11) NOT NULL,
  `reviewer1ID` varchar(20) NOT NULL,
  `reviewer2ID` varchar(20) NOT NULL,
  `reviewer3ID` varchar(20) NOT NULL,
  PRIMARY KEY (`articleReviewID`),
  UNIQUE KEY `articleID` (`articleID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `article_reviewer`
--

INSERT INTO `article_reviewer` (`articleReviewID`, `articleID`, `reviewer1ID`, `reviewer2ID`, `reviewer3ID`) VALUES
(9, 3, 'ihsan@gmail.com', 'ersin@gmail.com', 'mert@gmail.com'),
(7, 1, 'geylani@gmail.com', 'okyay@gmail.com', 'nihan@gmail.com'),
(8, 2, 'okyay@gmail.com', 'nergiz@gmail.com', 'serhat@gmail.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE IF NOT EXISTS `score` (
  `articleID` int(15) NOT NULL,
  `reviewerID` varchar(20) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`articleID`,`reviewerID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `score`
--

INSERT INTO `score` (`articleID`, `reviewerID`, `score`) VALUES
(3, 'mert@gmail.com', 5),
(3, 'ersin@gmail.com', 3),
(3, 'ihsan@gmail.com', 1),
(1, 'okyay@gmail.com', 3),
(2, 'okyay@gmail.com', 5),
(1, 'geylani@gmail.com', 3),
(1, 'nihan@gmail.com', 5),
(2, 'nergiz@gmail.com', 2),
(2, 'serhat@gmail.com', 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `email` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `type` varchar(10) NOT NULL,
  `university` varchar(50) NOT NULL,
  `reviewSubject` varchar(30) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`email`, `name`, `surname`, `password`, `type`, `university`, `reviewSubject`) VALUES
('dousy25@gmail.com', 'doguscan', 'yaginli', '12345', 'Yazar', 'ege universitesi', ''),
('dila@gmail.com', 'dila', 'yaginli', '1234', 'Yazar', 'yasar universitesi', ''),
('ihsan@gmail.com', 'ihsan', 'yaginli', '1234', 'Hakem', 'anadolu universitesi', 'isletme'),
('nesrin@gmail.com', 'nesrin', 'yaginli', '1234', 'Hakem', 'deu', 'ekonomi'),
('fahriye@gmail.com', 'fahriye', 'duzagac', '1234', 'Hakem', 'texas university', 'stem cell'),
('ummu@gmail.com', 'ummu', 'guven', '1234', 'Hakem', 'texas university', 'biology'),
('eda@gmail.com', 'eda', 'acikgoz', '1234', 'Yazar', 'ege university', ''),
('geylani@gmail.com', 'geylani', 'kardas', '1234', 'Hakem', 'ege university', 'programlama'),
('ilker@gmail.com', 'ilker', 'kocabas', '1234', 'Hakem', 'ege university', 'database'),
('ersin@gmail.com', 'ersin', 'satici', '1234', 'Hakem', 'Yasar Universitesi', 'isletme'),
('OKB', 'OKB', 'OKB', 'okb1', 'admin', '', ''),
('barkin@gmail.com', 'barkin', 'yildirim', '4321', 'Hakem', 'Anadolu Universitesi', 'isletme'),
('zulfi@gmail.com', 'zulfikar', 'akmermer', '1235', 'Hakem', 'Elazig Unviersitesi', 'isletme'),
('ozgun@gmail.com', 'ozgun', 'aydin', '5678', 'Hakem', 'Bilkent Universitesi', 'programlama'),
('okyay@gmail.com', 'okyay', 'say', '1', 'Hakem', 'Bilkent Universitesi', 'programlama'),
('nihan@gmail.com', 'nihan', 'arslan', '1235', 'Hakem', 'Elazig Universitesi', 'programlama'),
('nergiz@gmail.com', 'nergiz', 'kilic', '8524', 'Hakem', 'Bilkent Universitesi', 'programlama'),
('serhat@gmail.com', 'serhat mehmet', 'azgur', '7532', 'Hakem', 'Bilkent Universitesi', 'programlama'),
('engin@gmail.com', 'engin', 'kiracbedel', '9512', 'Hakem', 'Bilkent Unviersitesi', 'programlama'),
('mert@gmail.com', 'mert', 'topoyan', '5246', 'Hakem', 'Dokuz Eylul Universitesi', 'isletme'),
('volkan@gmail.com', 'volkan', 'cosgun', '4567', 'Hakem', 'Uludag Universitesi', 'isletme'),
('caglar@gmail.com', 'caglar', 'cakir', '1236', 'Hakem', 'Yasar Universitesi', 'isletme'),
('doguscan', 'dogus', 'can', '1', 'Yazar', 'ege', ''),
('dogus', 'dogus', 'can', '1', 'Hakem', 'ege', 'programlama');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
