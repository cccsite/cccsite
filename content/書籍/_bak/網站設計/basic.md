# 本課程所需要的 JavaScript 基礎 

本《網站設計進階課程》是指需要伺服器 Server 搭配的那種網站，而不是單純的《網頁》。

這門課是《網頁設計》的進階課程，您最好修過《網頁設計課程》，或者已經學會 HTML/CSS/JavaScript 等基本語法。

如果您還沒學會 HTML/CSS/JavaScript ，但是又想修這門課，請先自行上《菜鳥教程》網站，學習下列主題：

1. HTML -- https://www.runoob.com/html/html-tutorial.html
2. CSS -- https://www.runoob.com/css/css-tutorial.html
3. JavaScript -- https://www.runoob.com/js/js-tutorial.html

當您學會這些主題之後，我們就可以開始使用 node.js 來學習 Server 端的程式設計了。

## Node.js 安裝

若您的電腦還沒有安裝 node.js ，請先上 https://nodejs.org/ 網站，然後點選 LTS 版本進行安裝。

安裝好之後，請測試看看您的 node.js 是否可以正確使用。

```
PS D:\ccc> node
> x=3
3
> y=5
5
> x+y
8
>
```

然後我們可以用 node.js 來執行 javascript 程式，例如：

```
PS D:\ccc\course\nodejs\code\00-nodejs\01-hello> node hello.js
hello

PS D:\ccc\course\nodejs\code\00-nodejs\02-variable> node variable.js
x= 8 y= 6 z= 8 o= { a: 5, b: 4 }

PS D:\ccc\course\nodejs\code\00-nodejs\03-assign> node assign   // 可以不加 .js
a= 3 b= 4 o= { a: 3, b: 4 } x= 3 y= 4
c= 3 d= 4
c= 3 d= 4
ta= 3 tb= 4
```

## JavaScript 的歷史

[JavaScript 語言](https://zh.wikipedia.org/wiki/JavaScript) 最早是由 [瀏覽器廠商 Netscape](https://zh.wikipedia.org/wiki/%E7%B6%B2%E6%99%AF) 在 1995 年設計的，目的是創建一個可以在瀏覽器當中執行的程式語言。

但是由於 Netscape 推出 LiveScript 的那年，正遭逢微軟強力用 Internet Explorer 強力打擊 Netscape ，而當時另一個軟硬體大廠昇陽 Sun 正好要推出 Java 程式語言 (也是企圖在瀏覽器內運作，稱為 Java Applet)，於是 Netscape 決定與 Sun 合作，就把 LiveScript 的名稱改為 JavaScript 。

微軟透過在 Windows 作業系統裏綁定 Internet Explorer (IE) 瀏覽器而且免費散布的作法，試圖打死 Netscape ，這招確實讓 Netscape 難以招架。

1996年11月，Netscape 正式向ECMA（歐洲電腦製造商協會）提交語言標準。1997年6月，ECMA 以 JavaScript 語言為基礎制定了 ECMAScript 標準規範ECMA-262。所以 ECMAScript 基本上就是 JavaScript 的規格標準。

後來 Netscape 撐不下去了，只好在 1999 年將 Netscape 瀏覽器賣給有線電視大廠 AOL (美國線上) 公司，並且將《Netscape 瀏覽器》原始碼公開，然後成立了 Mozilla 組織來維護《Netscape 瀏覽器》。 

微軟打擊 Netscape 的手段，除了用 windows 綁定 IE 且免費之外，還刻意推出和 JavaScript 不相容的 VBScript 與 JScript ，讓瀏覽器呈現技術分裂狀態，希望透過這樣讓大家向 IE 靠攏！

1998年5月，美國司法部控告微軟，並提出反壟斷訴訟。後來微軟敗訴，並且賠償了 7.5 億美元，

Mozilla 組織後來在 2002 年改推出火狐 Firefox 瀏覽器，後來 Apple 也在 2003 年推出了 Safari 瀏覽器， 之後 Google 也在 2008 年推出了 Chrome 瀏覽器。這些瀏覽器都大力支援 ECMAScript 標準，而微軟的 VBScript 和 JScript 就只能留給 IE 自己去玩了 (後來 IE 自己也不玩了)。

Java 雖然一開始透過 Applet 技術想吃下瀏覽器市場，但是 Applet 卻難用得要死，結果反而讓 [Macromedia 的 Flash 技術](https://zh.wikipedia.org/wiki/Adobe_Flash_Player) 打敗，於是在 1997 到 2010 年之間， Flash 成為了瀏覽器中動畫技術的主力。

Flash 雖然在瀏覽器中稱霸了一段時間，但是當《智慧型手機》技術起來之後，卻遲遲難以將技術引入手機瀏覽器中，除了技術問題之外，賈伯斯當時強烈反對 Flash 進入 iPhone, iPad 也是一個重要原因。

這些原因最後導致 Flash 技術的衰退與滅亡，並且讓 JavaScript 再度成為瀏覽器領域動畫技術的主力語言！

而那個原本想吃下瀏覽器市場的 Java 語言，雖然被 Flash 打得很慘，但是卻在《跨平台桌面應用、企業軟體市場、以及 Google Android 手機》上佔有了重要的地位。

所以雖然 JavaScript 和 Java 兩者都是程式語言，但是卻是非常不一樣的語言 (語法的差異也很大)。 

Java 目前佔有《企業軟體市場與 Android 手機》，而 JavaScript 則是網頁中唯一可以通用的程式語言。

## ES6 新語法

在 2015 年， JavaScript 語法大改版，這個版本被稱為 ECMAScript 6（ES6）。

ES6 裏添加了類別 class，箭頭函式，Generator 等等技術。

後來在 2017 年又在 Generator 上加入了 async/await 語法。

目前在 Node.js 裏，我們常會使用到《解構性賦值、箭頭函數、類別、async/await、模板字符串》等語法。

因此即使你學過 JavaScript，但是仍然必須先學會 《解構性賦值、箭頭函數、類別、async/await、模板字符串》這些新語法。

關於這些主題請參考範例 04-arrow, 05-class, 06-await ，還有以下網頁。

* 解構性賦值 -- 03-assign
  * https://es6.ruanyifeng.com/#docs/destructuring
* 箭頭函數 -- 04-arrow
  * https://es6.ruanyifeng.com/#docs/function#%E7%AE%AD%E5%A4%B4%E5%87%BD%E6%95%B0
* 類別語法 (class) -- 05-class
  * https://es6.ruanyifeng.com/#docs/async
* 同步語法 (async/await) -- 06-await
  * https://es6.ruanyifeng.com/#docs/async
* 模板字符串 -- 07-template
  * https://pjchender.blogspot.com/2017/01/javascript-es6-template-literalstagged.html
  * https://wcc723.github.io/javascript/2017/12/22/javascript-template-string/

在 00-nodejs 的程式範例中，主要就是要學習這些新語法！