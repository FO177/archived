@echo off
:aturwindows
title Isi IHS
color 08
mode con: cols=100 lines=30

:menu000
cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------------------------------------
echo  # Menu Utama #
echo  --------------
echo  1. Update Status Satker
echo  2. Cek Status Satker
echo  3. Ubah Data Satker
echo  4. Petunjuk
echo  5. Keluar
echo ------------------------------------------------------------
echo  Silahkan masukan menu, lalu tekan ENTER

set /p pilihmenu= [INPUT]:
IF %pilihmenu%==1 (goto :menu100)
IF %pilihmenu%==2 (goto :menu200)
IF %pilihmenu%==3 (goto :menu300)
IF %pilihmenu%==4 (goto :menu400)
IF %pilihmenu%==5 (goto :menu999)
echo  zzzzz
echo  ERROR: Pilihan Menu Salah!

echo  zzzzz
goto :menu000
echo ------------------------------batas-menu----------------------------------------------------------------------



:menu100
cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------------------------------------
echo  # Menu Update Status Satker#
echo ------------------------------------------------------------
echo.
echo  Petunjuk:
echo  1. Masukan kode satker, 2. Cek status saat ini
echo  2. Masukan status satker: [1] SUDAH, [2] BELUM, [3] TELAT, [4] TIDAK ADA DATA
echo.
set /p kdstkr= [Kode Satker]: 
echo.
IF exist status\s%kdstkr%.md (
  goto :menu110
  ) ELSE (
  echo Satker %kdstkr% belum ada status, silahkan langsung update & goto :menu11a
  )

:menu110
echo  STATUS SATKER %kdstkr% SAAT INI:
echo.
FINDSTR sGJIND status\s%kdstkr%.md
FINDSTR sPPNPN status\s%kdstkr%.md
FINDSTR sLSREK status\s%kdstkr%.md
FINDSTR sLPJBD status\s%kdstkr%.md
FINDSTR sLPJBP status\s%kdstkr%.md
FINDSTR sREKON status\s%kdstkr%.md
echo.

:menu11a
set /p ssGJIND= [Status SPM Gaji Induk PNS]:
IF %ssGJIND%==1 (set sGJIND=SUDAH & goto :menu11b)
IF %ssGJIND%==2 (set sGJIND=BELUM & goto :menu11b)
IF %ssGJIND%==3 (set sGJIND=TELAT & goto :menu11b)
IF %ssGJIND%==4 (set sGJIND=TIDAK & goto :menu11b)

echo ---------------batas-sub-menu-----

:menu11b
set /p ssPPNPN= [Status SPM Gaji PPNPN]: 
IF %ssPPNPN%==1 (set sPPNPN=SUDAH & goto :menu11c)
IF %ssPPNPN%==2 (set sPPNPN=BELUM & goto :menu11c)
IF %ssPPNPN%==3 (set sPPNPN=TELAT & goto :menu11c)
IF %ssPPNPN%==4 (set sPPNPN=TIDAK & goto :menu11c)

echo ---------------batas-sub-menu-----

:menu11c
set /p ssLSREK= [Status Lap. Saldo Rekening]: 
IF %ssLSREK%==1 (set sLSREK=SUDAH & goto :menu11d)
IF %ssLSREK%==2 (set sLSREK=BELUM & goto :menu11d)
IF %ssLSREK%==3 (set sLSREK=TELAT & goto :menu11d)
IF %ssLSREK%==4 (set sLSREK=TIDAK & goto :menu11d)

echo ---------------batas-sub-menu-----

:menu11d
set /p ssLPJBD= [Status LPJ Bend. Pengeluaran]: 
IF %ssLPJBD%==1 (set sLPJBD=SUDAH & goto :menu11e)
IF %ssLPJBD%==2 (set sLPJBD=BELUM & goto :menu11e)
IF %ssLPJBD%==3 (set sLPJBD=TELAT & goto :menu11e)
IF %ssLPJBD%==4 (set sLPJBD=TIDAK & goto :menu11e)

echo ---------------batas-sub-menu-----

:menu11e
set /p ssLPJBP= [Status LPJ Bend. Penerimaan]: 
IF %ssLPJBP%==1 (set sLPJBP=SUDAH & goto :menu11f)
IF %ssLPJBP%==2 (set sLPJBP=BELUM & goto :menu11f)
IF %ssLPJBP%==3 (set sLPJBP=TELAT & goto :menu11f)
IF %ssLPJBP%==4 (set sLPJBP=TIDAK & goto :menu11f)

echo ---------------batas-sub-menu-----

:menu11f
set /p ssREKON= [Status Rekonsiliasi Eksternal]: 
IF %ssREKON%==1 (set sREKON=SUDAH & goto :menu11x)
IF %ssREKON%==2 (set sREKON=BELUM & goto :menu11x)
IF %ssREKON%==3 (set sREKON=TELAT & goto :menu11x)
IF %ssREKON%==4 (set sREKON=TIDAK & goto :menu11x)
pause

echo ---------------batas-sub-menu-----

:menu11x
echo ---> status\s%kdstkr%.md
echo layout: ssatker>> status\s%kdstkr%.md
echo title: Status Satker %kdstkr%>> status\s%kdstkr%.md
echo permalink: ./status/%kdstkr%/>> status\s%kdstkr%.md
echo sGJIND: %sGJIND%>> status\s%kdstkr%.md
echo sPPNPN: %sPPNPN%>> status\s%kdstkr%.md
echo sLSREK: %sLSREK%>> status\s%kdstkr%.md
echo sLPJBD: %sLPJBD%>> status\s%kdstkr%.md
echo sLPJBP: %sLPJBP%>> status\s%kdstkr%.md
echo sREKON: %sREKON%>> status\s%kdstkr%.md
echo --->> status\s%kdstkr%.md
echo.
echo.
echo  STATUS SUDAH DIUPDATE
goto :menu210
echo ------------------------------batas-menu----------------------------------------------------------------------



