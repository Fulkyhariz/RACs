# RACs : Rent A Cars
PROYEK AKHIR MATA KULIAH SISTEM BASIS DATA & PRAKTIKUM

################### Kelompok 3B ######################

1) Chusnul Nabila		-- 1906381621
2) Fulky Hariz Zulkarnaen	-- 1906355762
3) Fathurrahman Irwansa 	-- 1906381501
4) Putri Aditya Pratama		-- 1906381602

Pada proyek akhir yang kami buat menggunakan:
1) XAMPP sebagai Environmentnya
2) CodeIgniter sebagai Frameworknya

# PENGGUNAAN XAMPP
1) Install XAMPP
2) Pada bagian Module Apache, tekan config
3) Pilih php.ini dan cari extension=pdo_pgsql , extension=pdo_sqlite , extension=pgsql
4) Hapus tanda ";" yang terletak di depan ketiga extension tersebut
5) Save file php.ini
6) Start module Apache

# INSTALASI PADA LOCALHOST
1) Download semua file/code pada repository ini
2) Extract File hasil download pada folder xampp/htdocs/
3) Ubah nama folder hasil extract menjadi 'car'
4) Nyalakan XAMPP sebagai environmentnya
5) Buatlah database dengan nama "rental"
6) Connect ke database "rental" dengan command \c rental;
7) Import file RACs.sql dengan menggunakan command \i 'file path'

   contoh:
   
   \i 'C:/Users/Public/Documents/RACs.sql'
   
   atau
   
   \i 'C:/xampp/htdocs/car/RACs.sql'
7) Buka Web Browser dan jalankan localhost/car/

# SAMPLE ACCOUNT DI SISTEM
Admin: 

	username : admin

	password : admin

Karyawan:

	username : hariz

	password : admin

Customer:

	username : fulkyhzas

	password : admin

