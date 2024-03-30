# Modul 1
## Shell Scripting, Cron, dan AWK

- Agnes Zenobia Griselda Petrina (5027231034)
- Muhammad Nafi Firdaus (5027231045)
- Rafika Az Zahra Kusumastuti (5027231050)

  ## Soal 1
Cipung dan abe ingin mendirikan sebuah toko bernama “SandBox”, sedangkan kamu adalah manajer penjualan yang ditunjuk oleh Cipung dan Abe untuk melakukan pelaporan penjualan dan strategi penjualan kedepannya yang akan dilakukan.
Setiap tahun Cipung dan Abe akan mengadakan rapat dengan kamu untuk mengetahui laporan dan strategi penjualan dari “SandBox”. Buatlah beberapa kesimpulan dari data penjualan “Sandbox.csv” untuk diberikan ke cipung dan abe 

a. Karena Cipung dan Abe baik hati, mereka ingin memberikan hadiah kepada customer yang telah belanja banyak. Tampilkan nama pembeli dengan total sales paling tinggi

b. Karena  Cipung dan Abe ingin mengefisienkan penjualannya, mereka ingin merencanakan strategi penjualan untuk customer segment yang memiliki profit paling kecil. Tampilkan customer segment yang memiliki profit paling kecil

c. Cipung dan Abe hanya akan membeli stok barang yang menghasilkan profit paling tinggi agar efisien. Tampilkan 3 category yang memiliki total profit paling tinggi 

d. Karena ada seseorang yang lapor kepada Cipung dan Abe bahwa pesanannya tidak kunjung sampai, maka mereka ingin mengecek apakah pesanan itu ada. Cari purchase date dan amount (quantity) dari nama adriaens

  ## Penyelesaian
1. Buat folder bernama "soal_1"
2. Tampilkan apakah sudah ada atau belum foldernya menggunakan command `ls`
3. Pindah direktori ke file "soal_1"
4. Setelah masuk di folder "soal_1", kita download file yang dibutuhkan
   ```
   wget -O Sandbox.csv 'https://drive.google.com/uc?download=export&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0'
   ```
   Command di atas menggunakan :
   - `wget` untuk mengunduh file
   - `-O` untuk mengubah nama file yang telah di download dan menyimpannya sebagai `Sandbox.csv`
   - dari link google drive `https://drive.google.com/uc?download=export&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0`
  
6. Tampilkan apakah sudah ada atau belum filenya menggunakan command `ls`
7. Tampilkan isi dari file "Sandbox.csv" menggunakan
   ```
   cat Sandbox.csv
   ```
   
9. Lanjut ke soal poin A. Kita disuruh menampilkan nama pembeli dengan total sales tertinggi
    ```
    awk -F ',' '{print
    ```
    Command di atas menggunakan :
   - `awk -F ','` digunakan untuk membaca baris lalu memisah tiap bagian di baris yang dipisah dengan (,)
   - `'{print $
  
11. Lanjut ke soal poin B.  Kita disuruh menampilkan customer segment dengan profit terkecil
    ## Revisi
    Terdapat revisi pada fungsi `'{print}`
    ```
    awk -F ',' '{print $20, $7}' Sandbox.csv | sort -k1 | head -n 1 | awk '{print $2, $3}'
    ```
    Command di atas menggunakan :
    - `awk -F ','` digunakan untuk membaca baris lalu memisah tiap bagian di baris yang dipisah dengan (,)
    - `'{print $20, $7}' Sandbox.csv` digunakan untuk mencetak kolom ke-20 dan ke-7 dari file `Sandbox.csv`
    - `sort -k1` digunakan untuk mengambil output dari perintah `awk` dan mengurutkannya berdasarkan kolom pertama dari kolom ke-20 dari file `Sandbox.csv` dan mengarahkan outputnya ke perintah selanjutnya
    - `head -n 1` digunakan untuk mengambil output dari perintah `sort` dan menampilkan satu baris pertama
    - `awk '{print $2, $3}'` digunakan untuk mengambil output dari hasil perintah `head` dan mencetak nilai kolom kedua dan ketiga dari baris dengan nilai terkecil di kolom pertama dari kolom ke-20 dan ke-7 dari file `Sandbox.csv`
  
