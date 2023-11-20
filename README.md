# cccsite -- 陳鍾誠的 Hugo 網站

建構方法

1. 根據下列文件的步驟，我改成使用 [techdoc](https://themes.gohugo.io/themes/hugo-theme-techdoc/) 這個模板，然後創建了 [hugobuild.sh](hugobuild.sh) 這個 shell script

* https://gohugo.io/getting-started/quick-start/

2. 執行 ./hugobuild.sh cccsite 會得到一個 cccsite 的網站

3. 在 techdoc 的 github 站中，有個 exampleSite ，裡面有個 config.toml ，把它複製過來，蓋掉原本的 hugo.toml

* https://github.com/thingsym/hugo-theme-techdoc/blob/master/exampleSite/config.toml

4. 修改 hugo.toml 成為我想要的樣子，然後在 content 中放入自己想要的內容，包含 _index.md 等檔案。

5. 在 github 中的專案 setting 中選取 pages ，然後在 Build and deployment 中選擇 github action，接著選擇 browse all workflows, 搜尋 hugo ，然後按下 configure ，這時會創建該 action 的 `.github/workflows/hugo.yml` 檔案，接受預設內容。

6. 然後到專案主頁中的 action 你會看到目前的建置佈署情況 ... ，等到佈署完畢，他會告訴你，已經佈署到下列網址

*  https://cccsite.github.io/cccsite/




