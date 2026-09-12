// ==============================================================================
// custom.typ: 全书学术出版与工程规范排版层 (高校硕士学位论文规范 + 中文图书风)
// 适配 Typst 0.11+ / 0.12+，完全基于规则重写，不破坏上游 orange-book 模板
// ==============================================================================

// ------------------------------------------------------------------------------
// 1. 配色体系常量（淡蓝色学术基调，低饱和、无光污染）
// ------------------------------------------------------------------------------
#let color-primary = rgb("#2B5B84")       // 核心学术蓝 (主标题、强调、表线)
#let color-secondary = rgb("#547A9E")     // 次级淡钢蓝 (次级标题、图线)
#let color-accent = rgb("#41729F")        // 点缀蓝
#let color-bg-soft = rgb("#F5F8FA")       // 极淡冰蓝灰底衬 (Callout、代码块、表头底纹)
#let color-border-light = rgb("#D3DFE8")  // 细分隔线 (边框、表格横线)
#let color-text-main = rgb("#222831")     // 正文墨黑 (避免刺眼纯黑，温润沉稳)
#let color-callout-border = rgb("#3C6E96")// Callout 提示线深淡蓝

// ------------------------------------------------------------------------------
// 参考文献国标规范 (GB/T 7714-2015 顺序编码制，由 _quarto.yml 中的 csl 统一接管)
// ------------------------------------------------------------------------------
#set bibliography(
  title: "参考文献",
)

// ------------------------------------------------------------------------------
// 目录样式微调：去除“第几部分 (Part)”的实色蓝底，设为透明底素雅学术排版
// ------------------------------------------------------------------------------
#show outline: it => {
  show box: b => {
    if b.fill != none {
      let fields = b.fields()
      let _ = fields.remove("body")
      box(..fields, fill: none)[
        #set text(fill: color-primary, weight: "bold")
        #b.body
      ]
    } else {
      b
    }
  }
  it
}

// ------------------------------------------------------------------------------
// 2. 字体族定义（兼容 Windows / Linux / macOS）
// ------------------------------------------------------------------------------
#let font-serif = ("Noto Serif SC", "SimSun", "Times New Roman")
#let font-sans = ("Noto Sans SC", "SimHei", "Microsoft YaHei")
#let font-mono = ("Cascadia Code", "Cascadia Mono", "Courier New")

// ------------------------------------------------------------------------------
// 3. 传统中文图书与硕士论文排版规范（宋体正文、黑体标题、首行缩进）
// ------------------------------------------------------------------------------

// 正文基础属性：小四号/五号平衡字号 (11pt)，舒适行高与两端对齐
#set text(
  font: font-serif,
  size: 11pt,
  fill: color-text-main,
  lang: "zh",
)

// 段落设置：标准中文图书缩进（首行缩进 2 字符 2em），行距 1.35 倍
#set par(
  first-line-indent: 2em,
  leading: 0.78em,
  justify: true,
)

// 消除首行缩进的“例外区域”（标题、图表、列表、代码、公式、引用绝不缩进）
#show heading: set par(first-line-indent: 0em)
#show figure: set par(first-line-indent: 0em)
#show table: set par(first-line-indent: 0em)
#show raw: set par(first-line-indent: 0em)
#show list: set par(first-line-indent: 0em)
#show enum: set par(first-line-indent: 0em)
#show math.equation: set par(first-line-indent: 0em)

// ------------------------------------------------------------------------------
// 4. 标题层级体系（黑体，高校硕士论文三级标题规范）
// ------------------------------------------------------------------------------

// 一级标题（章）：由 orange-book 宏接管，我们微调其字体与紧凑度
#show heading.where(level: 1): set text(
  font: font-sans,
  fill: color-primary,
  weight: "bold",
)

// 二级标题（节 - 1.1 类似四号字 13.5pt）
#show heading.where(level: 2): it => block(
  spacing: 1.2em,
  text(
    font: font-sans,
    size: 13.5pt,
    fill: color-primary,
    weight: "bold",
    it
  )
)