13. Lanjut ke soal poin C. Kita disuruh menampilkan 3 kategori dengan tottal profit tertinggi
    ```
    awk -F ',' '{print $
    ```
    Command di atas menggunakan :
    - `awk -F ','` digunakan untuk membaca baris lalu memisah tiap bagian di baris yang dipisah dengan (,)
    - `'{print $
  
14. Lanjut ke soal poin D. Kita disuruh menampilkan purchase date dan quantity dari nama adriaens
    ```
    grep "Adriaens" Sandbox.csv | awk -F ',' '{print "Purchase date :", $2, "dan Quantity :", $18, "dari Nama Adriaens :", $6"}'
    ```
    Command di atas menggunakan :
    - `grep "Adriaens" Sandbox.csv` untuk mencari pola/baris Adriaens dalam file Sandbox.csv dan ditampilkan pola/barisnya
    - `awk -F ','` digunakan untuk membaca baris lalu memisah tiap bagian di baris yang dipisah dengan (,)
    - `'{print "Purchase date :", $2, "dan Quantity :", $18, "dari Nama Adriaens :", $6"}'` untuk mencetak informasi tanggal pembelian pada kolom kedua, jumlah pada kolom kedelapan belas dari nama adriaens pada kolom keenam untuk setiap pembelian yang terkait dengan "Adriaens" dalam file `Sandbox.csv`.


   ## Output

  ## Soal 2
Oppie merupakan seorang peneliti bom atom, ia ingin merekrut banyak peneliti lain untuk mengerjakan proyek bom atom nya, Oppie memiliki racikan bom atom rahasia yang hanya bisa diakses penelitinya yang akan diidentifikasi sebagai user, Oppie juga memiliki admin yang bertugas untuk memanajemen peneliti,  bantulah oppie untuk membuat program yang akan memudahkan tugasnya 
Buatlah 2 program yaitu login.sh dan register.sh. Setiap admin maupun user harus melakukan register terlebih dahulu menggunakan email, username, pertanyaan keamanan dan jawaban, dan password

Username yang dibuat bebas, namun email bersifat unique. setiap email yang mengandung kata admin akan dikategorikan menjadi admin 

Karena resep bom atom ini sangat rahasia Oppie ingin password nya memuat keamanan tingkat tinggi

- Password tersebut harus di encrypt menggunakan base64

- Password yang dibuat harus lebih dari 8 karakter

- Harus terdapat paling sedikit 1 huruf kapital dan 1 huruf kecil

- Harus terdapat paling sedikit 1 angka

Karena Oppie akan memiliki banyak peneliti dan admin ia berniat untuk menyimpan seluruh data register yang ia lakukan ke dalam folder users file users.txt. Di dalam file tersebut, terdapat catatan seluruh email, username, pertanyaan keamanan dan jawaban, dan password hash yang telah ia buat.
Setelah melakukan register, program harus bisa melakukan login. Login hanya perlu dilakukan menggunakan email dan password.
Karena peneliti yang di rekrut oleh Oppie banyak yang sudah tua dan pelupa maka Oppie ingin ketika login akan ada pilihan lupa password dan akan keluar pertanyaan keamanan dan ketika dijawab dengan benar bisa memunculkan password

Setelah user melakukan login akan keluar pesan sukses, namun setelah seorang admin melakukan login Oppie ingin agar admin bisa menambah, mengedit (username, pertanyaan keamanan dan jawaban, dan password), dan menghapus user untuk memudahkan kerjanya sebagai admin. 
Ketika admin ingin melakukan edit atau hapus user, maka akan keluar input email untuk identifikasi user yang akan di hapus atau di edit
Oppie ingin programnya tercatat dengan baik, maka buatlah agar program bisa mencatat seluruh log ke dalam folder users file auth.log, baik login ataupun register.
Format: [date] [type] [message]
Type: REGISTER SUCCESS, REGISTER FAILED, LOGIN SUCCESS, LOGIN FAILED
Ex:
[23/09/17 13:18:02] [REGISTER SUCCESS] user [username] registered successfully
[23/09/17 13:22:41] [LOGIN FAILED] ERROR Failed login attempt on user with email [email]

# Penyelesaian `register.sh`

Script ini adalah sebuah skrip bash yang memungkinkan registrasi pengguna dengan memasukkan informasi seperti email, username, pertanyaan keamanan, jawaban keamanan, dan password. Berikut penjelasan dari setiap bagian kode:

## Fungsi encrypt_password()

```
encrypt_password() {
    echo -n "$1" | base64
}
```

Fungsi ini digunakan untuk mengenkripsi password menggunakan base64. Enkripsi yang dilakukan sederhana dan hanya menggunakan base64, dan pada catatan kode disebutkan bahwa enkripsi ini nantinya akan digantikan dengan metode hashing yang lebih aman.

## Fungsi check_duplicate_email()

```
check_duplicate_email() {
    local email=$1
    grep -q "^$email:" users.txt
    return $?
}
```

Fungsi ini bertugas untuk memeriksa apakah email yang dimasukkan sudah terdaftar sebelumnya. Fungsi menggunakan grep untuk mencari email di dalam file `users.txt`. Jika email ditemukan, fungsi mengembalikan kode keluaran 0 yang menandakan email sudah terdaftar, jika tidak ditemukan, fungsi mengembalikan kode keluaran 1.

## Fungsi register_user()

```
register_user() {
    local email=$1
    local username=$2
    local security_question=$3
    local security_answer=$4
    local password=$5
    local user_type="user"  # Default user type

    if [[ "$email" == *admin* ]]; then
        user_type="admin"
    fi
    
    encrypted_password=$(encrypt_password "$password")

    check_duplicate_email "$email"
    if [ $? -eq 0 ]; then
        echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [REGISTER FAILED] Email $email already registered." >> auth.log
        echo "Email $email already registered. Please choose another email."
        exit 1
    fi

    echo "$email:$username:$security_question:$security_answer:$encrypted_password:$user_type" >> users.txt

    if [[ $user_type == "admin" ]]; then
        echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [REGISTER SUCCESS] Admin $username registered successfully." >> auth.log
        echo "Admin $username registered successfully."
    else
        echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [REGISTER SUCCESS] User $username registered successfully." >> auth.log
        echo "User $username registered successfully."
    fi
}
```

Fungsi ini melakukan proses registrasi pengguna. Pertama-tama, fungsi ini menerima input berupa email, username, pertanyaan keamanan, jawaban keamanan, dan password dari pengguna. Kemudian, fungsi ini memeriksa apakah email mengandung kata "admin" dan menetapkan jenis pengguna (user atau admin) berdasarkan hal tersebut. Selanjutnya, password dienkripsi menggunakan fungsi `encrypt_password()`. Setelah itu, fungsi memeriksa apakah email sudah terdaftar menggunakan fungsi `check_duplicate_email()`. Jika email sudah terdaftar, registrasi gagal dan program keluar dengan pesan kesalahan. Jika email belum terdaftar, informasi pengguna ditambahkan ke file `users.txt`, dan pesan registrasi sukses ditampilkan.

## Bagian Utama Kode

```
touch users.txt

