# C 語言該怎麼學才好？

資工系通常用 C 語言當第一門語言，但是大一學生通常會有很多困惑？

然後學了 C 語言之後，就想說甚麼程式都用 C 來寫，結果當然是悲劇！

拿 C 語言去寫《視窗、網站、APP》，全都是拿石頭砸自己腳的感覺。

C 語言基本上最強的就是以下幾個領域

1. 嵌入式系統：單晶片、沒有作業系統的系統，或者掛上嵌入式作業系統的系統。
2. 系統軟體：編譯器、組譯器、虛擬機
3. 作業系統：大部分作業系統都是 C 語言設計的，UNIX/Linux 特別重要
4. 系統程式： Linux 系統程式/Windows 系統程式 (例如撰寫效率很好的 server 等等)

所以若要學習 C 語言，我建議按下列順序

1. 先找一本基礎的 C 語言書，學會基礎的程式，包含指標也要會 (指標裡儲存的是記憶體位址，所有的指標都還原成記憶體位址去想，就會通了)
2. 開始學習 Linux 系統程式設計，像是 open/read/write/dup/fork/exec/pipe/mmap/pthread/epoll/socket/ ....
3. 熟練 Linux 系統程式設計後，開始學習作業系統設計 (建議選定 RISC-V 處理器)
    * 電子書 -- [從 RISC-V 處理器到 UNIX 作業系統](https://github.com/riscv2os/riscv2os/wiki)
4. 學習編譯器設計，例如 c4, rubi, shecc
    * C4 -- https://github.com/ccc-c/c4/wiki
    * rubi -- https://github.com/embedded2015/rubi
    * shecc -- https://github.com/jserv/shecc

這樣的順序，是比較能真正學好 C 語言的步驟！