:menu200
cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------------------------------------
echo  # Menu Cek Status Satker#
echo ------------------------------------------------------------
echo.
set /p kdstkr= [Kode Satker]: 
echo.
goto :menu210

:menu210
echo  STATUS SATKER %kdstkr% SAAT INI:
echo.
FINDSTR sGJIND status\s%kdstkr%.md
FINDSTR sPPNPN status\s%kdstkr%.md
FINDSTR sLSREK status\s%kdstkr%.md
FINDSTR sLPJBD status\s%kdstkr%.md
FINDSTR sLPJBP status\s%kdstkr%.md
FINDSTR sREKON status\s%kdstkr%.md
echo.
echo.
set /p menu200= Input [1] Cek Status Satker Lain, Input [2] Kembali ke Menu Awal: 
IF %menu200%==1 (goto :menu200)
IF %menu200%==2 (goto :menu000)
echo ------------------------------batas-menu----------------------------------------------------------------------



:menu300
cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------------------------------------
echo  # Menu Ubah Data Satker#
echo  ----------------------------------------
echo  1. Lihat Daftar Satker
echo  2. Tambah Data Satker
echo  3. Ubah Data Satker
echo  4. Hapus Data Satker
echo  5. Menu Utama
echo  6. Keluar
echo ------------------------------------------------------------
echo  Silahkan masukan menu, lalu tekan ENTER
set /p pilihmenu= [INPUT]:
IF %pilihmenu%==1 (goto :menu310)
IF %pilihmenu%==2 (goto :menu320)
IF %pilihmenu%==3 (goto :menu330)
IF %pilihmenu%==4 (goto :menu340)
IF %pilihmenu%==5 (goto :menu000)
IF %pilihmenu%==6 (goto :menu990)
echo  zzzzz
echo  ERROR: Pilihan Menu Salah!
echo  zzzzz
goto :menu300
echo ---------------batas-sub-menu-----

:menu310
cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------------------------------------
echo  # Menu Ubah Data Satker: Lihat Daftar Satker#
echo ------------------------------------------------------------
echo.
echo  ---Awal Data Satker---
echo.
echo kode   nama satker
echo ------ ------------
type datasatker.txt
echo.
echo  ---Akhir Data Satker---
echo. 
set /p pmenu310= Tekan enter untuk kembali
goto :menu300
echo ---------------batas-sub-menu-----

:menu320
cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------------------------------------
echo  # Menu Ubah Data Satker: Tambah Data Satker#
echo ------------------------------------------------------------
echo.
echo  Petunjuk:
echo  1. Masukan Kode Satker
echo  2. Masukan Nama Satker
echo  3. Cek Data
echo     Jika Salah, Silahkan Ubah
echo     Jika Benar, Silahkan Setujui
echo.
set /p kdstkr= [Kode Satker]: 
set /p nmstkr= [Nama Satker]: 
echo.
echo  Anda akan menambah:
echo. 
echo  Kode Satker: "%kdstkr%" dengan Nama Satker: "%nmstkr%"
echo.
set /p menu320= Tekan 1 jika benar, tekan 0 jika ingin mengubah:
IF %menu320%==1 (goto :menu32x)
IF %menu320%==0 (goto :menu320)
echo ---------------batas-sub-sub-menu-----

:menu32x
echo %kdstkr% %nmstkr% >> datasatker.txt
echo Data Sudah Ditambah...
PAUSE >> tmp.tmp
goto :menu322
echo ---------------batas-sub-sub-menu-----

:menu322
cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------------------------------------
echo  # Menu Ubah Data Satker: Tambah Data Satker#
echo ------------------------------------------------------------
echo.
echo  Anda sudah menambah data satker, silahkan cek di bawah:
echo.
echo  ---Awal Data Satker---
echo.
echo kode   nama satker
echo ------ ------------
type datasatker.txt
echo.
echo  ---Akhir Data Satker---
echo. 
echo Tekan Enter untuk Kembali..
PAUSE >> tmp.tmp
goto :menu300

:menu330
cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------------------------------------
echo  # Menu Ubah Data Satker: Ubah Data Satker#
echo ------------------------------------------------------------
echo.
echo  Dalam Pengembangan
echo.
echo. 
set /p pmenu320= Tekan enter untuk kembali
goto :menu300
echo ---------------batas-sub-menu-----

:menu340
cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------------------------------------
echo  # Menu Ubah Data Satker: Hapus Data Satker#
echo ------------------------------------------------------------
echo.
echo  Dalam Pengembangan
echo.
echo. 
set /p pmenu340= Tekan enter untuk kembali
goto :menu300
echo ------------------------------batas-menu----------------------------------------------------------------------



:menu400
cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------------------------------------
echo  # Menu Petunjuk #
echo ------------------------------------------------------------
echo.
echo  Dalam Pengembangan
echo.
echo. 
set /p pmenu340= Tekan enter untuk kembali
goto :menu300
echo ------------------------------batas-menu----------------------------------------------------------------------



:menu999
cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR 
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ##
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ####
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ######
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ########
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ##########
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ############
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ############
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ##############
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ################
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ##################
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ####################
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

cls
echo.
echo   IHS-ISI.bat [versi 0.1]
echo ------------------------------
echo  KELUAR ######################
echo ------------------------------
TIMEOUT /T 1 >> tmp.tmp

del >> tmp.tmp
exit
echo ------------------------------batas-menu----------------------------------------------------------------------


echo MENTOKKKK