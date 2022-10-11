# Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya

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