// 三级标题（小节 - 1.1.1 类似小四号字 11.5pt）
#show heading.where(level: 3): it => block(
  spacing: 1.0em,
  text(
    font: font-sans,
    size: 11.5pt,
    fill: color-text-main,
    weight: "bold",
    it
  )
)

// 四级标题（类似五号字加粗）
#show heading.where(level: 4): it => block(
  spacing: 0.8em,
  text(
    font: font-sans,
    size: 11pt,
    fill: color-text-main,
    weight: "bold",
    it
  )
)

// ------------------------------------------------------------------------------
// 5. 科技三线表（GB/T 7714 规范，学术简约，杜绝网格杂线）
// ------------------------------------------------------------------------------

// 表格题注置于表格上方，居中，黑体加粗
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.where(kind: "quarto-float-tbl"): set figure.caption(position: top)
#show figure.caption: it => [
  #set align(center)
  #set text(
    font: font-sans,
    size: 10pt,
    weight: "bold",
    fill: color-text-main
  )
  #it
  #v(0.3em)
]

// 三线表边框与表头淡蓝衬底
#show table: set table(
  stroke: (col, row) => if row == 0 {
    // 顶线与栏目底线
    (top: 1.2pt + color-primary, bottom: 0.8pt + color-secondary)
  } else {
    // 内部仅以极细线分割，去除纵向网格线
    (bottom: 0.4pt + color-border-light)
  },
  fill: (col, row) => if row == 0 { color-bg-soft } else { none },
  inset: 7pt,
)

// 表格内文字字号适度缩小为五号/小五号（10pt），内容更紧凑专业
#show table: set text(size: 10pt)

// ------------------------------------------------------------------------------
// 6. 独立数学公式（Math Equations 居中收敛与微调）
// ------------------------------------------------------------------------------
#show math.equation.where(block: true): it => block(
  spacing: 0.7em,
  it
)

// ------------------------------------------------------------------------------
// 7. 代码块外观（学术极简，浅冷灰蓝衬底，细微边框）
// ------------------------------------------------------------------------------
#show raw.where(block: true): it => block(
  fill: color-bg-soft,
  inset: 9pt,
  radius: 2pt,
  stroke: 0.5pt + color-border-light,
  width: 100%,
  it
)

// 行内代码微调
#show raw.where(block: false): set text(
  font: font-mono,
  fill: color-primary,
  size: 9.5pt,
)

// ------------------------------------------------------------------------------
// 8. Callout 提示框重塑（消灭高饱和光污染，采用淡雅学术冷条框）
// ------------------------------------------------------------------------------
#show figure.where(kind: "quarto-callout-Note"): set block(
  stroke: (left: 3pt + color-callout-border, rest: 0.5pt + color-border-light),
  fill: color-bg-soft,
  inset: (x: 12pt, y: 10pt),
  radius: (right: 3pt, left: 0pt),
)

#show figure.where(kind: "quarto-callout-Tip"): set block(
  stroke: (left: 3pt + rgb("#3B7A57"), rest: 0.5pt + rgb("#D5E5DB")),
  fill: rgb("#F6FAF8"),
  inset: (x: 12pt, y: 10pt),
  radius: (right: 3pt, left: 0pt),
)

#show figure.where(kind: "quarto-callout-Warning"): set block(
  stroke: (left: 3pt + rgb("#C07D32"), rest: 0.5pt + rgb("#EEDDC9")),
  fill: rgb("#FCF9F5"),
  inset: (x: 12pt, y: 10pt),
  radius: (right: 3pt, left: 0pt),
)

#show figure.where(kind: "quarto-callout-Important"): set block(
  stroke: (left: 3pt + rgb("#A24857"), rest: 0.5pt + rgb("#E8D3D7")),
  fill: rgb("#FAF5F6"),
  inset: (x: 12pt, y: 10pt),
  radius: (right: 3pt, left: 0pt),
)
