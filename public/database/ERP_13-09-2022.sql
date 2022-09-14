/*
SQLyog Ultimate v12.5.1 (32 bit)
MySQL - 5.7.33 : Database - erp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `erp`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` char(30) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `accountgroup` char(30) NOT NULL DEFAULT '',
  `accountcategory` int(11) NOT NULL DEFAULT '0',
  `accounttype` int(11) NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `accountgroup` (`accountgroup`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`accountgroup`) REFERENCES `accountgroup` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`id`,`name`,`accountgroup`,`accountcategory`,`accounttype`,`usercreate`,`useredit`,`updatetimestamp`) values 
('101.001','Kas','101',0,1,'admin','','2022-09-07 09:48:46'),
('101.002','Kas kecil','101',0,1,'admin','','2022-09-07 09:48:46'),
('101.003','Kas kasir POS','101',0,1,'admin','','2022-09-07 09:48:46'),
('102.001','Bank A','102',0,1,'admin','','2022-09-07 09:48:46'),
('102.002','Bank B','102',0,1,'admin','','2022-09-07 09:48:46'),
('102.003','Bank C','102',0,1,'admin','','2022-09-07 09:48:46'),
('103.001','Deposito','103',0,5,'admin','','2022-09-07 09:48:46'),
('103.002','Surat berharga pasar uang','103',0,5,'admin','','2022-09-07 09:48:46'),
('103.999','Surat berharga lain-lain','103',0,5,'admin','','2022-09-07 09:48:46'),
('104.001','Piutang dagang umum','104',0,2,'admin','','2022-09-07 09:48:46'),
('104.002','Piutang dagang area 1','104',0,2,'admin','','2022-09-07 09:48:46'),
('104.003','Piutang dagang area 2','104',0,2,'admin','','2022-09-07 09:48:46'),
('104.004','Piutang dagang area 3','104',0,2,'admin','','2022-09-07 09:48:46'),
('105.001','Pinjaman karyawan','105',0,3,'admin','','2022-09-07 09:48:46'),
('105.002','Pinjaman salesman','105',0,3,'admin','','2022-09-07 09:48:46'),
('105.003','Pinjaman teknisi','105',0,3,'admin','','2022-09-07 09:48:46'),
('105.999','Piutang lain-lain','105',0,3,'admin','','2022-09-07 09:48:46'),
('106.001','Uang muka pembelian','106',0,3,'admin','','2022-09-07 09:48:46'),
('106.999','Uang muka lain-lain','106',0,3,'admin','','2022-09-07 09:48:46'),
('107.001','Persediaan kelompok 1.1.1','107',0,4,'admin','','2022-09-07 09:48:46'),
('107.002','Persediaan kelompok 2.1','107',0,4,'admin','','2022-09-07 09:48:46'),
('107.003','Persediaan kelompok 2.2','107',0,4,'admin','','2022-09-07 09:48:46'),
('107.999','Ayat silang transfer persediaan antar divisi','107',0,4,'admin','','2022-09-07 09:48:46'),
('108.001','Pajak penghasilan pasal 25','108',0,6,'admin','','2022-09-07 09:48:46'),
('108.002','Pajak penghasilan pasal 23/26','108',0,6,'admin','','2022-09-07 09:48:46'),
('109.001','Beban sewa dibayar dimuka','109',0,6,'admin','','2022-09-07 09:48:46'),
('109.002','Beban asuransi dibayar dimuka','109',0,6,'admin','','2022-09-07 09:48:46'),
('111.001','Hp. tanah','111',0,1,'admin','','2022-09-07 09:48:46'),
('112.001','Hp. gedung','112',0,8,'admin','','2022-09-07 09:48:46'),
('112.002','Ak. penyusutan gedung','112',0,9,'admin','','2022-09-07 09:48:46'),
('113.001','Hp. peralatan kantor','113',0,8,'admin','','2022-09-07 09:48:46'),
('113.002','Ak. penyusutan peralatan kantor','113',0,9,'admin','','2022-09-07 09:48:46'),
('114.001','Hp. kendaraan','114',0,8,'admin','','2022-09-07 09:48:46'),
('114.002','Ak. penyusutan kendaraan','114',0,9,'admin','','2022-09-07 09:48:46'),
('115.001','Beban pra operasional','115',0,8,'admin','','2022-09-07 09:48:46'),
('115.002','Beban bunga ditangguhkan','115',0,8,'admin','','2022-09-07 09:48:46'),
('20.001','Hutang dagang luar negeri','20',1,10,'admin','','2022-09-07 09:48:46'),
('20.002','Hutang dagang dalam negeri','20',1,10,'admin','','2022-09-07 09:48:46'),
('20.003','Pendapatan diterima dimuka','20',1,11,'admin','','2022-09-07 09:48:46'),
('20.004','Hutang Deviden','20',1,11,'admin','','2022-09-07 09:48:46'),
('20.005','Uang Muka Penjualan','20',1,11,'admin','','2022-09-07 09:48:46'),
('20.006','Titipan beban pembayaran pihak ketiga','20',1,11,'admin','','2022-09-07 09:48:46'),
('21.001','Beban gaji yang masih harus dibayar','21',1,12,'admin','','2022-09-07 09:48:46'),
('21.999','Beban lain-lain yang masih harus dibayar','21',1,12,'admin','','2022-09-07 09:48:46'),
('22.001','Hutang pajak penghasilan','22',1,13,'admin','','2022-09-07 09:48:46'),
('22.002','Pajak pertambahan nilai','22',1,13,'admin','','2022-09-07 09:48:46'),
('23.001','Hutang bank A - pokok','23',1,27,'admin','','2022-09-07 09:48:46'),
('23.002','Hutang bank A - bunga','23',1,27,'admin','','2022-09-07 09:48:46'),
('23.003','Hutang bank B - pokok','23',1,27,'admin','','2022-09-07 09:48:46'),
('23.004','Hutang bank B - bunga','23',1,27,'admin','','2022-09-07 09:48:46'),
('24.001','Hutang bank A - pokok','24',1,27,'admin','','2022-09-07 09:48:46'),
('24.002','Hutang bank A - bunga','24',1,27,'admin','','2022-09-07 09:48:46'),
('24.003','Hutang bank B - pokok','24',1,27,'admin','','2022-09-07 09:48:46'),
('24.004','Hutang bank B - bunga','24',1,27,'admin','','2022-09-07 09:48:46'),
('24.005','Hutang lembaga keuangan lainnya','24',1,27,'admin','','2022-09-07 09:48:46'),
('300.001','Modal Tn. A','300',2,17,'admin','','2022-09-07 09:48:46'),
('300.002','Modal Tn. B','300',2,17,'admin','','2022-09-07 09:48:46'),
('301.001','Laba ditahan periode lalu','301',2,17,'admin','','2022-09-07 09:48:46'),
('301.002','Laba periode berjalan','301',2,17,'admin','','2022-09-07 09:48:46'),
('303.001','Deviden Tn. A','303',2,17,'admin','','2022-09-07 09:48:46'),
('303.002','Deviden Tn. B','303',2,17,'admin','','2022-09-07 09:48:46'),
('401.001','Pendapatan penjualan','401',3,18,'admin','','2022-09-07 09:48:46'),
('401.002','Retur penjualan','401',3,18,'admin','','2022-09-07 09:48:46'),
('401.003','Potongan penjualan','401',3,18,'admin','','2022-09-07 09:48:46'),
('401.004','Debet/kredit memo penjualan','401',3,18,'admin','','2022-09-07 09:48:46'),
('401.005','Potongan retur penjualan','401',3,18,'admin','','2022-09-07 09:48:46'),
('401.006','Pendapatan konsinyasi','401',3,18,'admin','','2022-09-07 09:48:46'),
('402.001','Pendapatan penjualan','402',3,18,'admin','','2022-09-07 09:48:46'),
('402.002','Retur penjualan','402',3,18,'admin','','2022-09-07 09:48:46'),
('402.003','Potongan penjualan','402',3,18,'admin','','2022-09-07 09:48:46'),
('402.004','Debet/kredit memo penjualan','402',3,18,'admin','','2022-09-07 09:48:46'),
('402.005','Potongan retur penjualan','402',3,18,'admin','','2022-09-07 09:48:46'),
('402.006','Pendapatan konsinyasi','402',3,18,'admin','','2022-09-07 09:48:46'),
('403.001','Pendapatan penjualan','403',3,18,'admin','','2022-09-07 09:48:46'),
('403.002','Retur penjualan','403',3,18,'admin','','2022-09-07 09:48:46'),
('403.003','Diskon penjualan','403',3,18,'admin','','2022-09-07 09:48:46'),
('403.004','Debet/kredit memo penjualan','403',3,18,'admin','','2022-09-07 09:48:46'),
('403.005','Potongan retur penjualan','403',3,18,'admin','','2022-09-07 09:48:46'),
('403.006','Pendapatan konsinyasi','403',3,18,'admin','','2022-09-07 09:48:46'),
('408.001','Potongan tunai','408',3,22,'admin','','2022-09-07 09:48:46'),
('408.002','Potongan tunai pembayaran bank A','408',3,22,'admin','','2022-09-07 09:48:46'),
('408.003','Potongan tunai pembayaran bank B','408',3,22,'admin','','2022-09-07 09:48:46'),
('408.004','Potongan tunai pembayaran bank C','408',3,22,'admin','','2022-09-07 09:48:46'),
('409.001','Diskon penjualan umum','409',3,22,'admin','','2022-09-07 09:48:46'),
('409.002','Diskon penjualan area 1','409',3,22,'admin','','2022-09-07 09:48:46'),
('409.003','Diskon penjualan area 2','409',3,22,'admin','','2022-09-07 09:48:46'),
('409.004','Diskon penjualan area 3','409',3,22,'admin','','2022-09-07 09:48:46'),
('410.001','Pendapatan Servis','410',3,18,'admin','','2022-09-07 09:48:46'),
('501.001','HPP kelompok 1.1.1','501',3,20,'admin','','2022-09-07 09:48:46'),
('501.002','HPP kelompok 2.1','501',3,20,'admin','','2022-09-07 09:48:46'),
('501.003','HPP kelompok 2.2','501',3,20,'admin','','2022-09-07 09:48:46'),
('502.001','Diskon pembelian pemasok umum','502',3,20,'admin','','2022-09-07 09:48:46'),
('502.002','Diskon pembelian pemasok luar negeri','502',3,20,'admin','','2022-09-07 09:48:46'),
('502.003','Diskon pembelian pemasok dalam negeri','502',3,20,'admin','','2022-09-07 09:48:46'),
('503.001','Biaya angkut','503',3,20,'admin','','2022-09-07 09:48:46'),
('503.002','Biaya ekspedisi','503',3,20,'admin','','2022-09-07 09:48:46'),
('504.001','Hadiah dan Bonus Pembelian','504',3,20,'admin','','2022-09-07 09:48:46'),
('601.001','Beban penjualan konsinyasi','601',4,22,'admin','','2022-09-07 09:48:46'),
('601.002','Beban penjualan berhadiah','601',4,22,'admin','','2022-09-07 09:48:46'),
('601.003','Beban kemasan','601',4,22,'admin','','2022-09-07 09:48:46'),
('601.004','Beban pengiriman penjualan','601',4,22,'admin','','2022-09-07 09:48:46'),
('601.005','Beban piutang tak tertagih','601',4,22,'admin','','2022-09-07 09:48:46'),
('601.006','Beban penjualan lain-lain','601',4,22,'admin','','2022-09-07 09:48:46'),
('602.001','Beban iklan dan promosi','602',4,23,'admin','','2022-09-07 09:48:46'),
('602.002','Beban promosi','602',4,23,'admin','','2022-09-07 09:48:46'),
('602.003','Biaya riset dan pengembangan','602',4,23,'admin','','2022-09-07 09:48:46'),
('602.004','Biaya operasional salesman','602',4,23,'admin','','2022-09-07 09:48:46'),
('602.005','Beban pemasaran lain-lain','602',4,23,'admin','','2022-09-07 09:48:46'),
('603.001','Beban alat tulis kantor','603',4,21,'admin','','2022-09-07 09:48:46'),
('603.002','Beban transportasi','603',4,21,'admin','','2022-09-07 09:48:46'),
('603.003','Beban telepon','603',4,21,'admin','','2022-09-07 09:48:46'),
('603.004','Beban listrik','603',4,21,'admin','','2022-09-07 09:48:46'),
('603.005','Beban perizinan','603',4,21,'admin','','2022-09-07 09:48:46'),
('603.006','Beban akomodasi dinas kantor','603',4,21,'admin','','2022-09-07 09:48:46'),
('603.007','Beban pos dan materai','603',4,21,'admin','','2022-09-07 09:48:46'),
('603.008','Beban dapur kantor','603',4,21,'admin','','2022-09-07 09:48:46'),
('603.009','Beban keamanan dan kebersihan','603',4,21,'admin','','2022-09-07 09:48:46'),
('603.999','Beban administrasi umum lain-lain','603',4,21,'admin','','2022-09-07 09:48:46'),
('604.001','Gaji karyawan tetap','604',4,24,'admin','','2022-09-07 09:48:46'),
('604.002','Lembur karyawan tetap','604',4,24,'admin','','2022-09-07 09:48:46'),
('604.003','Bonus karyawan tetap','604',4,24,'admin','','2022-09-07 09:48:46'),
('604.004','Gaji karyawan tidak tetap','604',4,24,'admin','','2022-09-07 09:48:46'),
('604.005','Lembur karyawan tidak tetap','604',4,24,'admin','','2022-09-07 09:48:46'),
('604.006','Bonus karyawan tidak tetap','604',4,24,'admin','','2022-09-07 09:48:46'),
('604.007','Kesehatan karyawan','604',4,24,'admin','','2022-09-07 09:48:46'),
('604.008','Beban asuransi karyawan','604',4,24,'admin','','2022-09-07 09:48:46'),
('604.009','Beban konsumsi karyawan','604',4,24,'admin','','2022-09-07 09:48:46'),
('604.010','Beban pelatihan karyawan','604',4,24,'admin','','2022-09-07 09:48:46'),
('604.999','Beban tenaga kerja lain-lain','604',4,24,'admin','','2022-09-07 09:48:46'),
('605.001','Beban penyusutan gedung','605',4,24,'admin','','2022-09-07 09:48:46'),
('605.002','Beban penyusutan kendaraan','605',4,24,'admin','','2022-09-07 09:48:46'),
('605.003','Beban penyusutan peralatan kantor','605',4,24,'admin','','2022-09-07 09:48:46'),
('701.001','Pendapatan jasa giro dan bunga tabungan','701',3,19,'admin','','2022-09-07 09:48:46'),
('701.002','Laba/rugi selisih kurs','701',3,19,'admin','','2022-09-07 09:48:46'),
('701.003','Diskon Pembayaran','701',3,19,'admin','','2022-09-07 09:48:46'),
('701.004','Laba/rugi penghapusan hutang','701',3,19,'admin','','2022-09-07 09:48:46'),
('701.005','Laba/rugi penghapusan piutang','701',3,19,'admin','','2022-09-07 09:48:46'),
('701.099','Pendapatan lain-lain','701',3,19,'admin','','2022-09-07 09:48:46'),
('701.101','Beban administrasi bank dan pajak jasa giro','701',3,19,'admin','','2022-09-07 09:48:46'),
('701.199','Beban lain-lain','701',3,19,'admin','','2022-09-07 09:48:46'),
('801.001','Beban bunga bank A','801',4,26,'admin','','2022-09-07 09:48:46'),
('801.002','Beban bunga bank B','801',4,26,'admin','','2022-09-07 09:48:46'),
('901.001','Beban Pajak Penghasilan','901',4,30,'admin','','2022-09-07 09:48:46');

/*Table structure for table `accountgroup` */

