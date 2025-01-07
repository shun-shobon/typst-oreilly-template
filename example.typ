#import "@preview/roremu:0.1.0": roremu

#import "book.typ": *

#show: layout.with(
  title: [タイトル],
  subtitle: [サブタイトル],
  author: [著者名],
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

= おっきい見出し

#roremu(100)

#roremu(300)

#roremu(500)

#roremu(300)

#roremu(200)

#roremu(500)

#roremu(500)

= 次のおっきい見出し

#roremu(500)

== 中くらいの見出し

#roremu(200)

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
