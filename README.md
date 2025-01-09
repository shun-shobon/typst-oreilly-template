# オライリー風 Typst テンプレート

オライリー風の組版を実現するための Typst テンプレートです。

## 使い方

`book.typ`を読み込んで、`layout`を使ってください。

```typ
#import "book.typ": *

#show: layout.with(
  title: [タイトル],
  subtitle: [サブタイトル],
  author: [著者名],
  publisher: [出版社],
  // フォントの設定
  fonts: (
    sans-serif: ("Hiragino Kaku Gothic ProN"),
    serif: ("Hiragino Mincho ProN"),
    mono: ("UDEV Gothic 35NFLG"),
  ),
)

#show: document

...
```

このパッケージは以下の関数を提供しています。

- `layout`: 全体のレイアウトやスタイルの設定を行う関数です。引数としてタイトルなどの情報とフォントの設定を渡してください。
- `document`: 本文を始める前に呼び出してください。これより前の文章はまえがきになり、ページ番号もローマ数字になります。また、目次もここで自動生成されます。
- `appendix`: 付録を書く場合に呼び出してください。章番号がアルファベットになります。