echo "=== User Registration ==="
read -p "Email: " email
read -p "Username: " username
read -p "Security Question: " security_question
read -p "Security Answer: " security_answer
read -sp "Password: " password
echo

while true; do
    if [[ ${#password} -lt 8 || !("$password" =~ [[:lower:]]) || !("$password" =~ [[:upper:]]) || !("$password" =~ [0-9]) ]]; then
        echo "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit."
        read -sp "Password: " password
        echo
    else
        break
    fi
done

register_user "$email" "$username" "$security_question" "$security_answer" "$password"
```

Bagian utama kode berisi alur utama registrasi pengguna. Pengguna diminta untuk memasukkan informasi seperti email, username, pertanyaan keamanan, jawaban keamanan, dan password. Kemudian, password diverifikasi agar memenuhi kriteria tertentu seperti panjang minimal, mengandung huruf besar, huruf kecil, dan angka. Jika password tidak memenuhi kriteria, pengguna diminta untuk memasukkan ulang password. Setelah itu, fungsi `register_user()` dipanggil untuk melakukan proses registrasi.

Selain itu, script ini juga mencatat kejadian registrasi pengguna ke dalam file `auth.log`, baik itu berhasil maupun gagal.

# Penyelesaian `login.sh`

Kode di bawah adalah skrip Bash yang menyediakan fungsi untuk melakukan login, mengelola pengguna, serta pemulihan password. Berikut adalah penjelasan singkat tentang bagaimana kode ini bekerja:

## Fungsi `decrypt_password()`

```
decrypt_password() {
    echo "$1" | base64 -d
}
```

Fungsi ini digunakan untuk mendekripsi password yang telah dienkripsi sebelumnya menggunakan base64. Parameter fungsi adalah password yang dienkripsi dalam format base64. Fungsi ini mengembalikan password yang sudah didekripsi.

## Fungsi `check_credentials()`

```
check_credentials() {
    local email=$1
    local password=$2
    local stored_password=$(grep "^$email:" users.txt | cut -d: -f5)
    local is_admin=$(grep "^$email:" users.txt | cut -d: -f6)
```

Fungsi ini digunakan untuk memeriksa apakah email dan password yang dimasukkan oleh pengguna cocok dengan informasi yang tersimpan dalam file `users.txt`. Parameter fungsi adalah email dan password yang dimasukkan pengguna. Fungsi ini membaca file `users.txt` untuk mendapatkan password yang sesuai dengan email yang diberikan, kemudian membandingkan password yang dimasukkan pengguna dengan password yang ada di file. Jika cocok, fungsi mengembalikan nilai `0`, dan jika tidak cocok, fungsi mengembalikan nilai `1`.

```
stored_password_decrypted=$(decrypt_password "$stored_password")

    if [ "$password" == "$stored_password_decrypted" ]; then
        return 0
    else
        return 1
    fi
}
```

## Fungsi `forgot_password()`

```
forgot_password() {
    local email=$1
    local security_question=$(grep "^$email:" users.txt | cut -d: -f3)
    local correct_answer=$(grep "^$email:" users.txt | cut -d: -f4)

    read -p "Security Question: $security_question " user_answer

    if [ "$user_answer" == "$correct_answer" ]; then
        local stored_password=$(grep "^$email:" users.txt | cut -d: -f5)
        stored_password_decrypted=$(decrypt_password "$stored_password")
        echo "Your password is: $stored_password_decrypted"
    else
        echo "Incorrect answer."
    fi
}
```

Fungsi ini digunakan ketika pengguna lupa password mereka. Fungsi ini akan menampilkan pertanyaan keamanan yang sudah ditetapkan sebelumnya untuk pengguna tersebut. Jika jawaban yang dimasukkan pengguna cocok dengan yang ada di file `users.txt`, maka fungsi akan menampilkan password pengguna tersebut.

## Fungsi `admin_actions()`

```
admin_actions() {
    echo "Admin actions:"
    echo "1. Add User"
    echo "2. Edit User"
    echo "3. Delete User"
    echo "4. Logout"
    read -p "Choose action: " action

    case $action in
        1)
            ./register.sh
            ;;
        2)
            read -p "Enter email of the user to edit: " edit_email
            ./edit_user.sh "$edit_email"
            ;;
        3)
            read -p "Enter email of the user to delete: " delete_email
            ./delete_user.sh "$delete_email"
            ;;
        4)
            echo "Logout successful!"
            exit 0
            ;;
        *)
            echo "Invalid action"
            ;;
    esac
}
```

Fungsi ini menyediakan aksi yang dapat dilakukan oleh admin setelah login. Aksi yang disediakan antara lain menambahkan pengguna baru, mengedit informasi pengguna, menghapus pengguna, dan logout. Pengguna akan diminta untuk memilih aksi yang diinginkan, dan aksi akan dijalankan sesuai dengan pilihan yang dibuat.

## Main Code

```
echo "=== User Login ==="
echo "1. Login"
echo "2. Forgot Password"
read -p "Choose option: " option

