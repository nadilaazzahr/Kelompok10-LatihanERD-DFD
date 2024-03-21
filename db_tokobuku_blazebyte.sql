-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Mar 2024 pada 06.02
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tokobuku_blazebyte`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `author`
--

CREATE TABLE `author` (
  `author_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `author`
--

INSERT INTO `author` (`author_name`, `address`, `URL`) VALUES
('Agus Setiawan', 'Jl. Gatot Subroto No. 222, Semarang', 'http://www.agussetiawan.com'),
('Ahmad Syah', 'Jl. Ahmad Yani No. 123, Jakarta', 'http://www.ahmadsyah.com'),
('Budi Prasetyo', 'Jl. Pahlawan No. 789, Bandung', 'http://www.budiprasetyo.com'),
('Dewi Lestari', 'Jl. Sudirman No. 101, Yogyakarta', 'http://www.dewilestari.com'),
('Siti Rahayu', 'Jl. Diponegoro No. 456, Surabaya', 'http://www.sitirahayu.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `book`
--

CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `publisher_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `book`
--

INSERT INTO `book` (`ISBN`, `year`, `title`, `price`, `author_name`, `publisher_name`) VALUES
('978-979-12345-0-1', 2018, 'Matahari Terbenam di Pantai Anyer', 75, 'Ahmad Syah', 'Penerbit Harapan'),
('978-979-12345-0-2', 2019, 'Misteri Gunung Merapi', 65, 'Siti Rahayu', 'Maju Jaya Publisher'),
('978-979-12345-0-3', 2020, 'Rahasia Alam Bawah Laut', 80, 'Budi Prasetyo', 'Inspirasi Cerdas'),
('978-979-12345-0-4', 2021, 'Sang Pemimpi', 70, 'Dewi Lestari', 'Bintang Pustaka'),
('978-979-12345-0-5', 2022, 'Jalan Menuju Surga', 85, 'Agus Setiawan', 'Mitra Pustaka');

-- --------------------------------------------------------

--
-- Struktur dari tabel `book_contains`
--

CREATE TABLE `book_contains` (
  `number` int(11) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `basketID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `book_contains`
--

INSERT INTO `book_contains` (`number`, `ISBN`, `basketID`) VALUES
(1, '978-979-12345-0-1', 1),
(2, '978-979-12345-0-2', 2),
(3, '978-979-12345-0-3', 3),
(4, '978-979-12345-0-4', 4),
(5, '978-979-12345-0-5', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`email`, `address`, `name`, `phone`) VALUES
('agus@example.com', 'Jl. Cempaka No. 222, Semarang', 'Agus', '081234567894'),
('ahmad@example.com', 'Jl. Mangga Besar No. 123, Jakarta', 'Ahmad', '081234567890'),
('budi@example.com', 'Jl. Melati No. 789, Bandung', 'Budi', '081234567892'),
('dewi@example.com', 'Jl. Anggrek No. 101, Yogyakarta', 'Dewi', '081234567893'),
('siti@example.com', 'Jl. Mawar No. 456, Surabaya', 'Siti', '081234567891');

-- --------------------------------------------------------

--
-- Struktur dari tabel `publisher`
--

CREATE TABLE `publisher` (
  `publisher_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `publisher`
--

INSERT INTO `publisher` (`publisher_name`, `address`, `phone`, `URL`) VALUES
('Bintang Pustaka', 'Jl. Surya Kencana No. 101, Yogyakarta', '0274-2345678', 'http://www.bintangpustaka.co.id'),
('Inspirasi Cerdas', 'Jl. Cendrawasih No. 789, Bandung', '022-9876543', 'http://www.inspirasicerdas.co.id'),
('Maju Jaya Publisher', 'Jl. Kenanga No. 456, Surabaya', '031-7654321', 'http://www.majujayapublisher.co.id'),
('Mitra Pustaka', 'Jl. Diponegoro No. 222, Semarang', '024-8765432', 'http://www.mitrapustaka.co.id'),
('Penerbit Harapan', 'Jl. Merdeka No. 123, Jakarta', '021-1234567', 'http://www.penerbitharapan.co.id');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shopping_basket`
--

CREATE TABLE `shopping_basket` (
  `basketID` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `shopping_basket`
--

INSERT INTO `shopping_basket` (`basketID`, `email`) VALUES
(5, 'agus@example.com'),
(1, 'ahmad@example.com'),
(3, 'budi@example.com'),
(4, 'dewi@example.com'),
(2, 'siti@example.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stocks`
--

CREATE TABLE `stocks` (
  `number` int(11) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stocks`
--

INSERT INTO `stocks` (`number`, `ISBN`, `code`) VALUES
(10, '978-979-12345-0-1', 'WH001'),
(20, '978-979-12345-0-2', 'WH002'),
(30, '978-979-12345-0-3', 'WH003'),
(40, '978-979-12345-0-4', 'WH004'),
(50, '978-979-12345-0-5', 'WH005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouse`
--

CREATE TABLE `warehouse` (
  `code` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `warehouse`
--

INSERT INTO `warehouse` (`code`, `address`, `phone`) VALUES
('WH001', 'Jl. Kemanggisan No. 123, Jakarta', '021-1234567'),
('WH002', 'Jl. Sawojajar No. 456, Surabaya', '031-7654321'),
('WH003', 'Jl. Pahlawan No. 789, Bandung', '022-9876543'),
('WH004', 'Jl. Demangan No. 101, Yogyakarta', '0274-2345678'),
('WH005', 'Jl. Gajahmada No. 222, Semarang', '024-8765432');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_name`);

--
-- Indeks untuk tabel `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `author_name` (`author_name`),
  ADD KEY `publisher_name` (`publisher_name`);

--
-- Indeks untuk tabel `book_contains`
--
ALTER TABLE `book_contains`
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `basketID` (`basketID`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_name`);

--
-- Indeks untuk tabel `shopping_basket`
--
ALTER TABLE `shopping_basket`
  ADD PRIMARY KEY (`basketID`),
  ADD KEY `email` (`email`);

--
-- Indeks untuk tabel `stocks`
--
ALTER TABLE `stocks`
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `code` (`code`);

--
-- Indeks untuk tabel `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`code`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `shopping_basket`
--
ALTER TABLE `shopping_basket`
  MODIFY `basketID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`author_name`) REFERENCES `author` (`author_name`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisher_name`) REFERENCES `publisher` (`publisher_name`);

--
-- Ketidakleluasaan untuk tabel `book_contains`
--
ALTER TABLE `book_contains`
  ADD CONSTRAINT `book_contains_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `book_contains_ibfk_2` FOREIGN KEY (`basketID`) REFERENCES `shopping_basket` (`basketID`);

--
-- Ketidakleluasaan untuk tabel `shopping_basket`
--
ALTER TABLE `shopping_basket`
  ADD CONSTRAINT `shopping_basket_ibfk_1` FOREIGN KEY (`email`) REFERENCES `customer` (`email`);

--
-- Ketidakleluasaan untuk tabel `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `stocks_ibfk_2` FOREIGN KEY (`code`) REFERENCES `warehouse` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
