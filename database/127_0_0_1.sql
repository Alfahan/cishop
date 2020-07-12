-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jul 2020 pada 04.44
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `code_cishop`
--
CREATE DATABASE IF NOT EXISTS `code_cishop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `code_cishop`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(1, 'smartphones', 'Smartphones'),
(2, 'laptops', 'Laptops'),
(3, 'computers', 'Computers'),
(4, 'console', 'Console'),
(5, 'power-banks', 'Power Banks'),
(6, 'accessories', 'accessories');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(3, 3, '2020-07-11', '320200711131521', 13234000, 'Hakim', 'Karawang', '08993613408', 'delivered'),
(4, 7, '2020-07-11', '720200711200502', 6485000, 'Trisnandarr', 'Jl Taruno - Karawang', '08993613408', 'delivered'),
(5, 3, '2020-07-11', '320200711221021', 23500000, 'Hakim', 'Karawang', '08993613408', 'delivered');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `id_orders`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(1, 3, 'Hakim', '23019234', 13234000, '-', '320200711131521-20200711193055.jpg'),
(2, 4, 'Trisnandar', '837381912', 6485000, '-', '720200711200502-20200711200708.jpg'),
(3, 5, 'Hakim', '0928392391', 23500000, '-', '320200711221021-20200711221052.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(3, 3, 1, 1, 6485000),
(4, 3, 2, 1, 6749000),
(5, 4, 1, 1, 6485000),
(6, 5, 6, 1, 23500000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`) VALUES
(1, 2, 'laptop-asus-a409uj-br351t-br352t-core-i3-7020u-4gb-512gb-mx230-win10', 'LAPTOP Asus A409UJ-BR351T/BR352T Core i3-7020U-4GB-512GB-MX230 WIN10', 'Deskripsi LAPTOP Asus A409UJ-BR351T/BR352T Core i3-7020U-4GB-512GB-MX230 WIN10\r\n\r\nLAPTOP A409UJ-BV351T  SILVER\r\nLAPTOP A409UJ-BV352T GRAY\r\n\r\nSpecification:\r\nProcessor: Intel Core i3-7020U\r\nRAM: 4 GB DDR4\r\nSSD: 512 GB SSD\r\nNVIDIA MX230 2GB\r\nUkuran Layar: 1', 6485000, 1, 'laptop-asus-a409uj-br351tbr352t-core-i3-7020u-4gb-512gb-mx230-win10-20200710104437.jpg'),
(2, 2, 'laptop-asus-a409ua-bv351t-silver-i3-7020u4gb512gbw10', 'Laptop Asus A409UA-BV351T - Silver [i3-7020U|4GB|512GB|W10]', '### Garansi Resmi 2 Tahun Asus Indonesia ###\r\n### Kami merekomendasikan packing kayu untuk pembelian produk kami Link : \r\nhttps://shopee.co.id/product/29339583/7328446087/\r\n### Kerusakan pada saat Ekspedisi bukan tanggung jawab kami ### \r\n\r\nLaptop Asus A4', 6749000, 1, 'laptop-asus-a409ua-bv351t-silver-i3-7020u4gb512gbw10-20200710104554.jpg'),
(3, 2, 'asus-a412fl-ek502t-grey', 'ASUS A412FL-EK502T GREY', 'Deskripsi Produk\r\nDeskripsi ASUS A412FL EK502T | i5 8265U 8GB 512SSD MX250 2GB W10 GREY\r\n\r\nA412FL EK502T (GREY)\r\n\r\nSPESIFIKASI:\r\n\r\nDisplay : 14.0”FHD\r\nProcessor : Intel® Core™ i5-8265U Processor\r\nMemory : 8GB DDR4\r\nStorage : 512GB PCIe® SSD\r\nGraphics :NVI', 8750000, 1, 'asus-a412fl-ek502t-grey-20200710104710.jpg'),
(4, 2, 'apple-133-macbook-pro-with-touch-bar-mid-2019-space-gray', 'Apple 13.3\" MacBook Pro with Touch Bar (Mid 2019, Space Gray)', 'Key Features\r\n\r\n    1.4 GHz Intel Core i5 Quad-Core\r\n    8GB LPDDR3 RAM | 128GB PCIe SSD\r\n    13.3\" 2560 x 1600 Retina Display\r\n    Integrated Intel Iris Plus Graphics 645\r\n\r\nThe space gray mid 2019 Apple 13.3\" MacBook Pro with Touch Bar delivers an 8th G', 30000000, 1, 'apple-133-macbook-pro-with-touch-bar-mid-2019-space-gray-20200710105003.jpg'),
(5, 1, 'apple-iphone-x-64-gb-cpo-smartphone-garansi-internasional', 'Apple iPhone X 64 GB CPO Smartphone Garansi InternasionaL', 'Deskripsi Apple iPhone X 64 GB CPO Smartphone Garansi InternasionaL\r\n\r\nPRODUCT HIGHLIGHTS :\r\nChipset Apple A11 Bionic\r\nRAM 3GB Internal 64GB\r\n(F) 7MP (B) Dual: 12 MP (f/1.8, 28mm) + 12 MP (f/2.4, 52mm)\r\nScreen 5.8 inches\r\niOS 12\r\nNon-removable Li-Ion 2716', 13300000, 1, 'apple-iphone-x-64-gb-cpo-smartphone-garansi-internasional-20200710105612.jpg'),
(6, 1, 'iphone-11-pro-max-64-gb-smartphone-apple-iphone-11-pro-max-64-gb', 'IPhone 11 Pro Max 64 GB - Smartphone Apple IPhone 11 Pro Max 64 GB', 'Deskripsi IPhone 11 Pro Max 64 GB - Smartphone Apple IPhone 11 Pro Max 64 GB\r\n\r\nIPhone 11 Pro Max 64 GB - Smartphone Apple IPhone 11 Pro Max 64 GB Baru\r\n\r\nVarian Warna:\r\nSpace Grey 64 Gb: Rp 23.500.000\r\nSpace Grey 256 Gb: Rp 27.500.000\r\nSpace Grey 512 Gb:', 23500000, 1, 'iphone-11-pro-max-64-gb-smartphone-apple-iphone-11-pro-max-64-gb-20200710111404.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(1, 'Mohamad Ali Farhan', 'ali.farhan160@gmail.com', '$2y$10$.Pbf1YWtBeoPESxOSvWmyu5qjcjl/AC6HgXodX9GV4uGf0DmQrshq', 'member', 1, ''),
(2, 'Prily Ocklivia Nurul', 'prilyockl@gmail.com', '$2y$10$YKx9HVyKR5lzO5JVid8teeJyHuoNHiVlHkbXcPiozjdslBvkw9Jqi', 'member', 1, ''),
(3, 'hakim', 'hakim@gmail.com', '$2y$10$Gnci7KByFJpmbXiQHISYQuMJLSnxWYxaO6hwHh26j5GP.jZoSdwRu', 'member', 1, ''),
(4, 'Dhima Muhtar', 'dhima@gmail.com', '$2y$10$rvkqoR3Zff97B/KoYBs/4.K1dcr.Mvn2mo93rJ6O21iteu46wagEe', 'admin', 1, 'dhima-muhtar-20200710225618.jpg'),
(6, 'Admin', 'admin@gmail.com', '$2y$10$InjBgDSAF6Rsw9gpC8Rx6eU96F/oXd8rUOpjgdxP/AfhM1BGLNurO', 'admin', 1, 'admin-20200710231922.jpg'),
(7, 'Trisnandarr', 'trisnandarr@gmail.com', '$2y$10$3EfruhrtYKjgDWrRi6wHP.do1h7iUn6tNDUmeImF88LoraFjGiISS', 'member', 1, 'trisnandarr-20200711000302.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