case $option in
    1)
        read -p "Email: " email
        read -sp "Password: " password
        echo

        # check if email exists
        grep -q "^$email:" users.txt
        if [ $? -ne 0 ]; then
            echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [LOGIN FAILED] ERROR: Email $email not found." >> auth.log
            echo "ERROR: Email $email not found."
            exit 1
        fi

        # validate password
        check_credentials "$email" "$password"
        if [ $? -eq 0 ]; then
            echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [LOGIN SUCCESS] User with email $email logged in successfully." >> auth.log

            is_admin=$(grep "^$email:" users.txt | cut -d: -f6)
            if [ "$is_admin" == "admin" ]; then
                admin_actions
            else
                echo "Login successful! You do not have admin privileges."
            fi
        else
            echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [LOGIN FAILED] ERROR: Incorrect password for user with email $email." >> auth.log
            echo "ERROR: Incorrect password."
            read -p "Forgot Password? (y/n): " choice
            if [ "$choice" == "y" ]; then
                forgot_password "$email"
            fi
        fi
        ;;
    2)
        read -p "Enter your email: " email
        forgot_password "$email"
        ;;
    *)
        echo "Invalid option"
        ;;
esac
```

Bagian utama kode ini adalah bagian yang menangani proses login pengguna dan pemulihan password jika diperlukan. Pengguna akan diminta untuk memilih antara login atau pemulihan password. Setelah itu, kode akan memvalidasi email dan password yang dimasukkan pengguna. Jika informasi yang dimasukkan valid, pengguna akan berhasil login, dan aksi selanjutnya akan tergantung pada apakah pengguna adalah admin atau tidak.

Selain itu, pesan kesalahan dan keberhasilan juga dicatat dalam file `auth.log` untuk memudahkan pelacakan aktivitas pengguna.

Setelah melakukan scripting untuk `login.sh`, lakukan juga scripting untuk admin options `edit_user.sh` dan `delete_user.sh` 

```
#!/bin/bash