DROP TABLE IF EXISTS `accountgroup`;

CREATE TABLE `accountgroup` (
  `id` char(30) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `parent` char(30) NOT NULL DEFAULT '',
  `accountcategory` int(11) NOT NULL DEFAULT '0',
  `accounttype` int(11) NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `accountgroup` */

insert  into `accountgroup`(`id`,`name`,`parent`,`accountcategory`,`accounttype`,`usercreate`,`useredit`,`updatetimestamp`) values 
('1','ASET','',0,0,'admin','','2022-09-07 09:48:45'),
('10','Aset Lancar','1',0,0,'admin','','2022-09-07 09:48:45'),
('101','Kas','10',0,1,'admin','','2022-09-07 09:48:45'),
('102','Bank','10',0,1,'admin','','2022-09-07 09:48:45'),
('103','Surat-surat Berharga','10',0,5,'admin','','2022-09-07 09:48:45'),
('104','Piutang Dagang','10',0,2,'admin','','2022-09-07 09:48:45'),
('105','Piutang Lain-lain','10',0,3,'admin','','2022-09-07 09:48:45'),
('106','Uang Muka','10',0,3,'admin','','2022-09-07 09:48:45'),
('107','Persediaan','10',0,4,'admin','','2022-09-07 09:48:45'),
('108','Pajak Dibayar Dimuka','10',0,6,'admin','','2022-09-07 09:48:45'),
('109','Beban Dibayar Dimuka','10',0,6,'admin','','2022-09-07 09:48:45'),
('11','Aset Tidak Lancar','1',0,0,'admin','','2022-09-07 09:48:45'),
('111','Tanah','11',0,8,'admin','','2022-09-07 09:48:45'),
('112','Gedung','11',0,8,'admin','','2022-09-07 09:48:45'),
('113','Peralatan Kantor','11',0,8,'admin','','2022-09-07 09:48:45'),
('114','Kendaraan','11',0,8,'admin','','2022-09-07 09:48:45'),
('115','Beban Ditangguhkan','11',0,8,'admin','','2022-09-07 09:48:45'),
('116','Goodwill','11',0,8,'admin','','2022-09-07 09:48:45'),
('2','LAIBILITAS','',1,0,'admin','','2022-09-07 09:48:45'),
('20','Hutang Lancar','2',1,10,'admin','','2022-09-07 09:48:45'),
('21','Beban Yang Masih Harus Dibayar','2',1,12,'admin','','2022-09-07 09:48:45'),
('22','Hutang Pajak','2',1,13,'admin','','2022-09-07 09:48:45'),
('23','Hutang Bank','2',1,27,'admin','','2022-09-07 09:48:45'),
('24','Laibilitas Jangka Panjang','2',1,28,'admin','','2022-09-07 09:48:45'),
('3','EKUITAS','',2,0,'admin','','2022-09-07 09:48:45'),
('300','Modal Saham','3',2,17,'admin','','2022-09-07 09:48:45'),
('301','Laba ditahan','3',2,17,'admin','','2022-09-07 09:48:45'),
('302','Revaluasi aset tetap','3',2,17,'admin','','2022-09-07 09:48:45'),
('303','Deviden','3',2,17,'admin','','2022-09-07 09:48:45'),
('4','Pendapatan Kotor','',3,0,'admin','','2022-09-07 09:48:45'),
('40','Penjualan Bersih','4',3,0,'admin','','2022-09-07 09:48:45'),
('401','Penjualan Kelompok A','40',3,18,'admin','','2022-09-07 09:48:45'),
('402','Penjualan Kelompok B','40',3,18,'admin','','2022-09-07 09:48:45'),
('403','Penjualan Kelompok C','40',3,18,'admin','','2022-09-07 09:48:45'),
('408','Potongan Tunai Penjualan','40',3,18,'admin','','2022-09-07 09:48:45'),
('409','Diskon Penjualan Pelanggan','40',3,18,'admin','','2022-09-07 09:48:45'),
('410','Pendapatan Jasa','40',3,18,'admin','','2022-09-07 09:48:45'),
('5','Harga Pokok Penjualan','',3,0,'admin','','2022-09-07 09:48:45'),
('501','HPP Kelompok Produk','5',3,20,'admin','','2022-09-07 09:48:45'),
('502','Diskon Pembelian Pemasok','5',3,20,'admin','','2022-09-07 09:48:45'),
('503','Biaya-biaya Pembelian','5',3,20,'admin','','2022-09-07 09:48:45'),
('504','Hadiah dan Bonus Pembelian','5',3,20,'admin','','2022-09-07 09:48:45'),
('6','Beban Operasi','',4,0,'admin','','2022-09-07 09:48:45'),
('601','Beban Penjualan','6',4,22,'admin','','2022-09-07 09:48:45'),
('602','Beban Pemasaran','6',4,23,'admin','','2022-09-07 09:48:45'),
('603','Beban Administrasi dan Umum','6',4,21,'admin','','2022-09-07 09:48:45'),
('604','Biaya Tenaga Kerja','6',4,24,'admin','','2022-09-07 09:48:45'),
('605','Beban Penyusutan','6',4,24,'admin','','2022-09-07 09:48:45'),
('7','Pendapatan di Luar Usaha','',3,0,'admin','','2022-09-07 09:48:45'),
('701','Pendapatan (Beban) Lain-lain','7',3,19,'admin','','2022-09-07 09:48:45'),
('8','Beban di Luar Usaha','',4,0,'admin','','2022-09-07 09:48:45'),
('801','Beban Bunga Bank','8',4,26,'admin','','2022-09-07 09:48:45'),
('9','Pajak Penghasilan','',4,0,'admin','','2022-09-07 09:48:45'),
('901','Beban Pajak Penghasilan','9',4,30,'admin','','2022-09-07 09:48:45');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` char(30) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `customergroup` char(30) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL DEFAULT '',
  `shipto` text,
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `faximile` varchar(50) NOT NULL DEFAULT '',
  `mobilephone` varchar(50) NOT NULL DEFAULT '',
  `category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=PERSONAL, 1=COMPANY',
  `contactperson` varchar(100) NOT NULL DEFAULT '',
  `religion` int(10) unsigned NOT NULL DEFAULT '0',
  `birthdate` date DEFAULT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=MALE, 1=FEMALE',
  `email` varchar(100) NOT NULL DEFAULT '',
  `website` varchar(100) NOT NULL DEFAULT '',
  `country` char(3) NOT NULL DEFAULT '',
  `creditlimit` double NOT NULL DEFAULT '0',
  `creditlimittype` tinyint(4) NOT NULL DEFAULT '0',
  `registerdate` datetime DEFAULT NULL,
  `activeuntil` datetime DEFAULT '2099-12-31 00:00:00',
  `taxid` varchar(50) NOT NULL DEFAULT '',
  `taxiddate` date DEFAULT NULL,
  `taxable` smallint(6) NOT NULL DEFAULT '0',
  `termofpayment` varchar(30) NOT NULL DEFAULT '' COMMENT '2/10, n/30\nCOD (Cash On Delivery)',
  `isactive` smallint(6) NOT NULL DEFAULT '1',
  `defsalesmanid` char(30) NOT NULL DEFAULT '',
  `salesdiscrules` varchar(200) NOT NULL DEFAULT '',
  `salesproductrewardrules` varchar(200) NOT NULL DEFAULT '',
  `salespointrewardrules` varchar(200) NOT NULL DEFAULT '',
  `paymentdiscrules` varchar(200) NOT NULL DEFAULT '',
  `receivableacc` char(30) NOT NULL DEFAULT '',
  `rewardacc` char(30) NOT NULL DEFAULT '',
  `downpaymentacc` char(30) NOT NULL DEFAULT '',
  `salesdiscacc` char(30) NOT NULL DEFAULT '',
  `gainlossreceivableacc` char(30) NOT NULL DEFAULT '',
  `point` double NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `pricelevel` int(11) NOT NULL DEFAULT '1',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` blob,
  PRIMARY KEY (`id`),
  KEY `customergroup` (`customergroup`),
  KEY `receivableacc` (`receivableacc`),
  KEY `rewardacc` (`rewardacc`),
  KEY `downpaymentacc` (`downpaymentacc`),
  KEY `salesdiscacc` (`salesdiscacc`),
  KEY `gainlossreceivableacc` (`gainlossreceivableacc`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customergroup`) REFERENCES `customergroup` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`receivableacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_4` FOREIGN KEY (`rewardacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_5` FOREIGN KEY (`downpaymentacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_6` FOREIGN KEY (`salesdiscacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `customer_ibfk_7` FOREIGN KEY (`gainlossreceivableacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`id`,`name`,`customergroup`,`address`,`shipto`,`telephone`,`faximile`,`mobilephone`,`category`,`contactperson`,`religion`,`birthdate`,`sex`,`email`,`website`,`country`,`creditlimit`,`creditlimittype`,`registerdate`,`activeuntil`,`taxid`,`taxiddate`,`taxable`,`termofpayment`,`isactive`,`defsalesmanid`,`salesdiscrules`,`salesproductrewardrules`,`salespointrewardrules`,`paymentdiscrules`,`receivableacc`,`rewardacc`,`downpaymentacc`,`salesdiscacc`,`gainlossreceivableacc`,`point`,`usercreate`,`useredit`,`pricelevel`,`updatetimestamp`,`image`) values 
('C001','PELANGGAN A','c11','',NULL,'','','',0,'',0,NULL,0,'','','IDN',0,0,'2010-07-12 11:11:38','2099-12-31 00:00:00','',NULL,0,'',1,'','1;2','1','1;2','','104.002','601.002','20.005','409.002','701.005',0,'admin','',1,'2022-09-07 09:48:46',NULL),
('C002','PELANGGAN B','c11','',NULL,'','','',0,'',0,NULL,0,'','','IDN',0,0,'2010-07-12 11:11:38','2099-12-31 00:00:00','',NULL,0,'',1,'','1;2','1;2','','','104.002','601.002','20.005','409.002','701.005',0,'admin','',1,'2022-09-07 09:48:46',NULL),
('C201','TUNAI','c21','',NULL,'','','',0,'',0,NULL,0,'','','IDN',0,0,'2010-07-12 11:11:38','2099-12-31 00:00:00','',NULL,0,'',1,'','1','1','1;2','1','104.001','601.002','20.005','409.002','701.005',0,'admin','',1,'2022-09-07 09:48:46',NULL);

/*Table structure for table `customergroup` */

DROP TABLE IF EXISTS `customergroup`;

CREATE TABLE `customergroup` (
  `id` char(30) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `parent` char(30) NOT NULL DEFAULT '',
  `isgroup` smallint(6) NOT NULL DEFAULT '0',
  `salesdiscrules` varchar(200) NOT NULL DEFAULT '',
  `salesproductrewardrules` varchar(200) NOT NULL DEFAULT '',
  `salespointrewardrules` varchar(200) NOT NULL DEFAULT '',
  `paymentdiscrules` varchar(200) NOT NULL DEFAULT '',
  `receivableacc` char(30) NOT NULL DEFAULT '',
  `rewardacc` char(30) NOT NULL DEFAULT '',
  `downpaymentacc` char(30) NOT NULL DEFAULT '',
  `salesdiscacc` char(30) NOT NULL DEFAULT '',
  `gainlossreceivableacc` char(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `receivableacc` (`receivableacc`),
  KEY `rewardacc` (`rewardacc`),
  KEY `downpaymentacc` (`downpaymentacc`),
  KEY `salesdiscacc` (`salesdiscacc`),
  KEY `gainlossreceivableacc` (`gainlossreceivableacc`),
  CONSTRAINT `customergroup_ibfk_1` FOREIGN KEY (`receivableacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `customergroup_ibfk_3` FOREIGN KEY (`rewardacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `customergroup_ibfk_4` FOREIGN KEY (`downpaymentacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `customergroup_ibfk_5` FOREIGN KEY (`salesdiscacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `customergroup_ibfk_6` FOREIGN KEY (`gainlossreceivableacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customergroup` */

insert  into `customergroup`(`id`,`description`,`parent`,`isgroup`,`salesdiscrules`,`salesproductrewardrules`,`salespointrewardrules`,`paymentdiscrules`,`receivableacc`,`rewardacc`,`downpaymentacc`,`salesdiscacc`,`gainlossreceivableacc`,`usercreate`,`useredit`,`updatetimestamp`) values 
('c1','PELANGGAN GROSIR','',1,'','','','','104.002','601.002','20.005','409.001','701.005','admin','','2022-09-07 09:48:46'),
('c11','GROSIR AREA 1','c1',0,'1;2','','','','104.002','601.002','20.005','409.002','701.005','admin','','2022-09-07 09:48:46'),
('c12','GROSIR AREA 2','c1',0,'','','','','104.003','601.002','20.005','409.003','701.005','admin','','2022-09-07 09:48:46'),
('c13','GROSIR AREA 3','c1',0,'','','','','104.004','601.002','20.005','409.004','701.005','admin','','2022-09-07 09:48:46'),
('c2','PELANGGAN TUNAI','',1,'','','','','104.001','601.002','20.005','409.001','701.005','admin','','2022-09-07 09:48:46'),
('c21','TUNAI AREA 1','c2',0,'','','','','104.001','601.002','20.005','409.002','701.005','admin','','2022-09-07 09:48:46'),
('c22','TUNAI AREA 2','c2',0,'','','','','104.001','601.002','20.005','409.003','701.005','admin','','2022-09-07 09:48:46');

/*Table structure for table `departement` */

DROP TABLE IF EXISTS `departement`;

CREATE TABLE `departement` (
  `id` char(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(150) NOT NULL DEFAULT '',
  `isactive` smallint(5) unsigned NOT NULL DEFAULT '1',
  `division` char(10) NOT NULL,
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_departement_1` (`division`),
  CONSTRAINT `FK_departement_1` FOREIGN KEY (`division`) REFERENCES `division` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `departement` */

/*Table structure for table `division` */

DROP TABLE IF EXISTS `division`;

CREATE TABLE `division` (
  `id` char(10) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `parent` char(10) NOT NULL DEFAULT '',
  `isgroup` smallint(6) NOT NULL DEFAULT '0',
  `acumsalesdisc` smallint(6) NOT NULL DEFAULT '1',
  `updlastsalesmanidtocust` smallint(6) NOT NULL DEFAULT '0',
  `frmsupplierdpid` varchar(20) NOT NULL DEFAULT '',
  `frmpurchaserequisitionid` varchar(20) NOT NULL DEFAULT '',
  `frmpurchaseorderid` varchar(20) NOT NULL DEFAULT '',
  `frmgoodsreceiptid` varchar(20) NOT NULL DEFAULT '',
  `frmpurchaseid` varchar(20) NOT NULL DEFAULT '',
  `frmpurchasereturnid` varchar(20) NOT NULL DEFAULT '',
  `frmpurchasepaymentid` varchar(20) NOT NULL DEFAULT '',
  `frmpayableadjustid` varchar(20) NOT NULL DEFAULT '',
  `frmcustomerdpid` varchar(20) NOT NULL DEFAULT '',
  `frmsalesquoteid` varchar(20) NOT NULL DEFAULT '',
  `frmsalesorderid` varchar(20) NOT NULL DEFAULT '',
  `frmdeliveryorderid` varchar(20) NOT NULL DEFAULT '',
  `frmsalesid` varchar(20) NOT NULL DEFAULT '',
  `frmtaxid` varchar(30) NOT NULL DEFAULT '',
  `frmsalesreturnid` varchar(20) NOT NULL DEFAULT '',
  `frmsalespaymentid` varchar(20) NOT NULL DEFAULT '',
  `frmreceivableadjustid` varchar(20) NOT NULL DEFAULT '',
  `frminventoryid` varchar(20) NOT NULL DEFAULT '',
  `frmjournalentryid` varchar(20) NOT NULL DEFAULT '',
  `frmmanufactureid` varchar(20) NOT NULL DEFAULT '',
  `frmpayrollid` varchar(20) NOT NULL DEFAULT '',
  `supplierdpidno` bigint(20) NOT NULL DEFAULT '0',
  `purchaserequisitionidno` bigint(20) NOT NULL DEFAULT '0',
  `purchaseorderidno` bigint(20) NOT NULL DEFAULT '0',
  `goodsreceiptidno` bigint(20) NOT NULL DEFAULT '0',
  `purchaseidno` bigint(20) NOT NULL DEFAULT '0',
  `purchasereturnidno` bigint(20) NOT NULL DEFAULT '0',
  `purchasepaymentidno` bigint(20) NOT NULL DEFAULT '0',
  `payableadjustidno` bigint(20) NOT NULL DEFAULT '0',
  `customerdpidno` bigint(20) NOT NULL DEFAULT '0',
  `salesquoteidno` bigint(20) NOT NULL DEFAULT '0',
  `salesorderidno` bigint(20) NOT NULL DEFAULT '0',
  `deliveryorderidno` bigint(20) NOT NULL DEFAULT '0',
  `salesidno` bigint(20) NOT NULL DEFAULT '0',
  `taxidno` bigint(20) NOT NULL DEFAULT '0',
  `salesreturnidno` bigint(20) NOT NULL DEFAULT '0',
  `salespaymentidno` bigint(20) NOT NULL DEFAULT '0',
  `receivableadjustidno` bigint(20) NOT NULL DEFAULT '0',
  `inventoryidno` bigint(20) NOT NULL DEFAULT '0',
  `journalentryidno` bigint(20) NOT NULL DEFAULT '0',
  `manufactureidno` bigint(20) NOT NULL DEFAULT '0',
  `payrollidno` bigint(20) NOT NULL DEFAULT '0',
  `retainedearningacc` char(30) NOT NULL DEFAULT '',
  `exchangerateacc` char(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_division_1` (`retainedearningacc`),
  KEY `FK_division_2` (`exchangerateacc`),
  CONSTRAINT `FK_division_1` FOREIGN KEY (`retainedearningacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_division_2` FOREIGN KEY (`exchangerateacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `division` */

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` char(30) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `employeegroup` char(30) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `faximile` varchar(50) NOT NULL DEFAULT '',
  `mobilephone` varchar(50) NOT NULL DEFAULT '',
  `employeelevel` int(10) unsigned NOT NULL DEFAULT '0',
  `website` varchar(100) NOT NULL DEFAULT '',
  `religion` int(10) unsigned NOT NULL DEFAULT '0',
  `birthdate` datetime DEFAULT NULL,
  `sex` tinyint(4) DEFAULT '0' COMMENT '0=MALE, 1=FEMALE',
  `email` varchar(100) NOT NULL DEFAULT '',
  `creditlimit` double NOT NULL DEFAULT '0',
  `registerdate` datetime DEFAULT NULL,
  `activeuntil` datetime DEFAULT '2099-12-31 00:00:00',
  `taxid` varchar(50) NOT NULL DEFAULT '',
  `isactive` smallint(6) NOT NULL DEFAULT '1',
  `country` char(3) NOT NULL DEFAULT '',
  `taxtype` tinyint(4) NOT NULL DEFAULT '0',
  `occupation` varchar(100) NOT NULL DEFAULT '',
  `bankaccount` varchar(30) NOT NULL DEFAULT '',
  `bankname` varchar(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` blob,
  PRIMARY KEY (`id`),
  KEY `employeegroup` (`employeegroup`),
  KEY `employeelevel` (`employeelevel`),
  KEY `taxes` (`taxtype`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`employeegroup`) REFERENCES `employeegroup` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`employeelevel`) REFERENCES `employeelevel` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`taxtype`) REFERENCES `taxes` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

/*Table structure for table `employeegroup` */

DROP TABLE IF EXISTS `employeegroup`;

CREATE TABLE `employeegroup` (
  `id` char(30) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `parent` char(30) NOT NULL DEFAULT '',
  `isgroup` smallint(6) NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employeegroup` */

insert  into `employeegroup`(`id`,`description`,`parent`,`isgroup`,`usercreate`,`useredit`,`updatetimestamp`) values 
('001','ADMINISTRASI','',0,'admin','','2022-09-07 09:48:46'),
('002','TOKO','',0,'admin','','2022-09-07 09:48:46');

/*Table structure for table `employeelevel` */

DROP TABLE IF EXISTS `employeelevel`;

CREATE TABLE `employeelevel` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `description` varchar(100) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employeelevel` */

insert  into `employeelevel`(`id`,`description`,`usercreate`,`useredit`,`updatetimestamp`) values 
(1,'MANAGEMENT LEVEL 1','admin','','2022-09-07 09:48:46'),
(2,'MANAGEMENT LEVEL 2','admin','','2022-09-07 09:48:46');

/*Table structure for table `payablepayment` */

DROP TABLE IF EXISTS `payablepayment`;

CREATE TABLE `payablepayment` (
  `transid` char(30) NOT NULL DEFAULT '',
  `transdate` date DEFAULT NULL,
  `transtime` time DEFAULT NULL,
  `supplierid` char(30) NOT NULL DEFAULT '',
  `currtrans` char(3) NOT NULL DEFAULT '',
  `ratedefault` double NOT NULL DEFAULT '0',
  `rateused` double NOT NULL DEFAULT '0',
  `paymenttype` int(10) unsigned NOT NULL,
  `refpayment` varchar(30) NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `memo` varchar(250) NOT NULL DEFAULT '',
  `memoedit` varchar(250) NOT NULL DEFAULT '',
  `division` char(10) NOT NULL DEFAULT '',
  `accepted` smallint(6) NOT NULL DEFAULT '0',
  `duedate` date DEFAULT NULL,
  `accepteddate` date DEFAULT NULL,
  `printed` smallint(6) NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `division` (`division`),
  KEY `supplierid` (`supplierid`),
  KEY `paymenttype` (`paymenttype`),
  CONSTRAINT `payablepayment_ibfk_1` FOREIGN KEY (`division`) REFERENCES `division` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payablepayment_ibfk_2` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payablepayment_ibfk_3` FOREIGN KEY (`paymenttype`) REFERENCES `paymenttype` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `payablepayment` */

/*Table structure for table `paymenttype` */

DROP TABLE IF EXISTS `paymenttype`;

CREATE TABLE `paymenttype` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `paymentacc` char(30) NOT NULL DEFAULT '',
  `cashdiscacc` char(30) NOT NULL DEFAULT '',
  `expenseacc` char(30) NOT NULL DEFAULT '',
  `defexpense` float NOT NULL DEFAULT '0',
  `kind` smallint(6) NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `paymenttype_ibfk_1` (`paymentacc`),
  KEY `paymenttype_ibfk_2` (`cashdiscacc`),
  KEY `paymenttype_ibfk_3` (`expenseacc`),
  CONSTRAINT `paymenttype_ibfk_1` FOREIGN KEY (`paymentacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `paymenttype_ibfk_2` FOREIGN KEY (`cashdiscacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `paymenttype_ibfk_3` FOREIGN KEY (`expenseacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `paymenttype` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `aliasid` char(30) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `productgroup` char(30) NOT NULL DEFAULT '',
  `defunit` varchar(50) NOT NULL DEFAULT '',
  `groupunit` varchar(50) NOT NULL DEFAULT '',
  `supplier` char(30) NOT NULL DEFAULT '',
  `category` tinyint(4) DEFAULT '0' COMMENT '0=INVENTORY, 1=SERVICE',
  `factory` char(30) NOT NULL DEFAULT '',
  `brand` varchar(50) NOT NULL DEFAULT '',
  `costprice` double NOT NULL DEFAULT '0',
  `purchasedisc` double NOT NULL DEFAULT '0',
  `purchasetax` double NOT NULL DEFAULT '0',
  `netpurchase` double NOT NULL DEFAULT '0',
  `salesprice1` double NOT NULL DEFAULT '0',
  `salesprice2` double NOT NULL DEFAULT '0',
  `salesprice3` double NOT NULL DEFAULT '0',
  `salesprice4` double NOT NULL DEFAULT '0',
  `salesprice5` double NOT NULL DEFAULT '0',
  `salesprice6` double NOT NULL DEFAULT '0',
  `salesprice7` double NOT NULL DEFAULT '0',
  `salesdiscqty1` double NOT NULL DEFAULT '0',
  `salesdiscprice1` double NOT NULL DEFAULT '0',
  `salesdiscqty2` double NOT NULL DEFAULT '0',
  `salesdiscprice2` double NOT NULL DEFAULT '0',
  `salesdiscqty3` double NOT NULL DEFAULT '0',
  `salesdiscprice3` double NOT NULL DEFAULT '0',
  `usesn` smallint(6) NOT NULL DEFAULT '1',
  `minimum` double NOT NULL DEFAULT '0',
  `maximum` double NOT NULL DEFAULT '0',
  `minimumreorder` double NOT NULL DEFAULT '0',
  `defaultreorder` double NOT NULL DEFAULT '0',
  `salesdisc` varchar(50) NOT NULL DEFAULT '',
  `taxtype` tinyint(4) NOT NULL DEFAULT '0',
  `author` char(30) NOT NULL DEFAULT '',
  `dwidth` double NOT NULL DEFAULT '0',
  `dheight` double NOT NULL DEFAULT '0',
  `dlength` double NOT NULL DEFAULT '0',
  `weight` double NOT NULL DEFAULT '0',
  `salesdiscrules` varchar(200) NOT NULL DEFAULT '',
  `salesmancommrules` varchar(200) NOT NULL DEFAULT '',
  `salesproductrewardrules` varchar(200) NOT NULL,
  `salespointrewardrules` varchar(200) NOT NULL,
  `servicedoercommrules` varchar(200) NOT NULL DEFAULT '',
  `inventoryacc` char(30) NOT NULL DEFAULT '',
  `taxacc` char(30) NOT NULL DEFAULT '',
  `cogsacc` char(30) NOT NULL DEFAULT '',
  `salesacc` char(30) NOT NULL DEFAULT '',
  `salesdiscacc` char(30) NOT NULL DEFAULT '',
  `salesreturnacc` char(30) NOT NULL DEFAULT '',
  `consignrevenueacc` char(30) NOT NULL DEFAULT '',
  `consignexpenseacc` char(30) NOT NULL DEFAULT '',
  `isactive` smallint(6) NOT NULL DEFAULT '1',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` blob,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `defunit` (`defunit`),
  KEY `productgroup` (`productgroup`),
  KEY `groupunit` (`groupunit`),
  KEY `supplier` (`supplier`),
  KEY `brand` (`brand`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`defunit`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`productgroup`) REFERENCES `productgroup` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`groupunit`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_4` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_5` FOREIGN KEY (`brand`) REFERENCES `productbrand` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`aliasid`,`name`,`description`,`productgroup`,`defunit`,`groupunit`,`supplier`,`category`,`factory`,`brand`,`costprice`,`purchasedisc`,`purchasetax`,`netpurchase`,`salesprice1`,`salesprice2`,`salesprice3`,`salesprice4`,`salesprice5`,`salesprice6`,`salesprice7`,`salesdiscqty1`,`salesdiscprice1`,`salesdiscqty2`,`salesdiscprice2`,`salesdiscqty3`,`salesdiscprice3`,`usesn`,`minimum`,`maximum`,`minimumreorder`,`defaultreorder`,`salesdisc`,`taxtype`,`author`,`dwidth`,`dheight`,`dlength`,`weight`,`salesdiscrules`,`salesmancommrules`,`salesproductrewardrules`,`salespointrewardrules`,`servicedoercommrules`,`inventoryacc`,`taxacc`,`cogsacc`,`salesacc`,`salesdiscacc`,`salesreturnacc`,`consignrevenueacc`,`consignexpenseacc`,`isactive`,`usercreate`,`useredit`,`updatetimestamp`,`image`,`created_at`,`updated_at`,`deleted_at`) values 
('PR-00000000001','Pepsodent D E','Pepsodent Dental Expert','','PG-00000000002','UN-00000000003','UN-00000000003','SP-00000000001',0,'','PB-00000000003',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,'',0,'',0,0,0,0,'','','','','','','','','','','','','',1,'','','2022-09-13 10:32:11',NULL,'2022-09-13 10:26:17','2022-09-13 10:32:11',NULL),
('PR-00000000002','','Pepsodent Dental Premium','','PG-00000000002','UN-00000000003','UN-00000000003','SP-00000000001',0,'','PB-00000000003',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,'',0,'',0,0,0,0,'','','','','','','','','','','','','',1,'','','2022-09-13 10:33:40',NULL,'2022-09-13 10:33:22','2022-09-13 10:33:40','2022-09-13 10:33:40');

/*Table structure for table `productbrand` */

DROP TABLE IF EXISTS `productbrand`;

CREATE TABLE `productbrand` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(45) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `productbrand` */

insert  into `productbrand`(`id`,`name`,`usercreate`,`useredit`,`updatetimestamp`,`created_at`,`updated_at`,`deleted_at`) values 
('PB-00000000001','Pepsodents','','','2022-09-12 16:38:35','2022-09-12 16:33:10','2022-09-12 16:38:35','2022-09-12 16:38:35'),
('PB-00000000002','Pepsodent','','','2022-09-13 09:43:08','2022-09-13 09:19:59','2022-09-13 09:43:08','2022-09-13 09:24:56'),
('PB-00000000003','Pepsodent','','','2022-09-13 09:41:58','2022-09-13 09:41:58','2022-09-13 09:41:58',NULL),
('PB-00000000004','Pepsodent','','','2022-09-13 09:43:08','2022-09-13 09:43:08','2022-09-13 09:43:08',NULL);

/*Table structure for table `productgroup` */

DROP TABLE IF EXISTS `productgroup`;

CREATE TABLE `productgroup` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `parent` char(30) NOT NULL DEFAULT '',
  `isgroup` smallint(6) NOT NULL DEFAULT '0',
  `salesdiscrules` varchar(200) NOT NULL DEFAULT '',
  `salesmancommrules` varchar(200) NOT NULL DEFAULT '',
  `salesproductrewardrules` varchar(200) NOT NULL,
  `salespointrewardrules` varchar(200) NOT NULL,
  `servicedoercommrules` varchar(200) NOT NULL DEFAULT '',
  `inventoryacc` char(30) NOT NULL DEFAULT '',
  `taxacc` char(30) NOT NULL DEFAULT '',
  `cogsacc` char(30) DEFAULT '',
  `salesacc` char(30) NOT NULL DEFAULT '',
  `salesdiscacc` char(30) NOT NULL DEFAULT '',
  `salesreturnacc` char(30) NOT NULL DEFAULT '',
  `consignrevenueacc` char(30) NOT NULL DEFAULT '',
  `consignexpenseacc` char(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `productgroup` */

insert  into `productgroup`(`id`,`name`,`parent`,`isgroup`,`salesdiscrules`,`salesmancommrules`,`salesproductrewardrules`,`salespointrewardrules`,`servicedoercommrules`,`inventoryacc`,`taxacc`,`cogsacc`,`salesacc`,`salesdiscacc`,`salesreturnacc`,`consignrevenueacc`,`consignexpenseacc`,`usercreate`,`useredit`,`updatetimestamp`,`created_at`,`updated_at`,`deleted_at`) values 
('PG-00000000001','Pasta Gigi','',0,'','','','','','','','','','','','','','','','2022-09-13 09:43:09','2022-09-12 16:52:23','2022-09-13 09:43:09','2022-09-13 09:29:45'),
('PG-00000000002','Shampo','',0,'','','','','','','','','','','','','','','','2022-09-13 09:28:59','2022-09-13 09:28:59','2022-09-13 09:28:59',NULL),
('PG-00000000003','Shampo','',0,'','','','','','','','','','','','','','','','2022-09-13 09:42:00','2022-09-13 09:42:00','2022-09-13 09:42:00',NULL),
('PG-00000000004','Shampo','',0,'','','','','','','','','','','','','','','','2022-09-13 09:43:09','2022-09-13 09:43:09','2022-09-13 09:43:09',NULL);

/*Table structure for table `purchase` */

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `orderid` text,
  `goodreceiptid` text,
  `purchasedate` date DEFAULT NULL,
  `purchasetime` time DEFAULT NULL,
  `kind` int(11) NOT NULL DEFAULT '1',
  `purchasetype` smallint(6) NOT NULL DEFAULT '0' COMMENT '0=CASH, 1=CASH ON DELIVERY, 2=CREDIT',
  `earlydiscdays` int(11) NOT NULL DEFAULT '0',
  `earlydiscvalue` double NOT NULL DEFAULT '0',
  `duedays` int(11) NOT NULL DEFAULT '0',
  `supplierid` char(30) NOT NULL DEFAULT '',
  `currtrans` char(3) NOT NULL DEFAULT '',
  `ratedefault` double NOT NULL DEFAULT '0',
  `rateused` double NOT NULL DEFAULT '0',
  `purchaser` char(30) NOT NULL DEFAULT '',
  `purchasepercentdisc` double NOT NULL DEFAULT '0',
  `returnpercentdisc` double NOT NULL DEFAULT '0',
  `purchasevaluedisc` double NOT NULL DEFAULT '0',
  `returnvaluedisc` double NOT NULL DEFAULT '0',
  `memo` text,
  `memoedit` text,
  `division` char(10) NOT NULL DEFAULT '',
  `printed` smallint(6) NOT NULL DEFAULT '0',
  `shipment` int(10) unsigned NOT NULL DEFAULT '1',
  `dateaccepted` datetime DEFAULT NULL,
  `accepted` smallint(6) NOT NULL DEFAULT '1',
  `paidinfull` smallint(6) NOT NULL DEFAULT '0',
  `paidinfulldate` date DEFAULT NULL,
  `paidinfullref` char(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchaseid`),
  KEY `division` (`division`),
  KEY `purchaser` (`purchaser`),
  KEY `supplierid` (`supplierid`),
  KEY `shipment` (`shipment`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`division`) REFERENCES `division` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`purchaser`) REFERENCES `employee` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_ibfk_3` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_ibfk_4` FOREIGN KEY (`shipment`) REFERENCES `shipments` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchase` */

/*Table structure for table `purchaseconsign` */

DROP TABLE IF EXISTS `purchaseconsign`;

CREATE TABLE `purchaseconsign` (
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `purchasedate` date DEFAULT NULL,
  `purchasetime` time DEFAULT NULL,
  `kind` int(11) NOT NULL DEFAULT '1',
  `supplierid` char(30) NOT NULL DEFAULT '',
  `currtrans` char(3) NOT NULL DEFAULT '',
  `ratedefault` double NOT NULL DEFAULT '0',
  `rateused` double NOT NULL DEFAULT '0',
  `memo` text,
  `memoedit` text,
  `division` char(10) NOT NULL DEFAULT '',
  `printed` smallint(6) NOT NULL DEFAULT '0',
  `paidinfull` smallint(6) NOT NULL DEFAULT '0',
  `paidinfulldate` date DEFAULT NULL,
  `paidinfullref` char(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchaseid`),
  KEY `division` (`division`),
  KEY `supplierid` (`supplierid`),
  CONSTRAINT `purchaseconsign_ibfk_1` FOREIGN KEY (`division`) REFERENCES `division` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseconsign_ibfk_2` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseconsign` */

/*Table structure for table `purchaseconsigndetail` */

DROP TABLE IF EXISTS `purchaseconsigndetail`;

CREATE TABLE `purchaseconsigndetail` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `transdate` datetime DEFAULT NULL,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `productid` char(30) NOT NULL DEFAULT '',
  `snproduct` varchar(100) NOT NULL DEFAULT '',
  `expireddate` date DEFAULT NULL,
  `purchaseqty` double NOT NULL DEFAULT '0',
  `returnqty` double NOT NULL DEFAULT '0',
  `salesqty` double NOT NULL DEFAULT '0',
  `unit` char(10) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `salesprice` double NOT NULL DEFAULT '0',
  `salespercentdisc` double NOT NULL DEFAULT '0',
  `salesvaluedisc` double NOT NULL DEFAULT '0',
  `grossamount` double NOT NULL DEFAULT '0',
  `taxid` tinyint(4) NOT NULL DEFAULT '0',
  `purchasetax` double NOT NULL DEFAULT '0',
  `returntax` double NOT NULL DEFAULT '0',
  `netamount` double NOT NULL DEFAULT '0',
  `memo` text,
  `departement` char(10) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `productid` (`productid`),
  KEY `unit` (`unit`),
  KEY `taxid` (`taxid`),
  KEY `departement` (`departement`),
  KEY `purchaseidref` (`purchaseidref`),
  CONSTRAINT `purchaseconsigndetail_ibfk_1` FOREIGN KEY (`purchaseid`) REFERENCES `purchaseconsign` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseconsigndetail_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseconsigndetail_ibfk_3` FOREIGN KEY (`departement`) REFERENCES `departement` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseconsigndetail_ibfk_4` FOREIGN KEY (`unit`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseconsigndetail_ibfk_5` FOREIGN KEY (`taxid`) REFERENCES `taxes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseconsigndetail_ibfk_6` FOREIGN KEY (`purchaseidref`) REFERENCES `purchaseconsign` (`purchaseid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseconsigndetail` */

/*Table structure for table `purchaseconsignpayments` */

DROP TABLE IF EXISTS `purchaseconsignpayments`;

CREATE TABLE `purchaseconsignpayments` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `division` char(10) NOT NULL DEFAULT '',
  `supplierid` char(30) NOT NULL DEFAULT '',
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `transdate` datetime DEFAULT NULL,
  `transtime` time DEFAULT NULL,
  `paymentvalue` double NOT NULL DEFAULT '0',
  `duedate` date DEFAULT NULL,
  `accepted` smallint(6) NOT NULL DEFAULT '0',
  `kind` smallint(6) NOT NULL DEFAULT '0',
  `paymenttype` int(10) unsigned NOT NULL,
  `refpayment` varchar(30) NOT NULL,
  `currtrans` char(3) NOT NULL DEFAULT '',
  `ratedefault` double NOT NULL DEFAULT '0',
  `rateused` double NOT NULL DEFAULT '0',
  `memo` varchar(250) NOT NULL DEFAULT '',
  `memoedit` varchar(250) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `purchaseidref` (`purchaseidref`),
  KEY `paymenttype` (`paymenttype`),
  KEY `division` (`division`),
  KEY `supplierid` (`supplierid`),
  CONSTRAINT `purchaseconsignpayments_ibfk_1` FOREIGN KEY (`purchaseidref`) REFERENCES `purchaseconsign` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseconsignpayments_ibfk_2` FOREIGN KEY (`paymenttype`) REFERENCES `paymenttype` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseconsignpayments_ibfk_3` FOREIGN KEY (`division`) REFERENCES `division` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseconsignpayments_ibfk_4` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseconsignpayments` */

/*Table structure for table `purchasedetail` */

DROP TABLE IF EXISTS `purchasedetail`;

CREATE TABLE `purchasedetail` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `transdate` datetime DEFAULT NULL,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `productid` char(30) NOT NULL DEFAULT '',
  `snproduct` varchar(100) NOT NULL DEFAULT '',
  `expireddate` date DEFAULT NULL,
  `purchaseqty` double NOT NULL DEFAULT '0',
  `returnqty` double NOT NULL DEFAULT '0',
  `unit` char(10) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `grossamount` double NOT NULL DEFAULT '0',
  `taxid` tinyint(4) NOT NULL DEFAULT '0',
  `purchasetax` double NOT NULL DEFAULT '0',
  `returntax` double NOT NULL DEFAULT '0',
  `percentdisc` varchar(50) NOT NULL DEFAULT '',
  `valuedisc` double NOT NULL DEFAULT '0',
  `netamount` double NOT NULL DEFAULT '0',
  `memo` text,
  `departement` char(10) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `productid` (`productid`),
  KEY `unit` (`unit`),
  KEY `taxid` (`taxid`),
  KEY `departement` (`departement`),
  KEY `purchaseidref` (`purchaseidref`),
  CONSTRAINT `purchasedetail_ibfk_1` FOREIGN KEY (`purchaseid`) REFERENCES `purchase` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchasedetail_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchasedetail_ibfk_3` FOREIGN KEY (`departement`) REFERENCES `departement` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchasedetail_ibfk_4` FOREIGN KEY (`unit`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchasedetail_ibfk_5` FOREIGN KEY (`taxid`) REFERENCES `taxes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchasedetail_ibfk_6` FOREIGN KEY (`purchaseidref`) REFERENCES `purchase` (`purchaseid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchasedetail` */

/*Table structure for table `purchaseexpenses` */

DROP TABLE IF EXISTS `purchaseexpenses`;

CREATE TABLE `purchaseexpenses` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `purchaseexpacc` char(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `purchaseexpacc` (`purchaseexpacc`),
  CONSTRAINT `purchaseexpenses_ibfk_1` FOREIGN KEY (`purchaseexpacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseexpenses` */

/*Table structure for table `purchaseexpensesdetail` */

DROP TABLE IF EXISTS `purchaseexpensesdetail`;

CREATE TABLE `purchaseexpensesdetail` (
  `transid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `transdate` datetime DEFAULT NULL,
  `kind` int(11) NOT NULL DEFAULT '0',
  `purchaseexpid` int(10) unsigned NOT NULL,
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `memo` text,
  `currtrans` char(3) NOT NULL DEFAULT '',
  `ratedefault` double NOT NULL DEFAULT '0',
  `rateused` double NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `purchaseexpid` (`purchaseexpid`),
  KEY `purchaseidref` (`purchaseidref`),
  CONSTRAINT `purchaseexpensesdetail_ibfk_1` FOREIGN KEY (`purchaseidref`) REFERENCES `purchase` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseexpensesdetail_ibfk_2` FOREIGN KEY (`purchaseexpid`) REFERENCES `purchaseexpenses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseexpensesdetail` */

/*Table structure for table `purchaseextratax` */

DROP TABLE IF EXISTS `purchaseextratax`;

CREATE TABLE `purchaseextratax` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `transdate` datetime DEFAULT NULL,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `productid` char(30) NOT NULL DEFAULT '',
  `purchaseqty` double NOT NULL DEFAULT '0',
  `returnqty` double NOT NULL DEFAULT '0',
  `unit` char(10) NOT NULL DEFAULT '',
  `grossamount` double NOT NULL DEFAULT '0',
  `taxid` tinyint(4) NOT NULL DEFAULT '0',
  `purchasetax` double NOT NULL DEFAULT '0',
  `returntax` double NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `productid` (`productid`),
  KEY `unit` (`unit`),
  KEY `taxid` (`taxid`),
  KEY `purchaseidref` (`purchaseidref`),
  CONSTRAINT `purchaseextratax_ibfk_1` FOREIGN KEY (`purchaseid`) REFERENCES `purchase` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseextratax_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseextratax_ibfk_5` FOREIGN KEY (`taxid`) REFERENCES `taxes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseextratax_ibfk_6` FOREIGN KEY (`purchaseidref`) REFERENCES `purchase` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseextratax_ibfk_7` FOREIGN KEY (`unit`) REFERENCES `units` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseextratax` */

/*Table structure for table `purchaseorder` */

DROP TABLE IF EXISTS `purchaseorder`;

CREATE TABLE `purchaseorder` (
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `orderid` text,
  `purchasedate` date DEFAULT NULL,
  `purchasetime` time DEFAULT NULL,
  `kind` int(11) NOT NULL DEFAULT '0',
  `purchasetype` smallint(6) NOT NULL DEFAULT '0' COMMENT '0=CASH, 1=CASH ON DELIVERY, 2=CREDIT',
  `earlydiscdays` int(11) NOT NULL DEFAULT '0',
  `earlydiscvalue` double NOT NULL DEFAULT '0',
  `duedays` int(11) NOT NULL DEFAULT '0',
  `supplierid` char(30) NOT NULL DEFAULT '',
  `currtrans` char(3) NOT NULL DEFAULT '',
  `ratedefault` double NOT NULL DEFAULT '0',
  `rateused` double NOT NULL DEFAULT '0',
  `purchaser` char(30) NOT NULL DEFAULT '',
  `purchasepercentdisc` double NOT NULL DEFAULT '0',
  `returnpercentdisc` double NOT NULL DEFAULT '0',
  `purchasevaluedisc` double NOT NULL DEFAULT '0',
  `returnvaluedisc` double NOT NULL DEFAULT '0',
  `memo` text,
  `memoedit` text,
  `division` char(10) NOT NULL DEFAULT '',
  `printed` smallint(6) NOT NULL DEFAULT '0',
  `shipment` int(10) unsigned NOT NULL DEFAULT '1',
  `dateaccepted` datetime DEFAULT NULL,
  `accepted` smallint(6) NOT NULL DEFAULT '1',
  `paidinfull` smallint(6) NOT NULL DEFAULT '0',
  `paidinfulldate` date DEFAULT NULL,
  `paidinfullref` char(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchaseid`),
  KEY `division` (`division`),
  KEY `purchaser` (`purchaser`),
  KEY `supplierid` (`supplierid`),
  KEY `shipment` (`shipment`),
  CONSTRAINT `purchaseorder_ibfk_1` FOREIGN KEY (`division`) REFERENCES `division` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorder_ibfk_2` FOREIGN KEY (`purchaser`) REFERENCES `employee` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorder_ibfk_3` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorder_ibfk_4` FOREIGN KEY (`shipment`) REFERENCES `shipments` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseorder` */

/*Table structure for table `purchaseorderdetail` */

DROP TABLE IF EXISTS `purchaseorderdetail`;

CREATE TABLE `purchaseorderdetail` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `transdate` datetime DEFAULT NULL,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `productid` char(30) NOT NULL DEFAULT '',
  `snproduct` varchar(100) NOT NULL DEFAULT '',
  `expireddate` date DEFAULT NULL,
  `purchaseqty` double NOT NULL DEFAULT '0',
  `returnqty` double NOT NULL DEFAULT '0',
  `unit` char(10) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `grossamount` double NOT NULL DEFAULT '0',
  `taxid` tinyint(4) NOT NULL DEFAULT '0',
  `purchasetax` double NOT NULL DEFAULT '0',
  `returntax` double NOT NULL DEFAULT '0',
  `percentdisc` varchar(50) NOT NULL DEFAULT '',
  `valuedisc` double NOT NULL DEFAULT '0',
  `netamount` double NOT NULL DEFAULT '0',
  `memo` text,
  `departement` char(10) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `productid` (`productid`),
  KEY `unit` (`unit`),
  KEY `taxid` (`taxid`),
  KEY `departement` (`departement`),
  KEY `purchaseidref` (`purchaseidref`),
  CONSTRAINT `purchaseorderdetail_ibfk_1` FOREIGN KEY (`purchaseid`) REFERENCES `purchaseorder` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderdetail_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderdetail_ibfk_3` FOREIGN KEY (`departement`) REFERENCES `departement` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderdetail_ibfk_5` FOREIGN KEY (`taxid`) REFERENCES `taxes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderdetail_ibfk_6` FOREIGN KEY (`purchaseidref`) REFERENCES `purchaseorder` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderdetail_ibfk_7` FOREIGN KEY (`unit`) REFERENCES `units` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseorderdetail` */

/*Table structure for table `purchaseorderexpensesdetail` */

DROP TABLE IF EXISTS `purchaseorderexpensesdetail`;

CREATE TABLE `purchaseorderexpensesdetail` (
  `transid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `transdate` datetime DEFAULT NULL,
  `kind` int(11) NOT NULL DEFAULT '0',
  `purchaseexpid` int(10) unsigned NOT NULL,
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `memo` text,
  `currtrans` char(3) NOT NULL DEFAULT '',
  `ratedefault` double NOT NULL DEFAULT '0',
  `rateused` double NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `purchaseexpid` (`purchaseexpid`),
  KEY `purchaseidref` (`purchaseidref`),
  CONSTRAINT `purchaseorderexpensesdetail_ibfk_1` FOREIGN KEY (`purchaseidref`) REFERENCES `purchaseorder` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderexpensesdetail_ibfk_2` FOREIGN KEY (`purchaseexpid`) REFERENCES `purchaseexpenses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseorderexpensesdetail` */

/*Table structure for table `purchaseorderextratax` */

DROP TABLE IF EXISTS `purchaseorderextratax`;

CREATE TABLE `purchaseorderextratax` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `transdate` datetime DEFAULT NULL,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `productid` char(30) NOT NULL DEFAULT '',
  `purchaseqty` double NOT NULL DEFAULT '0',
  `returnqty` double NOT NULL DEFAULT '0',
  `unit` char(10) NOT NULL DEFAULT '',
  `grossamount` double NOT NULL DEFAULT '0',
  `taxid` tinyint(4) NOT NULL DEFAULT '0',
  `purchasetax` double NOT NULL DEFAULT '0',
  `returntax` double NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `productid` (`productid`),
  KEY `unit` (`unit`),
  KEY `taxid` (`taxid`),
  KEY `purchaseidref` (`purchaseidref`),
  CONSTRAINT `purchaseorderextratax_ibfk_1` FOREIGN KEY (`purchaseid`) REFERENCES `purchaseorder` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderextratax_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderextratax_ibfk_5` FOREIGN KEY (`taxid`) REFERENCES `taxes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderextratax_ibfk_6` FOREIGN KEY (`purchaseidref`) REFERENCES `purchaseorder` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchaseorderextratax_ibfk_7` FOREIGN KEY (`unit`) REFERENCES `units` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseorderextratax` */

/*Table structure for table `purchaseorderpayments` */

DROP TABLE IF EXISTS `purchaseorderpayments`;

CREATE TABLE `purchaseorderpayments` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `transdate` datetime DEFAULT NULL,
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `discountpercent` double NOT NULL DEFAULT '0',
  `discountvalue` double NOT NULL DEFAULT '0',
  `duedate` date DEFAULT NULL,
  `accepted` smallint(6) NOT NULL DEFAULT '0',
  `kind` smallint(6) NOT NULL DEFAULT '0',
  `paymenttype` int(10) unsigned NOT NULL,
  `refpayment` varchar(30) NOT NULL,
  `currtrans` char(3) NOT NULL DEFAULT '',
  `ratedefault` double NOT NULL DEFAULT '0',
  `rateused` double NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `paymenttype` (`paymenttype`),
  CONSTRAINT `purchaseorderpayments_ibfk_1` FOREIGN KEY (`paymenttype`) REFERENCES `paymenttype` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseorderpayments` */

/*Table structure for table `purchaseorderpoint` */

DROP TABLE IF EXISTS `purchaseorderpoint`;

CREATE TABLE `purchaseorderpoint` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `transdate` datetime DEFAULT NULL,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `supplier` char(30) NOT NULL DEFAULT '',
  `qtyin` double NOT NULL DEFAULT '0',
  `qtyout` double NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `purchaseidref` (`purchaseidref`),
  KEY `supplier` (`supplier`),
  CONSTRAINT `FK_purchaseorderpoint_1` FOREIGN KEY (`purchaseid`) REFERENCES `purchaseorder` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchaseorderpoint_2` FOREIGN KEY (`purchaseidref`) REFERENCES `purchaseorder` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchaseorderpoint_3` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseorderpoint` */

/*Table structure for table `purchaseorderrewarddetail` */

DROP TABLE IF EXISTS `purchaseorderrewarddetail`;

CREATE TABLE `purchaseorderrewarddetail` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `transdate` datetime DEFAULT NULL,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `productid` char(30) NOT NULL DEFAULT '',
  `snproduct` varchar(100) NOT NULL DEFAULT '',
  `expireddate` date DEFAULT NULL,
  `purchaseqty` double NOT NULL DEFAULT '0',
  `returnqty` double NOT NULL DEFAULT '0',
  `unit` char(10) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `grossamount` double NOT NULL DEFAULT '0',
  `taxid` tinyint(4) NOT NULL DEFAULT '0',
  `purchasetax` double NOT NULL DEFAULT '0',
  `returntax` double NOT NULL DEFAULT '0',
  `percentdisc` varchar(50) NOT NULL DEFAULT '',
  `valuedisc` double NOT NULL DEFAULT '0',
  `netamount` double NOT NULL DEFAULT '0',
  `memo` text,
  `departement` char(10) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `purchaseidref` (`purchaseidref`),
  KEY `productid` (`productid`),
  KEY `unit` (`unit`),
  KEY `departement` (`departement`),
  CONSTRAINT `FK_purchaseorderrewarddetail_1` FOREIGN KEY (`purchaseid`) REFERENCES `purchaseorder` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchaseorderrewarddetail_2` FOREIGN KEY (`purchaseidref`) REFERENCES `purchaseorder` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchaseorderrewarddetail_3` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchaseorderrewarddetail_4` FOREIGN KEY (`unit`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchaseorderrewarddetail_5` FOREIGN KEY (`departement`) REFERENCES `departement` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaseorderrewarddetail` */

/*Table structure for table `purchasepayments` */

DROP TABLE IF EXISTS `purchasepayments`;

CREATE TABLE `purchasepayments` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `transdate` datetime DEFAULT NULL,
  `debit` double NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `discountpercent` double NOT NULL DEFAULT '0',
  `discountvalue` double NOT NULL DEFAULT '0',
  `duedate` date DEFAULT NULL,
  `accepted` smallint(6) NOT NULL DEFAULT '0',
  `kind` smallint(6) NOT NULL DEFAULT '0',
  `paymenttype` int(10) unsigned NOT NULL,
  `refpayment` varchar(30) NOT NULL,
  `currtrans` char(3) NOT NULL DEFAULT '',
  `ratedefault` double NOT NULL DEFAULT '0',
  `rateused` double NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `purchaseidref` (`purchaseidref`),
  KEY `paymenttype` (`paymenttype`),
  CONSTRAINT `purchasepayments_ibfk_1` FOREIGN KEY (`purchaseidref`) REFERENCES `purchase` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchasepayments_ibfk_2` FOREIGN KEY (`paymenttype`) REFERENCES `paymenttype` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchasepayments` */

/*Table structure for table `purchasepoint` */

DROP TABLE IF EXISTS `purchasepoint`;

CREATE TABLE `purchasepoint` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `transdate` datetime DEFAULT NULL,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `supplier` char(30) NOT NULL DEFAULT '',
  `qtyin` double NOT NULL DEFAULT '0',
  `qtyout` double NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `purchaseidref` (`purchaseidref`),
  KEY `supplier` (`supplier`),
  CONSTRAINT `FK_purchasepoint_1` FOREIGN KEY (`purchaseid`) REFERENCES `purchase` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchasepoint_2` FOREIGN KEY (`purchaseidref`) REFERENCES `purchase` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchasepoint_3` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchasepoint` */

/*Table structure for table `purchaserequisition` */

DROP TABLE IF EXISTS `purchaserequisition`;

CREATE TABLE `purchaserequisition` (
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchasedate` date DEFAULT NULL,
  `purchasetime` time DEFAULT NULL,
  `kind` int(11) NOT NULL DEFAULT '0',
  `supplierid` char(30) NOT NULL DEFAULT '',
  `currtrans` char(3) NOT NULL DEFAULT '',
  `ratedefault` double NOT NULL DEFAULT '0',
  `rateused` double NOT NULL DEFAULT '0',
  `memo` text,
  `memoedit` text,
  `division` char(10) NOT NULL DEFAULT '',
  `printed` smallint(6) NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchaseid`),
  KEY `division` (`division`),
  KEY `supplierid` (`supplierid`),
  CONSTRAINT `purchaserequisition_ibfk_1` FOREIGN KEY (`division`) REFERENCES `division` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaserequisition_ibfk_2` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaserequisition` */

/*Table structure for table `purchaserequisitiondetail` */

DROP TABLE IF EXISTS `purchaserequisitiondetail`;

CREATE TABLE `purchaserequisitiondetail` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `transdate` datetime DEFAULT NULL,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `productid` char(30) NOT NULL DEFAULT '',
  `snproduct` varchar(100) NOT NULL DEFAULT '',
  `expireddate` date DEFAULT NULL,
  `purchaseqty` double NOT NULL DEFAULT '0',
  `unit` char(10) NOT NULL DEFAULT '',
  `memo` text,
  `departement` char(10) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `productid` (`productid`),
  KEY `unit` (`unit`),
  KEY `departement` (`departement`),
  CONSTRAINT `purchaserequisitiondetail_ibfk_1` FOREIGN KEY (`purchaseid`) REFERENCES `purchaserequisition` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `purchaserequisitiondetail_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaserequisitiondetail_ibfk_3` FOREIGN KEY (`departement`) REFERENCES `departement` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `purchaserequisitiondetail_ibfk_4` FOREIGN KEY (`unit`) REFERENCES `units` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaserequisitiondetail` */

/*Table structure for table `purchaserewarddetail` */

DROP TABLE IF EXISTS `purchaserewarddetail`;

CREATE TABLE `purchaserewarddetail` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `transdate` datetime DEFAULT NULL,
  `purchaseid` char(30) NOT NULL DEFAULT '',
  `purchaseidref` char(30) NOT NULL DEFAULT '',
  `productid` char(30) NOT NULL DEFAULT '',
  `snproduct` varchar(100) NOT NULL DEFAULT '',
  `expireddate` date DEFAULT NULL,
  `purchaseqty` double NOT NULL DEFAULT '0',
  `returnqty` double NOT NULL DEFAULT '0',
  `unit` char(10) NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `grossamount` double NOT NULL DEFAULT '0',
  `taxid` tinyint(4) NOT NULL DEFAULT '0',
  `purchasetax` double NOT NULL DEFAULT '0',
  `returntax` double NOT NULL DEFAULT '0',
  `netamount` double NOT NULL DEFAULT '0',
  `memo` text,
  `departement` char(10) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transid`),
  KEY `purchaseid` (`purchaseid`),
  KEY `purchaseidref` (`purchaseidref`),
  KEY `productid` (`productid`),
  KEY `unit` (`unit`),
  KEY `departement` (`departement`),
  CONSTRAINT `FK_purchaserewarddetail_1` FOREIGN KEY (`purchaseid`) REFERENCES `purchase` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchaserewarddetail_2` FOREIGN KEY (`purchaseidref`) REFERENCES `purchase` (`purchaseid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchaserewarddetail_3` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchaserewarddetail_4` FOREIGN KEY (`unit`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_purchaserewarddetail_5` FOREIGN KEY (`departement`) REFERENCES `departement` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `purchaserewarddetail` */

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `salesid` char(30) NOT NULL DEFAULT '',
  `salesidref` char(30) NOT NULL DEFAULT '',
  `orderid` text,
  `deliveryorderid` text,
  `salesdate` date DEFAULT NULL,
  `salestime` time DEFAULT NULL,
  `kind` int(11) NOT NULL DEFAULT '1',
  `salestype` smallint(6) NOT NULL DEFAULT '0' COMMENT '0=CASH, 1=CASH ON DELIVERY, 2=CREDIT',
  `earlydiscdays` int(11) NOT NULL DEFAULT '0',
  `earlydiscvalue` double NOT NULL DEFAULT '0',
  `duedays` int(11) NOT NULL DEFAULT '0',
  `customerid` char(30) NOT NULL DEFAULT '',
  `currtrans` char(3) NOT NULL DEFAULT '',
  `ratedefault` double NOT NULL DEFAULT '0',
  `rateused` double NOT NULL DEFAULT '0',
  `salesmanid` char(30) NOT NULL DEFAULT '',
  `billto` char(30) NOT NULL DEFAULT '',
  `shipto` text,
  `salespercentdisc` double NOT NULL DEFAULT '0',
  `returnpercentdisc` double NOT NULL DEFAULT '0',
  `salesvaluedisc` double NOT NULL DEFAULT '0',
  `returnvaluedisc` double NOT NULL DEFAULT '0',
  `memo` text,
  `memoedit` text,
  `division` char(10) NOT NULL DEFAULT '',
  `printed` smallint(6) NOT NULL DEFAULT '0',
  `taxprinted` smallint(6) NOT NULL DEFAULT '0',
  `shipment` int(10) unsigned NOT NULL DEFAULT '1',
  `dateaccepted` datetime DEFAULT NULL,
  `accepted` smallint(6) NOT NULL DEFAULT '1',
  `paidinfull` smallint(6) NOT NULL DEFAULT '0',
  `paidinfulldate` date DEFAULT NULL,
  `paidinfullref` char(30) NOT NULL DEFAULT '',
  `taxprint` tinyint(1) NOT NULL DEFAULT '0',
  `taxprintid` varchar(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `posted` smallint(6) NOT NULL DEFAULT '1',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`salesid`),
  KEY `division` (`division`),
  KEY `salesmanid` (`salesmanid`),
  KEY `customerid` (`customerid`),
  KEY `shipment` (`shipment`),
  KEY `sales_ibfk_5` (`billto`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`division`) REFERENCES `division` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`salesmanid`) REFERENCES `salesman` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sales_ibfk_4` FOREIGN KEY (`shipment`) REFERENCES `shipments` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `sales_ibfk_5` FOREIGN KEY (`billto`) REFERENCES `customer` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sales` */

/*Table structure for table `salesman` */

DROP TABLE IF EXISTS `salesman`;

CREATE TABLE `salesman` (
  `id` char(30) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `salesmangroup` char(30) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `faximile` varchar(50) NOT NULL DEFAULT '',
  `mobilephone` varchar(50) NOT NULL DEFAULT '',
  `category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=PERSONAL, 1=COMPANY',
  `contactperson` varchar(100) NOT NULL DEFAULT '',
  `religion` int(10) unsigned NOT NULL DEFAULT '0',
  `birthdate` date DEFAULT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=MALE, 1=FEMALE',
  `email` varchar(100) NOT NULL DEFAULT '',
  `website` varchar(100) NOT NULL DEFAULT '',
  `creditlimit` double NOT NULL DEFAULT '0',
  `registerdate` datetime DEFAULT NULL,
  `activeuntil` datetime DEFAULT '2099-12-31 00:00:00',
  `country` char(3) NOT NULL DEFAULT '',
  `isactive` smallint(6) NOT NULL DEFAULT '1',
  `commisionrules` varchar(200) NOT NULL DEFAULT '',
  `payablecommacc` char(30) NOT NULL DEFAULT '',
  `expensecommacc` char(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` blob,
  PRIMARY KEY (`id`),
  KEY `salesmangroup` (`salesmangroup`),
  KEY `payablecommacc` (`payablecommacc`),
  KEY `expensecommacc` (`expensecommacc`),
  CONSTRAINT `salesman_ibfk_1` FOREIGN KEY (`salesmangroup`) REFERENCES `salesmangroup` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `salesman_ibfk_2` FOREIGN KEY (`payablecommacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `salesman_ibfk_3` FOREIGN KEY (`expensecommacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salesman` */

/*Table structure for table `salesmangroup` */

DROP TABLE IF EXISTS `salesmangroup`;

CREATE TABLE `salesmangroup` (
  `id` char(30) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `parent` char(30) NOT NULL DEFAULT '',
  `isgroup` smallint(6) NOT NULL DEFAULT '0',
  `commisionrules` varchar(200) NOT NULL DEFAULT '',
  `payablecommacc` char(30) NOT NULL DEFAULT '',
  `expensecommacc` char(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `payablecommacc` (`payablecommacc`),
  KEY `expensecommacc` (`expensecommacc`),
  CONSTRAINT `salesmangroup_ibfk_1` FOREIGN KEY (`payablecommacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `salesmangroup_ibfk_2` FOREIGN KEY (`expensecommacc`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salesmangroup` */

insert  into `salesmangroup`(`id`,`description`,`parent`,`isgroup`,`commisionrules`,`payablecommacc`,`expensecommacc`,`usercreate`,`useredit`,`updatetimestamp`) values 
('S1','SALESMAN I','',1,'','105.002','602.004','admin','','2022-09-07 09:48:47'),
('S11','Internal Kantor','S1',0,'','105.002','602.004','admin','','2022-09-07 09:48:47'),
('S2','SALESMAN II','',0,'','105.002','602.004','admin','','2022-09-07 09:48:47');

/*Table structure for table `shipments` */

DROP TABLE IF EXISTS `shipments`;

CREATE TABLE `shipments` (
  `id` int(10) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shipments` */

insert  into `shipments`(`id`,`name`,`description`,`usercreate`,`useredit`,`updatetimestamp`) values 
(0,'Tidak ada','','admin','','2022-09-07 09:48:46'),
(1,'TIKI','','admin','','2022-09-07 09:48:46'),
(2,'KILAT POS','','admin','','2022-09-07 09:48:46');

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `suppliergroup` char(30) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `faximile` varchar(50) NOT NULL DEFAULT '',
  `mobilephone` varchar(50) NOT NULL DEFAULT '',
  `category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=PERSONAL, 1=COMPANY',
  `contactperson` varchar(100) NOT NULL DEFAULT '',
  `religion` int(10) unsigned NOT NULL DEFAULT '0',
  `birthdate` datetime DEFAULT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=MALE, 1=FEMALE',
  `email` varchar(100) NOT NULL DEFAULT '',
  `website` varchar(100) NOT NULL DEFAULT '',
  `country` char(3) NOT NULL DEFAULT '',
  `creditlimit` double NOT NULL DEFAULT '0',
  `registerdate` datetime DEFAULT NULL,
  `activeuntil` datetime NOT NULL DEFAULT '2099-12-31 00:00:00',
  `taxid` varchar(50) NOT NULL DEFAULT '',
  `isactive` smallint(6) NOT NULL DEFAULT '1',
  `payableacc` char(30) NOT NULL DEFAULT '',
  `downpaymentacc` char(30) NOT NULL DEFAULT '',
  `rewardacc` char(30) NOT NULL,
  `purchasediscacc` char(30) NOT NULL DEFAULT '',
  `gainlosspayableacc` char(30) NOT NULL DEFAULT '',
  `termofpayment` varchar(30) NOT NULL DEFAULT '' COMMENT '2/10, n/30\nCOD (Cash On Delivery)',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` blob,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `suppliergroup` (`suppliergroup`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`suppliergroup`) REFERENCES `suppliergroup` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

insert  into `supplier`(`id`,`name`,`suppliergroup`,`address`,`telephone`,`faximile`,`mobilephone`,`category`,`contactperson`,`religion`,`birthdate`,`sex`,`email`,`website`,`country`,`creditlimit`,`registerdate`,`activeuntil`,`taxid`,`isactive`,`payableacc`,`downpaymentacc`,`rewardacc`,`purchasediscacc`,`gainlosspayableacc`,`termofpayment`,`usercreate`,`useredit`,`updatetimestamp`,`image`,`created_at`,`updated_at`,`deleted_at`) values 
('SP-00000000001','Hiskia Perdamen Pulungan','PR-00000000001','','','','',0,'',0,NULL,0,'','','',0,NULL,'2099-12-31 00:00:00','',1,'','','','','','','','','2022-09-12 12:29:12',NULL,'2022-09-09 16:42:31','2022-09-12 12:29:12','0000-00-00 00:00:00'),
('SP-00000000002','snowa','PR-00000000001','','','','',0,'',0,NULL,0,'','','',0,NULL,'2099-12-31 00:00:00','',1,'','','','','','','','','2022-09-09 16:43:42',NULL,'2022-09-09 16:43:42','2022-09-09 16:43:42','0000-00-00 00:00:00'),
('SP-00000000003','snowee','PR-00000000001','','','','',0,'',0,NULL,0,'','','',0,NULL,'2099-12-31 00:00:00','',1,'','','','','','','','','2022-09-09 16:51:01',NULL,'2022-09-09 16:51:01','2022-09-09 16:51:01','0000-00-00 00:00:00'),
('SP-00000000004','sparta','PR-00000000001','','','','',0,'',0,NULL,0,'','','',0,NULL,'2099-12-31 00:00:00','',1,'','','','','','','','','2022-09-12 13:42:33',NULL,'2022-09-12 13:42:33','2022-09-12 13:42:33','0000-00-00 00:00:00'),
('SP-00000000005','Spartakus','PR-00000000001','','','','',0,'',0,NULL,0,'','','',0,NULL,'2099-12-31 00:00:00','',1,'','','','','','','','','2022-09-12 14:12:50',NULL,'2022-09-12 14:04:17','2022-09-12 14:12:50','2022-09-12 14:12:50'),
('SP-00000000006','sparta','PR-00000000001','','','','',0,'',0,NULL,0,'','','',0,NULL,'2099-12-31 00:00:00','',1,'','','','','','','','','2022-09-13 09:17:26',NULL,'2022-09-13 09:17:26','2022-09-13 09:17:26','0000-00-00 00:00:00');

/*Table structure for table `suppliergroup` */

DROP TABLE IF EXISTS `suppliergroup`;

CREATE TABLE `suppliergroup` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT '',
  `parent` char(30) DEFAULT '',
  `isgroup` smallint(6) DEFAULT '0',
  `payableacc` char(30) DEFAULT '',
  `downpaymentacc` char(30) DEFAULT '',
  `rewardacc` char(30) DEFAULT '',
  `purchasediscacc` char(30) DEFAULT '',
  `gainlosspayableacc` char(30) DEFAULT '',
  `usercreate` char(16) DEFAULT '',
  `useredit` char(16) DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `suppliergroup` */

insert  into `suppliergroup`(`id`,`description`,`parent`,`isgroup`,`payableacc`,`downpaymentacc`,`rewardacc`,`purchasediscacc`,`gainlosspayableacc`,`usercreate`,`useredit`,`created_at`,`updated_at`,`deleted_at`) values 
('PR-00000000001','Supplier 1',NULL,NULL,NULL,NULL,'',NULL,NULL,'','','2022-09-09 16:39:49','2022-09-13 09:33:22','2022-09-13 09:34:45'),
('SG-00000000002','Supplier 2',NULL,NULL,NULL,NULL,'',NULL,NULL,'','','2022-09-13 09:35:43',NULL,NULL);

/*Table structure for table `taxes` */

DROP TABLE IF EXISTS `taxes`;

CREATE TABLE `taxes` (
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `percent` double NOT NULL DEFAULT '0',
  `inclusive` smallint(6) NOT NULL DEFAULT '0',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taxes` */

insert  into `taxes`(`id`,`name`,`description`,`percent`,`inclusive`,`usercreate`,`useredit`,`updatetimestamp`) values 
(0,'Non Pajak','Tidak dikenakan pajak',0,0,'admin','','2022-09-07 09:48:46'),
(1,'PPN','Pajak Pertambahan Nilai',10,0,'admin','','2022-09-07 09:48:46'),
(2,'PPN (inc)','Pajak Pertambahan Nilai Inklusif',10,1,'admin','','2022-09-07 09:48:46'),
(3,'PPNBM','Pajak Pertambahan Nilai Barang Mewah',40,0,'admin','','2022-09-07 09:48:46');

/*Table structure for table `units` */

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `unit` varchar(10) NOT NULL,
  `quantity` double NOT NULL DEFAULT '1',
  `qtyfrom` char(10) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `units` */

insert  into `units`(`id`,`unit`,`quantity`,`qtyfrom`,`description`,`usercreate`,`useredit`,`updatetimestamp`,`created_at`,`updated_at`,`deleted_at`) values 
('UN-00000000001','pcs',1,'','','','','2022-09-13 09:13:39','2022-09-13 09:10:32','2022-09-13 09:13:39',NULL),
('UN-00000000002','Lusin',1,'','','','','2022-09-13 09:18:07','2022-09-13 09:15:43','2022-09-13 09:18:07','2022-09-13 09:18:07'),
('UN-00000000003','Lusin',1,'','','','','2022-09-13 10:13:04','2022-09-13 10:13:04','2022-09-13 10:13:04',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
