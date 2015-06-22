#SugarCRM CE üres install fejlesztői, tesztelői célokra

Az alábbi telepítési instrukciókat követve egy friss telepítés utáni állapotot kapunk. A telepítési instrukciók alapján telepített rendszer csak és kizárólag tesztelési és fejlesztési célokra szolgál, **éles környezetben való futtatásra nem alkalmas.**

##Telepítés

A telepítéshez szükség lesz MySQL szerverre és konfigurált Apache+PHP környezetre, tovább git verziókövetőre. A telepítési instrukciók linux terminált feltételeznek, de egyéb OS vagy grafikus eszközök segítségével is egyszerűen követhetők.

A telepítési lépések nem tartalmazzák saját VirtualHost létrehozását.

1. Adatbázis és adatbázis felhasználó létrehozása tetszőleges névvel.
2. Projekt klónozása webrootból:
```
$ git clone https://github.com/soulware-ltd/sugarCRMtest.git
$ cd sugarCRMtest
```
3. Konfigurációs fájl másolása, adatbázis beállítása
```
$ cp config.default.php config.php
$ nano config.php
```
A config.php-ban a `'dbconfig'` index-nél az adatbázis beállítások megadása:
```
<?php
...
'dbconfig' => 
  array (
    'db_host_name' => '',
    'db_host_instance' => 'SQLEXPRESS',
    'db_user_name' => '',
    'db_password' => '',
    'db_name' => '',
    'db_type' => 'mysql',
    'db_port' => '',
    'db_manager' => 'MysqliManager',
  ),
...
```
4. Jogosultságok beállítása (Windows alatt nincs rá szükség, eltérő rendszereken a webszerver felhasználója eltérhet)
```
$ cd ..
$ chown www-data:www-data -R sugarCRMtest
$ chmod 755 -R sugarCRMtest
$ cd sugarCRMtest
```
5. Üres adatbázis betöltése (ha nem localhoston van a MySQL szerver, -h opcióval hoszt megadása is szükséges)
```
$ mysql -u [user] -p [dbname] < sql/2015-06-22-test.sql 
```
6. A böngészőből elérhető az alkalmazás a http://localhost/sugarCRMtest URL alatt
7. Bejelentkezés admin/admin felhasználónév és jelszó párossal