edit_user_info() {
    local email=$1

    grep -q "^$email:" users.txt
    if [ $? -ne 0 ]; then
        echo "Error: Email $email not found."
        exit 1
    fi

    local username=$(grep "^$email:" users.txt | cut -d: -f2)
    local security_question=$(grep "^$email:" users.txt | cut -d: -f3)
    local security_answer=$(grep "^$email:" users.txt | cut -d: -f4)

    echo "Current Information:"
    echo "Email: $email"
    echo "1. Username: $username"
    echo "2. Security Question: $security_question"
    echo "3. Security Answer: $security_answer"

    read -p "Enter field number to edit (1-3): " field_number

    case $field_number in
        1)
            read -p "Enter new username: " new_username
            sed -i "s/^$email:$username:$security_question:$security_answer/$email:$new_username:$security_question:$security_answer/" users.txt
            echo "Username updated successfully."
            ;;
        2)
            read -p "Enter new security question: " new_security_question
            sed -i "s/^$email:$username:$security_question:$security_answer/$email:$username:$new_security_question:$security_answer/" users.txt
            echo "Security question updated successfully."
            ;;
        3)
            read -p "Enter new security answer: " new_security_answer
            sed -i "s/^$email:$username:$security_question:$security_answer/$email:$username:$security_question:$new_security_answer/" users.txt
            echo "Security answer updated successfully."
            ;;
        *)
            echo "Invalid field number."
            ;;
    esac
}

