MariaDB [(none)]> create databse CounterHp;
Query OK, 1 row affected (0,01 sec)

MariaDB [(none)]> use CounterHp;
Database changed

MariaDB [counterHp]> create table pegawai(
    -> IdPeg            INT		NOT NULL        PRIMARY KEY,
    -> NmPeg            VARCHAR(50)     NOT NULL,
    -> AlmtPeg          VARCHAR(60)     NOT NULL,
    -> TlpPeg           INT             NOT NULL);
Query OK, 0 rows affected (0.46 sec)

MariaDB [counterHp]> create table customer(
    -> IdCust           INT		NOT NULL        PRIMARY KEY,
    -> NmCust           VARCHAR(50)     NOT NULL,
    -> AlmtCust         VARCHAR(60)     NOT NULL,
    -> TlpCust          INT             NOT NULL);
Query OK, 0 rows affected (0.40 sec)

MariaDB [counterHp]> create table hp(
    -> IdHp             VARCHAR(10)     NOT NULL        PRIMARY KEY,
    -> Merk             VARCHAR(40)     NOT NULL,
    -> Seri             VARCHAR(30)     NOT NULL,
    -> Stok             INT             NOT NULL,
    -> Harga		INT		NOT NULL);
Query OK, 0 rows affected (0.87 sec)

MariaDB [CounterHp]> create table transaksi(
    -> IdTrans          INT		NOT NULL        PRIMARY KEY,
    -> IdHp             VARCHAR(10)     NOT NULL,
    -> IdCust           VARCHAR(10)     NOT NULL,
    -> IdPeg            VARCHAR(10)     NOT NULL,
    -> Tanggal          DATE            NOT NULL,
    -> Qty              INt             NOT NULL,
    -> HargaJual        INT             NOT NULL,
    -> FOREIGN KEY(IdHp) REFERENCES hp(IdHp),
    -> FOREIGN KEY(IdCust) REFERENCES customer(IdCust),
    -> FOREIGN KEY(IdPeg) REFERENCES pegawai(IdPeg));
Query OK, 0 rows affected (0.35 sec)

MariaDB [counterHp]> insert into pegawai values(
    -> '18001','Aris K','Kalitirto Berbah','08564341167'),
    -> ('18002','Joko W','Sambisari Kalasan','081233344174'),
    -> ('18003','Rudi R','Sambiroto Kalasan','085747882252');
Query OK, 3 rows affected, 3 warnings (0.17 sec)
Records: 3  Duplicates: 0  Warnings: 3

MariaDB [CounterHp]> insert into hp values(
    -> 'S6E','Samsung','Galaxy S6 Edge','4','5000000'),
    -> ('S6+','Samsung','Galaxy S6 Plus','2','6000000'),
    -> ('S6N','Samsung','Galaxy S6 Note','2','6500000'),
    -> ('S7E','Samsung','Galaxy S7 Edge','3','7000000'),
    -> ('S8E','Samsung','Galaxy S8 Edge','2','8000000'),
    -> ('6S','Aple','Iphone 6S','4','4000000'),
    -> ('6+','Aple','Iphone 6+','2','5000000'),
    -> ('7S','Aple','Iphone 7S','2','8000000'),
    -> ('N4X','Xiaomi','MI Note 4x','4','2000000'),
    -> ('X5','Xiaomi','MI 5','3','3000000'),
    -> ('N5','Xiaomi','MI Note 5','3','4000000');
Query OK, 11 rows affected (0.14 sec)
Records: 11  Duplicates: 0  Warnings: 0

MariaDB [CounterHp]> insert into customer values(
    -> '001','Ari Wibowo','Jetak Purwomartani','085643404351'),
    -> ('002','Ririn Haryati','Sambiroto Purwomartani','085747225523'),
    -> ('003','Andreas H','Bantul','081267891234');
Query OK, 3 rows affected, 3 warnings (0.18 sec)
Records: 3  Duplicates: 0  Warnings: 3

MariaDB [CounterHp]> insert into transaksi values(
    -> '1','S6+','001','18001','2018-07-02','1','6000000'),
    -> ('2','6S','002','18001','2018-07-02','1','4000000'),
    -> ('3','S7E','003','18002','2018-07-03','1','7000000');
Query OK, 3 rows affected (0.12 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [CounterHp]> select a.Tanggal, b.NmPeg, c.NmCust, d.Merk, e.Seri, f.Qty, g.HargaJual
    -> from transaksi a join pegawai b on a.Idpeg=b.IdPeg
    -> join customer c on c.IdCust=a.IdCust
    -> join hp d on d.IdHp=a.IdHp
    -> join hp e on e.IdHp=a.IdHp
    -> join transaksi f on f.IdTrans=a.IdTrans
    -> join transaksi g on g.IdTrans=a.IdTrans;
+------------+--------+---------------+---------+----------------+-----+-----------+
| Tanggal    | NmPeg  | NmCust        | Merk    | Seri           | Qty | HargaJual |
+------------+--------+---------------+---------+----------------+-----+-----------+
| 2018-07-02 | Aris K | Ari Wibowo    | Samsung | Galaxy S6 Plus |   1 |   6000000 |
| 2018-07-02 | Aris K | Ririn Haryati | Aple    | Iphone 6S      |   1 |   4000000 |
| 2018-07-03 | Joko W | Andreas H     | Samsung | Galaxy S7 Edge |   1 |   7000000 |
+------------+--------+---------------+---------+----------------+-----+-----------+
3 rows in set (0.00 sec)

select a.Tanggal, b.NmPeg, c.NmCust, d.Merk, d.Seri, a.Qty, a.HargaJual
from transaksi a join pegawai b on a.Idpeg=b.IdPeg
join customer c on c.IdCust=a.IdCust
join hp d on d.IdHp=a.IdHp;


