# 1. Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya

> a. Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ?

Dalam kasus ini memanfaatkan fungsi dari distribusi geometrik. Fungsi yang digunakan adalah `dgeom` dengan syntax `dgeom(x,p)`\
x => jumlah kegagalan sebelum keberhasilan pertama\
p => peluang keberhasilannya\
\
pada kasus `a`, terjadi `3` kali gagal sebelum akhirnya berhasil. maka didapat `x=3` dan `p= 0.2`. untuk penyelesaian menggunakan R adalah sebagai berikut: 

```R
p = 0.2
x = 3
dgeom(3, 0.2)
```
didapatkan hasil `0.1024`\
berikut merupakan ss dari R studio.

![1a](https://user-images.githubusercontent.com/115441787/195157051-7a400541-f180-4878-b71f-76daee2805af.png)

> b. Mean distribusi Geometrik dengan 10000 data random, prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 (distribusi Geometrik acak () == 3)!

dari kasus b, untuk mengakses distribusi geometrik acak, kita dapat mengakses menggunakan fungsi `rgeom`. dengan syntax adalah `rgeom(n, prob)`, n sebagai nilai acaraknya dilakukan sebanyak n kali dan nilai peluangnya adalah prob. dan untuk mengukur mean dapat menggunakan syntax sebagai berikut:

```R
mean(rgeom(n = 10000, prob = p) == 3)
```

sebelum masuk ke mean, `rgeom` akan menghasilkan angka-angka dalam jumlah banyak yang terus berubah karena sifatnya random.

![rand](https://user-images.githubusercontent.com/115441787/195214813-8c96ed8a-5640-40c0-8569-f7e85451cf2e.png)

pada percobaan pertama mencari mean, didapatkan `0.101`, nilai tersebut akan selalu berubah-ubah karena yang dipakai adalah random.

![1b](https://user-images.githubusercontent.com/115441787/195160430-e1090b9d-bdf4-46dd-aa79-77c4dd3346b2.png)

pada percobaan kedua, nilainya berubah menjadi `0.1003`

![1b2](https://user-images.githubusercontent.com/115441787/195214129-fd860bdf-8a5e-4fca-8e80-b56454c132e5.png)


>c. Bandingkan hasil poin a dan b, apa kesimpulan yang bisa didapatkan?

jika kita perhatikan output dari `dgeom` dan `rgeom`, terdapat beberapa perbedaan :

1. `dgeom` memiliki output satu nilai, sedangkan `rgeom` memiliki output banyak nilai
2. `dgeom` memiliki output yang tetap di setiap percobaannya, sedangkan `rgeom` memiliki output yang berubah-berubah di setiap kita menjalankan program.

setidaknya dua perbedaan itu yang dapat diketahui dari percobaan di poin `a` dan `b`


