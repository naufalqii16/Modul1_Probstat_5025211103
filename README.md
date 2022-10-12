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

>d. Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama

Untuk membuat histogram distribusi Geometrik, digunakan fungsi `hist()` dengan angka acak dari fungsi distribusi Geometrik sebagai parameternya.

```R
hist(rgeom(n = 10000, prob = p), main ="Histogram Distribusi Geometrik")
```

![1d](https://user-images.githubusercontent.com/115441787/195241661-ab111982-4e8a-4fdb-a101-82918302643a.png)

>e. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik

**mencari rataan(μ)**
```R
mean = 1/p
mean
```
**mencari varian (σ²)**

```R
variance = (1-p)/(p^2)
variance
```

# 2. Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :

> a. Peluang terdapat 4 pasien yang sembuh

karena kemungkinannya hanya `sembuh` dan `tidak sembuh`, paling sesuai jika dihitung menggunakan `Distribusi Binomial`. Fungsi yang dipakai adalah `dbinom(x, size, prob, log = FALSE)` dengan :\
x = vector of quantiles
n = jumlah data pasien\
prob = peluang sembuh pasien\
log = logical (if)

```R
n = 20
prob = 0.2

# Poin A
x = 4
probability = dbinom(x, n, prob = p, log = FALSE)
probability
```
![2a](https://user-images.githubusercontent.com/115441787/195244563-85c4bd66-f3f0-4389-934a-0ae9d2579194.png)



> b. Gambarkan grafik histogram berdasarkan kasus tersebut!

membuat histogram memakai fungsi `hist()`

```R
hist(rbinom(x, n, prob = p), xlab = "sembuh", ylab = "frekuensi", main = "Histogram Distribusi Binomial")
```

![2B](https://user-images.githubusercontent.com/115441787/195245484-fbd56f7c-d261-4795-b619-5028653dc759.png)


> c. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.

* mean didapat dari banyak data * peluang
* varian didapat dari mean * komplemen peluang

```R
mean = n * (prob = p)
mean

variance = n * (prob = p) * (1 - (prob = p))
variance
```

![2C](https://user-images.githubusercontent.com/115441787/195246312-356d058a-3036-4f69-951f-6af1eb1245c2.png)


# 3. Diketahui data dari  sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)

> a. Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?

Penyelesaian dilakukan dengan menggunakan distribusi Poisson dengan menggunakan fungsi `dpois(x, lambda, log)`
* x = number of successful events happened in an interval 
* lambda = mean per interval 
* log (optional) = if TRUE then the function returns probability in form of log

```R
x = 6
lambda = 4.5
prob = dpois(x, lambda)
prob
```

![3A](https://user-images.githubusercontent.com/115441787/195253095-cf4afe65-6f28-4572-a000-8ec65ededc34.png)

> b. simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini  selama setahun (n = 365)

fungsi hist() nya digunakan dengan angka acak dari fungsi distribusi Poisson sebagai parameternya.

```R
x = 6
n = 356
hist(rpois(n, lambda), main = "Histogram Poisson")
```

![3B](https://user-images.githubusercontent.com/115441787/195253578-d713f1b5-4a17-4bb8-8f0f-4fcc97ae9654.png)

> c. bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan

* `dpois` mengembalikan nilai fungsi density probabilitas Poisson.
* `rpois` menghasilkan random variabel dari distribusi poissennya

> d. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson

Pada distribusi poisson, rataan dan juga varian memiliki nilai yang sama, yaitu lambda

```R
mean = variance
mean
variance
```
![3C](https://user-images.githubusercontent.com/115441787/195255722-fd52fe37-316d-4f24-b0b4-dec926d19abb.png)


# 4. Diketahui nilai x = 2 dan v = 10. Tentukan:

> a. Fungsi Probabilitas dari Distribusi Chi-Square.

Fungsi yang membantu adalah `dchisq(x, v)`

```R
x = 2
v = 10
dchisq(x,v)
```

![4A](https://user-images.githubusercontent.com/115441787/195256980-d4243c47-5266-458e-8238-0cc8220ec442.png)

> b. Histogram dari Distribusi Chi-Square dengan 100 data random

Histogram menggunakan fungsi `hist()`

![4B](https://user-images.githubusercontent.com/115441787/195257501-6977f60c-c17d-450e-85f3-dd9a7ed7ee04.png)

> c. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square.

* mean sama dengan v
* varian sama dengan dua kali v


```R
mean = v
mean

variance = 2 * v
variance
```


# 5. Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan:

> a. Fungsi Probabilitas dari Distribusi Exponensial

Untuk menyelesaikan ini, dapat digunakan fungsi `dexp()`.

```R
lambda = 3
prob = dexp(1, lambda, log = FALSE)
```
Berikut merupakan hasilnya :
![5A](https://user-images.githubusercontent.com/115441787/195323653-ca44545d-89cf-4b54-bc2b-9abebb688c94.png)


> b. Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random

```R
set.seed(1)
hist(rexp(10), main = "Histogram Exponential 10 bilangan random")
hist(rexp(100), main = "Histogram Exponential 100 bilangan random")
hist(rexp(1000), main = "Histogram Exponential 1000 bilangan random")
hist(rexp(10000), main = "Histogram Exponential 10000 bilangan random")
```
Histogram untuk 10 :

![5B1](https://user-images.githubusercontent.com/115441787/195324760-4154eb38-804b-42c1-bbbe-dfcab8d09d79.png)

Histogram untuk 100 :
![5B2](https://user-images.githubusercontent.com/115441787/195324829-cb12576c-10ea-4986-a2c4-32067a17fc9a.png)

Histogram untuk 1000 :
![5B3](https://user-images.githubusercontent.com/115441787/195324842-44b73e1e-2b11-48fb-813d-69bee2669e6d.png)

Histogram untuk 10000 :
![5B4](https://user-images.githubusercontent.com/115441787/195324837-30540d58-db1b-4215-a4ad-00e8a63c4d8c.png)

> c. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3

untuk mencari Rataan digunakan fungsi `mean()`

```R
set.seed(1)
n = 100
mean = mean(rexp(n, rate = lambda))
mean
```

untuk mencari varian, dapat dicari terlebih dahulu standard deviasinya menggunakan fungsi `sd()` karena std deviasi merupakan akar dari varian. sehingga varian = std. deviasi dikuadratkan.

```R
set.seed(1)
n = 100
variance = (sd(rexp(n, rate = lambda))) ^ 2
variance
```

# 6. Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan :

> a. Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).
Keterangan :\
 X1 = Dibawah rata-rata\
 X2 = Diatas rata-rata\
 Contoh data :
1,2,4,2,6,3,10,11,5,3,6,8\
rata-rata = 5.083333\
X1 = 5\
X2 = 6

Hal tersebut dapat diselesaikan dengan :

```R
set.seed(1)
n = 100
mean = 50
sd = 8

data <- rnorm(n, mean, sd)
data
summary(data)

x1 = runif(1, min = min(data), max = mean)
x2 = runif(1, min = mean, max = max(data))

prob1 <- pnorm(x1, mean, sd)
prob2 <- pnorm(x2, mean, sd)
prob1
prob2

plot(data)

prob = plot(prob2-prob1)
```


> b. Generate histogram dari distribusi Normal dengan breaks 50.

```R
breaks = 50
hist(data, breaks, main = "naufalqii")
```
![5B](https://user-images.githubusercontent.com/115441787/195332408-b7d7437d-812c-4b13-9f4b-9d5c217ac2da.png)



> c. Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.

seperti pada soal sebelumnya, nilai dari varian dapat dicari dengan mengkuadratkan nilai dari std. deviasinya.

```R
variance = (sd(data)) ^ 2
variance
```
didapatkan nilai 51.63277.
