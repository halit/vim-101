# Vim is not a text editor. It is a highly evolved language for communicating with a text editor "

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
* Ornek: "delete a word" daw , "cut inside" ci "test" 'test' (test)
* select inside the html tags vit ve vat <b>test</b>

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
* Giris modundan cikis icin ESC'ye basmak yeterli

### Uc temel operator

* Silme operatoru: d
* Degistirme operatoru: r
* Kopyalama operatoru: y
* Diger birkac operator: v,=,~,g?...

### Hareketler

* Duzenli hareketler
* Metin objeleri: kelimeler, cumleler, [] bloklar...
* Izler
* Aramalar

### Metin objeleri

* Kelimeler ve cumleler: w,W,s,e,E,b,B
* Satir birlestirme: J
* Bloklar: `(,[,<,{,",'`

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

### Kesin bilinmesi gerekenler

* y(ank) - kopyala
* d(elete) - kes
* c(hange) - degistir
* p(aste) - kopyala
* o(pen) - yeni satir
* i(nsert) - karakterden once giris
* a(ppend) - karakterden sonra giris
* w(ord) - ilerideki kelimenin ilk harfine git
* b(ack) - gerideki kelimenin ilk harfine git
* e(nd) - kelimenin son harfine git
* f(ind) - satir icindeki harfe git
* hareketler h,j,k,l
* ^ - satir basi
* $ - satir sonu
* 0 - satirdaki ilk pozisyon
* 2w - 2 kelime ileri
* 5h - 5 karakter sola
* 3k - 3 karakter yukari
* dd - satir silme
* yy - satir kopyalama
* cc - tum satiri degistirme
* c$ - bulundugu pozsiyondan sayi kadar degistirme
* 3dd - 3 satir silme
* . - son komutu geri alma
* :w dosya.txt  - dosyayi isimle kaydetme
* :q  -  dosyadan cikis
* :q! - kayit etmeden cikis
* :w! myfile.txt - hata bile verse kaydetmeyi zorla
* :wq - dosyayi kaydet ve cikis yap
* :r [filename]  - dosya icerigini oku
* :r!date
* ctrl+x 98984
* gf /etc/passwd
* :w %.old - dosyayi farkli isimle kaydetme
* :0 - dosyanin en basina gitme gg - G
* :22 - 22.satira gitme
* :$ - dosyanin en sonuna gitme
* ma - ilgili satiri a diye isaretle
* mb - ilgili satiri b diye isaretle
* 'a - a isaretine git
* y'a - bulundugu satirdan a isaretine kadar tum satirlari kopyala

# Biraz daha ileri vim

## Arama ve degistirme

### Arama ozellikleri

* / ve ? kullanilarak arama yapilir
* # ve \* ile kelime arama
* Bulunanlar arasi gecis  n ve N

### Olmazsa olmaz sed

* Vim'e mukemmelik katan bir ozellik
* `:s/<regexp>/<replacement>/[options]e:`
* g secenegi tum bulunanlara uygulamayi saglar
* Her ex komutunda oldugu gibi arama araligi belirlenebilir (ornegin :%s tum dosya icin)
* test1

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

* Haritalama komut dizilerinin kısayollaridir
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

## Biraz daha komut

* :%s/old/new/g Tum eslesmeleri degistirir
* :%s/old/new/gw Tum eslesmeleri degistirmeden once sorar
* :2,35s/old/new/g 2-35 satirlari arasindakileri degistirir
* :5,$s/old/new/g 5-sayfa sonu arasındaki eslesmeleri degistirir
* :%s/^/hello/g Her satirin basını degistirir
* :%s/$/Harry/g Her satirin sonunu degistirir
* :34,72s/^/#/ 34-72 arasi yorum satiri ekler
* :34,72/^#// 34-72 arasi yorum satiri siler
* Ctrl+a Sayiyi arttırır
* Ctrl+x Sayiyi azaltir
* Vu Kucuk harf satir
* VU Buyuk harf satir
* guu , gUU
* ga 16lik tabanda ascii degeri, g8 16lik tabanda utf-8 degeri
* xp Iki karakteri degistirme
* g~~ Tersine dondurur 
* Ctrl+r=5+16 21 ekle(insert modunda)
* :help!
* '. son degistirdigin satira gitme
* :ju(mps) tum hareketlerin :history tum komutlarin 
* :reg tum saklayicilar - "1p 1.registerdan kopyala
* :296,297 !sort -u Satirlari sirala
* :r! komut Ciktiyi dosyaya ekle
* :1,10 w outfile 1-10 satirlari arasini kaydet
* :1,10 w >>  outfile 1-10 satirlari arasıni ekle
* :r infile Dosya icerigini ilgili satira ekle
* :r !ssh <remoteip> cat /path/to/somefile
* :23r infile Dosya icerigini 23.satira ekle
* < > Satir yaslama

## Birkac eklenti

### NerdTree
### Ctrl+P
### PowerLine
### MiniBuffExplorer
### TagList
### Python, C
### Git
### Django

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

### Minimum

* Her komut veya her haritalamayi gosterme sansimiz yok
* Olayin arka planinda yatan *fikri* anlamak bu sunumun en buyuk amaci

### En iyisi arastirmak!

* Marks: :help mark-motions
* Visual mod: :help visual
* Ve digerleri

## Nerden ogrenecez?

### :help

* Vim mukemmel dokumantasyon ile geliyor
* :help komutunu calistmaniz yeterli
* :vimtutor

### vimcasts.org

* Kisa kisa vim ile ilgili videolarin oldugu harika site

### Online

* Mail listeleri: http://www.vim.org/maillist.php
* IRC: #vim@freenode
* Reddit: /r/vim

### Tutorials

* http://blog.interlinked.org/tutorials/vim\_tutorial.html
* http://www.derekwyatt.org/vim/vim-tutorial-videos/
* http://peepcode.com/products/smash-into-vim-i
* http://www.youtube.com/watch?v=\_galFWwSDt0
* http://showmedo.com/videotutorials/series?name=0oSagogCe
* http://net.tutsplus.com/tutorials/other/venturing-into-vim-new-premium-video-series/
* http://www.oualline.com/vim-cook.html
* http://jeffrey-way.com/web-dev/vim-an-amuse-bouche/
* http://net.tutsplus.com/articles/web-roundups/10-terminal-commands-that-will-boost-your-productivity/
* http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/

### Vim ayarlarim

* https://github.com/halitalptekin/dotfiles

### Tesekkurler

* https://github.com/Chewie/
