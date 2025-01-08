#let layout(
  body,
  title: [],
  subtitle: [],
  author: [],
  publisher: [],
  fonts: (
    sans-serif: (),
    serif: (),
    mono: (),
  ),
) = {
  // 全体のページ設定
  set page(
    paper: "a5",
    binding: left,
    margin: (
      top: 25mm,
      bottom: 15mm,
      inside: 15mm,
      outside: 15mm,
    ),
    numbering: "i",
    header: context {
      set text(font: fonts.sans-serif, size: 8pt)

      let current-chapter = query(heading.where(level: 1)).filter(it => it.location().page() <= here().page()).at(-1, default: none)
      let current-section = query(heading.where(level: 2)).filter(it => it.location().page() <= here().page()).at(-1, default: none)

      block(
        width: 100%,
        stroke: (
          bottom: (thickness: 0.5pt, cap: "butt"),
        ),
        inset: (
          bottom: 2pt,
        )
      )[
        #if calc.even(here().page()) {
          align(left)[
            #box(
              width: 2.5em,
              stroke: (right: (thickness: 1.2pt, cap: "butt")),
              inset: (y: 2pt),
              text(weight: "bold", font: fonts.mono, numbering(here().page-numbering(), here().page())),
            )
            #box(
              inset: (y: 2pt, left: 0.5em),
              if current-chapter != none {
                if current-chapter.numbering != none {
                  numbering(current-chapter.numbering, ..counter(heading).at(current-chapter.location()))
                  h(0.5em)
                }
                current-chapter.body
              }
            )
          ]
        } else {
          align(right)[
            #box(
              inset: (y: 2pt, right: 0.5em),
              // 章があるページではなく、節が現在の章と同じで、かつ節がある場合
              if
                current-chapter.location().page() != here().page() and
                current-section != none and
                counter(heading).at(current-chapter.location()).at(0) == counter(heading).at(current-section.location()).at(0)
              {
                if current-section.numbering != none {
                  numbering(current-section.numbering, ..counter(heading).at(current-section.location()))
                  h(0.5em)
                }
                current-section.body
              }
            )
            #box(
              width: 2.5em,
              stroke: (left: (thickness: 1.2pt, cap: "butt")),
              inset: (y: 2pt),
              text(weight: "bold", font: fonts.mono, numbering(here().page-numbering(), here().page())),
            )
          ]
        }
      ]
    },
    footer: {},
  )

  // フォント
  set text(
    lang: "ja",
    font: fonts.serif,
    size: 9pt
  )
  show raw: set text(font: fonts.mono)
  show strong: set text(font: fonts.sans-serif)

  // 段落の空白を調整
  set par(
    leading: 0.8em,
    justify: true,
    linebreaks: auto,
    first-line-indent: 1em,
  )

  // 見出しのナンバリングとフォントを設定
  show heading: set text(font: fonts.sans-serif)

  // 章の見出し
  show heading.where(level: 1): it => {
    // 常に右ページから始まる
    {
      // 空白ページは何も表示しない
      set page(header: {})
      pagebreak(to: "odd", weak: true)
    }

    // 右寄せにする
    set align(right)
    set text(size: 20pt)

    v(3%)
    // 章番号を表示
    if counter(heading).at(it.location()).at(0) != 0 {
      text(
        fill: luma(100),
        numbering(heading.numbering, ..counter(heading).at(it.location()))
      )
      // ナンバリングには空白があるので、その分を補正
      h(measure("  ").width * -1)
    } else {
      // ナンバリングがない場合はダミーを入れる
      text("")
    }
    v(-12pt)
    it.body
    v(15%)
  }

  // 節の見出し
  show heading.where(level: 2): it => {
    set text(size: 11pt)
    set par(leading: 0.4em)
    set block(above: 2.2em, below: 1em)

    it
  }

  // 項の見出し
  // 節とほぼ同じ
  show heading.where(level: 3): it => {
    set text(size: 10pt)
    set par(leading: 0.4em)
    set block(above: 1.8em, below: 0.8em)

    it
  }

  // 目次より前の節・項は目次に表示しない
  show heading.where(level: 2): set heading(outlined: false)
  show heading.where(level: 3): set heading(outlined: false)

  // 見出しの後の段落が字下げされない問題を修正
  // 空の段落を入れる
  show heading: it => {
    it
    par(text(size: 0pt, ""))
    v(-1em)
  }

  // 目次のスタイル設定
  show outline.entry.where(level: 1): it => {
    v(2em, weak: true)

    // ナンバリングがない場合は節と同じスタイル
    if it.element.numbering == none {
      h(0.5em)
      it
      return
    }

    set text(font: fonts.sans-serif, weight: "bold", size: 10pt)
    it
  }
  show outline.entry.where(level: 2): it => {
    h(0.5em)
    it
  }
  show outline.entry.where(level: 3): it => {
    h(2.8em)
    it
  }
  set outline(depth: 3)

  // タイトルページ
  {
    set page(header: {})

    block(
      width: 100%,
      height: 100%,
    )[
      #set align(center)

      #v(50pt)

      #[
        #set text(font: fonts.sans-serif, weight: "bold")
        #set par(leading: 0.5em)

        #text(size: 24pt, title)

        #v(-5pt)

        #text(size: 18pt, subtitle)
      ]

      #v(40pt)

      #text(size: 10pt, weight: "bold")[#author #h(0.8em) 著]

      #v(1fr)

      #text(size: 12pt, font: fonts.sans-serif, weight: "bold", publisher)
    ]
  }

  body
}

#let document(outlined: true, body) = {
  // 目次
  if outlined {
    outline()
  }

  // ページ番号と見出しのナンバリングを変更
  set page(numbering: "1")
  set heading(numbering: (..args) => {
    let nums = args.pos()
    if nums.len() == 1 {
      numbering("1章  ", ..nums)
    } else {
      numbering("1.1.1 ", ..nums)
    }
  })

  // 目次より後の節・項は目次に表示
  show heading.where(level: 2): set heading(outlined: true)
  show heading.where(level: 3): set heading(outlined: true)

  // ページ番号をリセット
  counter(page).update(1)

  body
}

#let appendix(body) = {
  // 見出しのナンバリングを変更
  set heading(numbering: (..args) => {
    let nums = args.pos()
    if nums.len() == 1 {
      numbering("付録A  ", ..nums)
    } else {
      numbering("A.1.1 ", ..nums)
    }
  })

  // 見出し番号をリセット
  counter(heading).update(0)

  body
}
