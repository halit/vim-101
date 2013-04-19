% eVim

# Vim Felsefesi

## Kısa tarih

### Baslarken: vi

* 1976 yilinda Bill Joy tarafindan yazildi
* Unix ozelliklerinin bir parcasi
* Gunumuzde hala bircok vi klonları mevcuttur
* nvi, Elvis, svicc, bvi, VILE..

### Vi iMproved

* Muhtemelen en taninan ve bilinen vi klonu
* Bram Moolenaar tarafindan 1991 yilinda yazildi
* Neredeyse %100 vi ile uyumlu
* Bircok linux dagitimi vi uygulamasi olarak kullaniyor

## Tasarim ve Ilkeler

### Vim nedir?

* Vim bir metin editorudur
* Vim metinleri duzenlemenize ve maniple etmenize olanak saglar
* Vim ergonomik olmasi icin tasarlanmistir

### Vim ne degildir?

* Vim UNIX felsefesine ihanet etmez!
* Vim bir IDE degildir: Shell ve Debugger yok
* Shell' ulasmak icin ctrl+z en temiz yol
* Daha fazlasi :help design-not

### Tipik bir editor

* Vim 6 farklı moda sahiptir
* Sadece bir tanesi metin duzenleme ile ilgilidir
* Zamanin buyuk kısmı normal modda gecer

### Bir dilden komutlar

* [operator][sayi][hareket]
* Tum operatorler ayni hareketi yapar
* Ogrenmesi cok kolay bir dildir
* Ornekler: "delete a word" daw, "copy inside quotes" yi'

# Temeller

## Hareket

### Goreli hareket

* Yon tuslarini unutun
* Karakter yonleri: hjkl
* Satir basi icin: 0, ^ ve $
* Yarim sayfa icinde ust ve asagi: ^u and ^d
* Ilk ve son satır: gg and G

### Imlec hareketi

* Yukari orta ve asagi: HML
* Imleci yukari orta ve asagi hizala: zt, zz, zb

## Metin duzenleme

### Giris modu

* Bu mod'a giris icin i veya a tuslari kullanilir
* Baslangic ve satir sonu ile: I and A
* Bir ileri ve onceki satir: o and O
* Change operator leaves you in insert mode
* Giris modundan cikis icin ESC'ye basmak yeterli

### Uc temel operator

* Silme operatoru: d
* Degistirme operatoru: r
* Kopyalama operatoru: y
* Diger birkac operator: v,=,~,g?...

### Hareketler

* Duzenli hareketler
* Metin objelerri: kelimeler, cumleler, [] bloklar...
* Izler
* Aramalar

### Metin objeleri