# main code
if [ $# -eq 0 ]; then
    echo "Usage: ./edit_user.sh <email>"
    exit 1
fi

edit_user_info "$1"

```

```
#!/bin/bash

delete_user() {
    local email=$1

    grep -q "^$email:" users.txt
    if [ $? -ne 0 ]; then
        echo "Error: Email $email not found."
        exit 1
    fi

    sed -i "/^$email:/d" users.txt
    echo "User with email $email has been successfully deleted."
}

# main code

if [ $# -eq 0 ]; then
    echo "Usage: ./delete_user.sh <email>"
    exit 1
fi

delete_user "$1"
```
## Dokumentasi Output

![Screenshot 2024-03-30 115055](https://github.com/agnesgriselda/Sisop-1-2024-MH-IT10/assets/150202762/0cc2ff65-37db-49df-b6de-eeee8d971e3a)

![Screenshot 2024-03-30 115137](https://github.com/agnesgriselda/Sisop-1-2024-MH-IT10/assets/150202762/d74d1b08-dfb9-44a1-bbae-5e5f916d66fd)

![Screenshot 2024-03-30 115210](https://github.com/agnesgriselda/Sisop-1-2024-MH-IT10/assets/150202762/90485d55-0957-4b5d-9bec-eee87281d42c)

## Soal 3

Alyss adalah seorang gamer yang sangat menyukai bermain game Genshin Impact. Karena hobinya, dia ingin mengoleksi foto-foto karakter Genshin Impact. Suatu saat Yanuar memberikannya sebuah Link yang berisi koleksi kumpulan foto karakter dan sebuah clue yang mengarah ke penemuan gambar rahasia. Ternyata setiap nama file telah dienkripsi dengan menggunakan hexadecimal. Karena penasaran dengan apa yang dikatakan Yanuar, Alyss tidak menyerah dan mencoba untuk mengembalikan nama file tersebut kembali seperti semula.
Alyss membuat script bernama awal.sh, untuk download file yang diberikan oleh Yanuar dan unzip terhadap file yang telah diunduh dan decode setiap nama file yang terenkripsi dengan hex . Karena pada file list_character.csv terdapat data lengkap karakter, Alyss ingin merename setiap file berdasarkan file tersebut. Agar semakin rapi, Alyss mengumpulkan setiap file ke dalam folder berdasarkan region tiap karakter

Format: Region - Nama - Elemen - Senjata.jpg
Karena tidak mengetahui jumlah pengguna dari tiap senjata yang ada di folder "genshin_character".Alyss berniat untuk menghitung serta menampilkan jumlah pengguna untuk setiap senjata yang ada
Format: [Nama Senjata] : [jumlah]

Untuk menghemat penyimpanan. Alyss menghapus file - file yang tidak ia gunakan, yaitu genshin_character.zip, list_character.csv, dan genshin.zip. Namun sampai titik ini Alyss masih belum menemukan clue dari the secret picture yang disinggung oleh Yanuar. Dia berpikir keras untuk menemukan pesan tersembunyi tersebut. Alyss membuat script baru bernama search.sh untuk melakukan pengecekan terhadap setiap file tiap 1 detik. Pengecekan dilakukan dengan cara meng-ekstrak sebuah value dari setiap gambar dengan menggunakan command steghide. Dalam setiap gambar tersebut, terdapat sebuah file txt yang berisi string. Alyss kemudian mulai melakukan dekripsi dengan hex pada tiap file txt dan mendapatkan sebuah url. Setelah mendapatkan url yang ia cari, Alyss akan langsung menghentikan program search.sh serta mendownload file berdasarkan url yang didapatkan.
Dalam prosesnya, setiap kali Alyss melakukan ekstraksi dan ternyata hasil ekstraksi bukan yang ia inginkan, maka ia akan langsung menghapus file txt tersebut. Namun, jika itu merupakan file txt yang dicari, maka ia akan menyimpan hasil dekripsi-nya bukan hasil ekstraksi. Selain itu juga, Alyss melakukan pencatatan log pada file image.log untuk setiap pengecekan gambar
Format: [date] [type] [image_path]

Ex: 
[24/03/20 17:18:19] [NOT FOUND] [image_path]
[24/03/20 17:18:20] [FOUND] [image_path]

Hasil akhir:
- genshin_character
- search.sh
- awal.sh
- image.log
- [filename].txt
- [image].jpg

  ## Penjelasan Kode `awal.sh`

Skrip ini adalah sebuah bash script yang bertujuan untuk mengumpulkan dan mengelompokkan foto-foto karakter dari permainan Genshin Impact berdasarkan wilayahnya, serta menghitung jumlah pengguna untuk setiap jenis senjata yang digunakan karakter tersebut. Berikut adalah penjelasan langkah-langkah yang dilakukan dalam skrip tersebut:

1. **Mendownload File:**
   - Menggunakan perintah `wget` untuk mengunduh file `genshin.zip` dari URL yang diberikan.
   - Opsi `-o` digunakan untuk menentukan nama file output untuk log, namun seharusnya menggunakan opsi `-O` untuk menentukan nama file output untuk hasil unduhan. Namun, karena argumen `genshin.zip` telah disediakan, opsi ini sebenarnya tidak diperlukan.
   - URL yang digunakan adalah `'https://docs.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9N'`.

2. **Mengextract File:**
   - Menggunakan perintah `unzip` untuk mengekstrak isi dari file `genshin.zip`.
   - Eksplisit menggunakan perintah `unzip` dua kali. Seharusnya cukup dengan satu kali perintah `unzip`.

3. **Membuat Struktur Folder:**
   - Menetapkan path folder tempat penyimpanan karakter ke variabel `path`.
   - Membuat folder untuk setiap wilayah dalam permainan Genshin Impact, yaitu Inazuma, Mondstat, Liyue, Sumeru, dan Fontaine menggunakan perintah `mkdir`.

4. **Mengubah Nama File:**
   - Melakukan iterasi pada setiap file gambar `.jpg` dalam folder karakter.
   - Mengubah nama file dari hex ke ascii menggunakan perintah `xxd`.
   - Menggunakan awk untuk membaca file `list_character.csv` dan menentukan wilayah dan nama karakter berdasarkan nama file karakter yang telah diubah.
   - Mengubah nama file sesuai format yang ditentukan dan memindahkannya ke folder wilayah yang sesuai.

5. **Menghitung Jumlah Pengguna Senjata:**
   - Menggunakan perintah `awk` untuk membaca file `list_character.csv` dan menghitung jumlah pengguna untuk setiap jenis senjata (Claymore, Polearm, Catalyst, Bow, dan Sword).
   - Menggunakan variabel `l`, `m`, `n`, `o`, dan `p` untuk menyimpan jumlah pengguna untuk masing-masing jenis senjata.

6. **Menghapus File Tidak Diperlukan:**
   - Menghapus file `genshin_character.zip`, `list_character.csv`, dan `genshin.zip` setelah selesai proses pengumpulan dan pengolahan.

  ## Penjelasan Kode `search.sh`

Skrip ini bertujuan untuk mencari gambar tersembunyi dalam folder `genshin_character` dan mengekstrak URL yang tersembunyi di dalamnya. Berikut adalah penjelasan langkah-langkah yang dilakukan dalam skrip tersebut:

1. **Inisialisasi Path Folder:**
   - Mendefinisikan variabel `path` yang menyimpan path ke folder `genshin_character` di direktori `/home/icel/sisopsusah/genshin_character`.

2. **Iterasi Melalui Folder dan File Gambar:**
   - Melakukan iterasi pada setiap folder dalam path `genshin_character`.
   - Melakukan iterasi pada setiap file gambar `.jpg` dalam setiap folder.

3. **Ekstraksi Pesan Tersembunyi:**
   - Menggunakan perintah `steghide` untuk mengekstrak pesan tersembunyi dari setiap gambar menggunakan passphrase kosong (`-p ""`).
   - Opsi `-q` digunakan untuk mode quiet sehingga tidak ada output yang ditampilkan ke terminal selama ekstraksi.

4. **Pengecekan Pesan Tersembunyi:**
   - Memeriksa pesan tersembunyi untuk menemukan URL tersembunyi. Jika pesan tersembunyi mengandung string `aHR0cHM` (yang merupakan awalan dari URL yang dienkripsi dalam base64), maka URL tersebut ditemukan.
   - Jika URL ditemukan, dekripsi URL menggunakan base64.
   - Menampilkan waktu temuan, path file gambar, dan URL yang ditemukan.
   - Catat log ke file `image.log` dengan menambahkan timestamp, status temuan, dan path file gambar.
   - Unduh file yang ditemukan dengan menggunakan `wget`.
   - Simpan URL yang ditemukan ke dalam file dengan format nama yang sama dengan file gambar asli, tetapi berakhiran `.txt`.
   - Hapus file txt yang dihasilkan setelah proses ekstraksi selesai.

5. **Tidak Menemukan URL:**
   - Jika pesan tersembunyi tidak mengandung string `aHR0cHM`, maka URL tidak ditemukan dalam gambar tersebut.
   - Catat ke log bahwa URL tidak ditemukan.

6. **Delay dan Iterasi Berikutnya:**
   - Menunda proses selama 1 detik sebelum melanjutkan iterasi ke gambar berikutnya.

   ## Revisi

   Pada script awal.sh, terdapat modifikasi pada fungsi ganti nama file sebagai berikut :

```
change=$(awk -F,  "/$hore/"'{OFS=",";print $2 "-" $1 "-" $3 "-" $4}' list_character.csv | tr -d '\r')
```
  Fungsi modifikasi ini berfungsi untuk menghilangkan `\r` pada format penamaan file`.jpg` agar dapat terbaca pada script berikutnya, ##search.sh

  ## Dokumentasi Output

![Screenshot 2024-03-30 115311](https://github.com/agnesgriselda/Sisop-1-2024-MH-IT10/assets/150202762/e9449a4d-1e87-45c2-9bd8-1738be9847a1)


![Screenshot 2024-03-30 120041](https://github.com/agnesgriselda/Sisop-1-2024-MH-IT10/assets/150202762/6ff2d50f-ce0c-413a-a8a8-46e1285273de)



  ## Soal 4 
  Stitch sangat senang dengan PC di rumahnya. Suatu hari, PC nya secara tiba-tiba nge-freeze 🤯 Tentu saja, Stitch adalah seorang streamer yang harus setiap hari harus bermain game dan streaming.  Akhirnya, dia membawa PC nya ke tukang servis untuk diperbaiki. Setelah selesai diperbaiki, ternyata biaya perbaikan sangat mahal sehingga dia harus menggunakan uang hasil tabungan nya untuk membayarnya. Menurut tukang servis, masalahnya adalah pada CPU dan GPU yang overload karena gaming dan streaming sehingga mengakibatkan freeze pada PC nya. Agar masalah ini tidak terulang kembali, Stitch meminta kamu untuk membuat sebuah program monitoring resource yang tersedia pada komputer.
Buatlah program monitoring resource pada PC kalian. Cukup monitoring ram dan monitoring size suatu directory. Untuk ram gunakan command `free -m`. Untuk disk gunakan command `du -sh <target_path>`. Catat semua metrics yang didapatkan dari hasil `free -m`. Untuk hasil `du -sh <target_path>` catat size dari path directory tersebut. Untuk target_path yang akan dimonitor adalah /home/{user}/. 
 A. Masukkan semua metrics ke dalam suatu file log bernama metrics_{YmdHms}.log. {YmdHms} adalah waktu disaat file script bash kalian dijalankan. Misal dijalankan pada 2024-03-20 15:00:00, maka file log yang akan tergenerate adalah metrics_20240320150000.log. 
B. Script untuk mencatat metrics diatas diharapkan dapat berjalan otomatis pada setiap menit. 
C. Kemudian, buat satu script untuk membuat agregasi file log ke satuan jam. Script agregasi akan memiliki info dari file-file yang tergenerate tiap menit. Dalam hasil file agregasi tersebut, terdapat nilai minimum, maximum, dan rata-rata dari tiap-tiap metrics. File agregasi akan ditrigger untuk dijalankan setiap jam secara otomatis. Berikut contoh nama file hasil agregasi metrics_agg_2024032015.log dengan format metrics_agg_{YmdH}.log 
D. Karena file log bersifat sensitif pastikan semua file log hanya dapat dibaca oleh user pemilik file. 

## Penyelesaian 
A. Pertama tama untuk menyelesaikan permasalahan pada soal A, kita harus memastikan dahulu bahwa kita memahami bahwa target yang akan dimonitor adalah user, Maka kode scriptnya adalah seperti ini : 
#!/bin/bash

# Ini adalah fungsi untuk mengetahui waktu sekarang
'''
current_time=$(date "+%Y%m%d%H%M%S")
'''

# Ini adalah Fungsi untuk mengarahkan bahwa kita memonitor user
'''
target_directory="/home/nafi"
'''

# Ini adalah fungsi untuk mendapatkan RAM Usage
'''
ram_usage=$(free -m | awk 'NR==2{printf "%s,%s,%s,%s,%s,%s,%s,%s,%s,", $2,$3,$4,$5,$6,$7,$8,$9,$10}')
'''

# Ini adalah fungsi untuk mendapatkan Size dari Directory
'''
directory_size=$(du -sh "$target_directory" | awk '{print $1}')
'''

# Ini adalah proses pembuatan file log
'''
log_file="metrics_${current_time}.log"
'''

# Ini adalah proses menulis metrics pada log file menggunakan fungsi atau command echo
'''
echo "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" >> "$log_file"
echo "$ram_usage$directory_size,$target_directory" >> "$log_file"
'''

# Ini adalah fungsi untuk menampilkan bahwa berhasil
'''
echo "Metrics saved to $log_file"
'''
Contoh Outputnya adalah sebagai berikut : 

B. Untuk mencatat metrics secara otomatis tiap menit langkahnya adalah seperti ini 
a. Inisiasi fungsi crontab menggunakan command crontab -e 
b. lalu kita bisa masuk ke dalam script crontab dan scroll ke bagian paling bawah
c. Lalu kita bisa menuliskan path menuju directory file yang mau kita buat tercatat tiap menit secara otomatis

C. Untuk Melaksanakan perintah pada soal ini, script yang kita butuhkan adalah seperti ini : 
#!/bin/bash
# menyimpan path direktori di mana file log akan disimpan
'''
log_dir="/home/nafi/log"
'''
# menyimpan path file log agregasi per jam. Nama file log akan disesuaikan dengan tanggal dan jam saat ini
'''
hourly_log_file="$log_dir/metrics_agg_$(date "+%Y%m%d%H").log"
'''
# daftar file log per menit yang ada di dalam direktori 
'''
minute_logs=$(ls -t "$log_dir"/metrics_*.log)
'''
# Ini adalah deklarasi array metrics yang akan menyimpan data metrics yang dikumpulkan dari file log
'''
declare -A metrics
'''
# digunakan untuk menghitung nilai minimum, maksimum, dan rata-rata dari serangkaian nilai yang diberikan
'''
get_min_max_avg() {
    values=$(echo "$1" | sed 's/[^0-9.]//g')
    count=$(echo "values" | wc -w)
    min=$(echo "values" | sort -n | head -n1)
    max=$(echo "values" | sort -n | tail -n1)
    avg=$(echo "scale=2; $(echo "$values" | tr ' ' '+' | bc) / $count" | bc)
    echo "$min,$max,$avg"
  }
  '''
#  Loop ini akan mengiterasi melalui setiap file log per menit yang ditemukan di dalam direktori log.
'''
for log_file in $minute_logs; do 
'''
# Loop ini akan membaca setiap baris dari file log yang sedang diproses dan memasukkan nilai metrics ke dalam array metrics.
   '''
   while IFS=, read -r mem_total mem_used mem_free mem_shared mem_buff mem_available swap_total swap_used swap_free path path_size; do
   metrics[mem_total]+="$mem_total "
   metrics[mem_used]+= "$mem_used "
   metrics[mem_free]+= "$mem_free " 
   metrics[mem_shared]+= "$mem_shared "
   metrics[mem_buff]+= "$mem_buff " 
   metrics[mem_available]+= "$mem_available " 
   metrics[swap_total]+= "$swap_total " 
   metrics[swap_used]+= "$swap_used " 
   metrics[swap_free]+= "$swap_free " 
   metrics[path_size]+= "$path_size "
   done < "$log_file"
 done
 '''
#  Ini akan menulis header ke file log agregasi per jam.
'''
echo "type,mem_total mem_used mem_free mem_shared mem_buff mem_available swap_total swap_used swap_free path path_size > "$hourly_log_file"
'''
# Loop ini akan mengiterasi melalui setiap kunci (metric) dalam array metrics.
'''
for metric in "${!metrics[@]}"; do
    min_max_avg=$(get_min_max_avg "$metrics[metric]}")
'''
# menulis hasil agregasi (nilai minimum, maksimum, dan rata-rata) ke file log agregasi per jam.
'''
    echo "$metric,$min_max_avg" | tr ' ' ',' >> "$hourly_log_file"
  done
'''
D. Untuk melaksanakan perintah dari D adalah bagian kode yang ini
#  Ini mengubah izin file log agregasi per jam agar hanya dapat dibaca oleh pemiliknya.
'''
chmod 600 "$hourly_log_file"
'''
   


