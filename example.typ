#import "@preview/roremu:0.1.0": roremu

#import "book.typ": *

#show: layout.with(
  title: [タイトル],
  subtitle: [サブタイトル],
  author: [著者名],
  publisher: [出版社],
  fonts: (
    sans-serif: ("Hiragino Kaku Gothic ProN"),
    serif: ("Hiragino Mincho ProN"),
    mono: ("UDEV Gothic 35NFLG"),
  ),
)

= まえがき

#lorem(100)

== まえがきの見出し

#lorem(200)

== まえがきの見出し2

#lorem(300)

#show: document

= おっきい見出し <chp:1>

*5000兆円欲しい！！！！*
これは参照のテストです。詳しくは、@img:example と @tab:example をご覧ください。また、@chp:1 にも参照があります。

#roremu(100)

#figure(
  caption: "なんかいい感じの画像",
  rect(image("example.png")),
) <img:example>

#roremu(300)

#roremu(500)

#figure(
  caption: [なんかいい感じの表],
  table(
    columns: (3fr, 5fr),
    align: left,
    table.header([メソッド], [説明]),
    [`__init__(self, input_size, hidden_size, output_size)`],
    [
      初期化を行う。\
      引数は頭から順に、入力層のニューロンの数、隠れ層のニューロンの数、出力層のニューロンの数。
    ],
    [`predict(self, x)`],
    [
      認識（推論）を行う。\
      引数を`x`の画像データ。
    ],
    [`loss(self, x, t)`],
    [
      損失関数の値を求める。\
      引数の`x`は画像データ、`t`は正解ラベル（以下の3つのメソッドの引数についても同様）。
    ],
    [`accuracy(self, x, t)`],
    [認識精度を求める。],
    [`numerical_gradient(self, x, t)`],
    [重みパラメータに対する勾配を求める。],
    [`gradient(self, x, t)`],
    [
      重みパラメータに対する勾配を求める。
      `numerical_gradient()`の高速版！\
      実装は次章で行う。
    ]
  )
) <tab:example>

#roremu(300)

#roremu(200)

#roremu(500)

#roremu(500)

= 次のおっきい見出し

#roremu(500)

#figure(
  caption: "長いキャプション長いキャプション長いキャプション長いキャプション長いキャプション長いキャプション長いキャプション",
  rect(image("example.png")),
)

== 中くらいの見出し

#roremu(200)

#figure(
  caption: "なんかいい感じの画像(小さい版)",
  rect(image("example.png", width: 50%)),
)

== すげええええええええええええ長い見出しいいいいいいいいいいいい

=== ちっちゃい見出し

#roremu(500)

#roremu(500)

#roremu(500)

=== ちっちゃい見出し2

#roremu(500)

=== ちっちゃい見出し3

#roremu(500)

```ts
function hello(name: string): string {
  return `Hello, ${name}!`;
}
```

= 最後の見出し

#roremu(400)

== 見出し1

#roremu(400)

== 見出し2

#roremu(400)

== 見出し3

#roremu(400)

== 見出し4

#roremu(400)

== 見出し5

#roremu(400)

#show: appendix

= 付録だよ

#roremu(100)

== 付録の見出し

#roremu(200)

== 付録の見出し2

#roremu(300)

=== 付録のちっちゃい見出し

#roremu(500)

=== 付録のちっちゃい見出し2

#roremu(800)