* Kelimeler ve cumleler: w,W,s
* Bloklar: `(,[,<,{,",'`
* XML etikerleri: t
* b ve B ( ve { icin kisayoldur

## Coklu dosyalar ile calisma

### Tamponlar, Pencreler, Sekmeler

* Tampon  *dosyanin bir ornegidir*
* Pencere  *tampon uzerindedir*
* Bir tampon farkli penceler uzerinde ayni anda goruntulenebilir
* Sekme  *pencerelerin toplamidir*
* Daha fazlasi :help windows

### Tamponlar arasi gecis

* Yeni tampon acma: :e(dit)
* Tamponu silme: :bd(elete)
* Tum tamponlar: :ls
* Bir onceki ve sonraki tamponlar: :bp(rev) and :bn(ext)
* Icinde  *foo* gecen baska bir tampona gecis: :b foo (otomatik tamamlama calisir)
* n. tampona gecis: :b{1,2,3...}

### Pencereleri yonetme

* Pencere komutlari ^w ile baslar
* Dikey veya yatay bolmek icin ^w s ve ^w v
* Aktif pencereler arasi gecis ^w hjkl
* Pencereyi kapatma ^w c

### Sekmeler

* Vim'deki sekmeler diger tum editorlerden farklidir!
* Vim 7.0'dan beri olan bir ozelliktir
* Yeni bir tab icin :tabe(dit)
* Tablar arasi gecis gt ve gT
* Sekme kapatma :tabc(lose)
* Her zaman oldugu gibi :help tabpage

# Biraz daha ileri vim

## Arama ve degistirme

### Arama ozellikleri

* / ve ? kullanilarak arama yapilir
* # ve \* ile kelime arama
* Bulunanlar arasi gecis  n ve N

### Olmazsa olmaz sed

* Vim'e mukemmelik katan bir ozellik
* `:s/<regexp>/<replacement>/[options]`
* The / separator is arbitrary, you can choose something else
* g secenegi tum bulunanlara uygulamayi saglar
* Her ex komutunda oldugu gibi arama araligi belirlenebilir (ornegin :%s tum dosya icin)

## Makrolar

### Makro nedir?

* Register'a kayit edilen komut kumeleridir
* Tekrar eden karmasik isler icin bicilmis kaftan

### Kayit etme ve calistirma

* q ve sonra gelen herhangi bir register ismi ile kayit baslatilir
* Kayit sirasinda islemlerinizi her zaman oldugu gibi yapiniz
* Durdurma icin tekrardan q
* Istenilen makroyu calistimak icin register ismiyle birlike @
* Ornegin : `qaddq` satir silme makrosunu a registerinda saklar
* Calistirmak icin [sayi]@a

## Genel komutlar

### Gramer

* `:[aralik]g/<regexp>/<komut>`
* Ex komutunu `<komut>` belirlenen aralikte regex ile eslestigi surece calistirir
  (tum dosya ontanimlidir)
* :v veya :g! satirlardaki *eslesmemeler* de calistirir

### Birkac ornek

* Tum bos satirlari silme: `:g/^\s*$/d`
* Foo ile baslayan satilarin sonuna bar ekleme: `:g/^foo/s/$/bar/`
* Eslesen tum satirlarda makro calistirma: `:g/<regexp>/normal @q`
* Eslesen tum satirlari bastirma: `:g/<RegExp>/p`

## Otomatik tamamlama

### Farkli tamamlama ornekleri

* Tum satirlar: ^x ^l
* Acik dosya icindeki kelimeler: ^x ^n
* Etiketler: ^x ^]
* Dosya isimleri: ^x ^f
* Bir onceki ve sonraki oneriye gecis ^n ve ^p

# Vim ozellestirmeleri

## Vim genel bakis

### .vim yapisi

* .vim/autoload: otomatik yuklenen fonksiyonlar
* .vim/plugin: genel amacli eklentiler
* .vim/ftplugin: filetype ozel pluginler
* .vim/ftdetect: filetype detection betikleri
* .vim/colors: renk semalari
* .vim/syntax: kod renklendirme dosyalari
* .vim/after: kesin bir sekilde diger scriptlerden once calisacaklar

`.vimrc
set nocompatible
syntax on
filetype plugin indent on
set backspace=2
`

## Haritalama

### Haritalama nedir?

* Haritalama komut dizilernin kısayollaridir
* Her modda calisirlar
* Haritalama rekursif olabilir
* Ornegin: cnoremap bir komut modudur, rekursif olmayan haritalama yapar

### Leader tusu

* Bu tus ile kendi haritalamanizi yapabilirsiniz
* On tanimli `"\"`
* Bunu `let mapleader = "X"` seklinde degistirebilirsiniz

### Birkac haritalama komutu

* nnoremap j gj
* nnoremap k gk
* noremap ; :
* nnoremap Y y$

## Birkac eklenti

### Pathogen

* Tim Pope tarafindan yazildi
* Eklenti yoneticisi
* Her eklentiyi .vim/bundle altinda duzenli bir sekilde saklar

### Surround

* Tim Pope tarafindan yazildi
* Yeni hareketler icin
* Yorum satirlari, parantezler ...

### Syntastic

* Martin Grenfell tarafindan yazildi
* Gramer kontrolu yapar

### NERDCommenter

* Martin Grenfell tarafindan yazildi
* Kolay kod yorumlari icin

### Tagbar

* Jan Larres tarafindan yazildi
* Pencere icinde etiketleri gosterir

### The absolute minimum

* Her komut veya her haritalamayi gosterme sansimiz yok
* Olayin arka planinda yatan *fikri* anlamak bu sunumun en buyuk amaci

### En iyisi arastirmak!

* Marks: :help mark-motions
* Visual mod: :help visual
* AVe digerleri

## Nerden ogrenicez?

### :help

* Vim mukemmel dokumantasyon ile geliyor
* :help komutunu calistmaniz yeterli

### vimcasts.org

* Kisa kisa vim ile ilgili videolarin oldugu harika site

### Online

* Mail listeleri: http://www.vim.org/maillist.php
* IRC: #vim@freenode
* Reddit: /r/vim

### Vim ayarlarim

* https://github.com/halitalptekin/dotfiles

### Tesekkurler

* https://github.com/Chewie/
