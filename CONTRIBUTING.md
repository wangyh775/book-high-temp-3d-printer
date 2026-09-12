# 《高温 3D 打印机设计与制造》项目贡献指南 (CONTRIBUTING.md)

感谢你关注并有意参与《高温 3D 打印机设计与制造》的编写与建设！

本书旨在汇聚工业界一线研发工程师、高校科研团队与资深创客的智慧，共同打造一本真正面向**工程落地、机理清晰、严谨实用**的高温增材制造专著。

为了确保多人协作下的高效推进、减少 Git 冲突并保障出版级排版质量，请在提交贡献前仔细阅读本指南。

---

## 1. 贡献形式

我们非常欢迎以下形式的贡献：

1. **章节认领与撰写**：独立或联合认领尚未完成的章节，根据大纲撰写核心正文与推导；
2. **工程案例与实测数据补充**：提供工业级高温打印机研制过程中的实物图、实测升温曲线、流场/热场仿真图、失效照片等；
3. **技术审阅与纠错**：指出书中的公式推导疏漏、物理参数矛盾、错别字或表述不严谨之处；
4. **代码与固件配置**：贡献 Klipper / RepRap 固件高温配置宏、热膨胀补偿算法脚本或仿真建模代码；
5. **附录材料与 BOM 完善**：补充最新的特种工程塑料物性数据、关键耐高温核心元器件型号与采购渠道。

---

## 2. 协作与开发工作流

为了防止多人同时修改同一章节造成代码与文本冲突，请严格遵循以下协作流程：

### 第一步：章节认领与沟通（避免重复造轮子）

* 在开始实质性编写前，请先在项目的 **Issues** 中提交认领请求，或在相关任务 Issue 下留言（例如：`[Claim] 认领第3章 机械运动机构与传动构型`）；
* 编写组确认认领状态后，方可开展大规模编写。

### 第二步：克隆仓库与新建分支

切勿直接在 `main` 或 `master` 主分支上修改。请创建语义化的特性分支：

```bash
# 更新主分支最新代码
git checkout main
git pull origin main

# 基于主分支创建你的特性分支
# 分支命名规范：feat/chXX-描述 或 fix/chXX-描述
git checkout -b feat/ch03-motion-system
```

### 第三步：本地编写与规范遵从

* **章节文件定位**：你的所有文字修改应当位于对应的章节目录（如 `chapters/03-motion-system/index.qmd`）；
* **图表存放规范**：所有图片必须保存至该章节下的 `figures/` 目录（如 `chapters/03-motion-system/figures/corexy_layout.svg`），优先使用矢量图（`.svg` / `.pdf`）；
* **文献追加规范**：所有引用的参考文献条目必须追加至该章节的 `references.bib`，并在正文中使用 `[@citekey]` 进行引用，**严禁修改根目录的 `references.bib`**；
* **排版底线**：不要手写原生 LaTeX 文本宏（如 `\textbf`、`\cite`）或原生 HTML 标签，全部使用 Quarto 标准 Markdown 语法；
* **AI 协助提示**：如果你使用 Cursor / Claude Code / Copilot 等智能体辅助写作，**请务必阅读并遵照根目录的 `AGENTS.md` 规范**。

### 第四步：本地编译自检（本地绿灯才提交）

在提交前，请在本地运行 Quarto 命令，确保 Typst PDF 与 HTML 均能零警告顺利渲染：

```bash
# 1. 检查 Typst PDF 编译（orange-book 模板渲染）
quarto render --to typst

# 2. 检查 HTML 站点编译
quarto render --to html
```

若出现任何语法报错、找不到文献 Key 或图表路径断链，请在本地修复完成后再提交。

### 第五步：规范 Commit 信息并提交 PR

我们推荐采用 **Conventional Commits** 规范提交信息：

```bash
git add chapters/03-motion-system/
git commit -m "feat(ch03): 完成高温同步带与导轨选型力学推导"
git push origin feat/ch03-motion-system
```

常用前缀说明：

* `feat(chXX)`: 增加或大幅扩写某章节新内容
* `fix(chXX)`: 修复某章节的公式、代码或文字笔误
* `docs`: 完善文档（如 README、CONTRIBUTING 等）
* `style`: 格式调整与排版优化（不改变工程技术内容）
* `refactor(chXX)`: 章节结构重构

### 第六步：提交 Pull Request (PR) 并参与 Peer Review

1. 访问 GitHub 仓库页面，向 `main` 分支发起 Pull Request；
2. PR 标题清晰说明变动（例如：`feat(ch03): 完成第3章机械传动副与热力学选型初稿`）；
3. 观察 GitHub Actions 自动化编译流程，确保 CI 编译状态为绿色通过（Pass）；
4. 编写组成员将对技术内容与工程参数进行审阅，提出修改建议，共同讨论完善后予以 Merge。

---

## 3. 章节生命周期管理：注册（新增）、注销（删除）与草稿控制

本项目采用**“动态通配与单章独立闭环”**的工程架构，GitHub Actions 会自动动态扫描所有子章节，并同时编译输出整本大合集 PDF、每个章节的独立单章小 PDF，以及 GitHub Pages 网页版。作者对章节进行调整时，请严格遵守以下操作步骤：

### 3.1 注册（新增）一个新章节

以新增第 10 章为例（如 `chapters/10-slicing-strategy/`）：

1. **创建独立章节目录结构**：
   ```text
   chapters/10-slicing-strategy/
   ├── figures/            # 本章专属插图存放目录（禁止跨章节存取图片）
   ├── references.bib      # 本章专属真实参考文献库
   └── index.qmd           # 本章正文源文件
   ```
2. **正文编写规范（严禁冗余提示框）**：
   * 必须以干净标准的二级标题开头（例如 `## 10.1 ...`）；
   * **严禁在正文开头添加**类似“本章导读”、“学习目标”、“单章 PDF 下载链接”等提示框（Callout），这些链接已在全书目录与 GitHub 主页集中展示，在正文中添加会导致导出的单章 PDF 被严重视觉污染。
3. **在 `_quarto.yml` 中完成注册**：
   打开根目录 `_quarto.yml`，在对应分卷追加章节，并在参考文献列表中挂载本章的 `.bib` 文件：
   ```yaml
   book:
     chapters:
       - part: "第四部分 电气控制、传感与固件算法"
         chapters:
           # ... 原有章节 ...
           - chapters/10-slicing-strategy/index.qmd   # <-- 注册章节正文

   bibliography:
     # ... 原有文献库 ...
     - chapters/10-slicing-strategy/references.bib   # <-- 注册本章独立文献库
   ```
4. **在 `README.md` 中添加导航行**：
   在根目录 `README.md` 的【📚 全书章节导览与快速入口】表格中追加该章的网页、PDF 和源码链接。

### 3.2 删除（注销）一个旧章节

当某个章节需要废弃或合并时：

1. **从 `_quarto.yml` 中注销**：
   在 `_quarto.yml` 的 `chapters` 和 `bibliography` 列表中删除（或注释掉）对应行；
2. **移除章节目录**：
   ```bash
   git rm -r chapters/09-pid-and-firmware/
   ```
3. **同步更新 `README.md`**：删除表格中对应行。
4. 提交推送后，GitHub Actions 会自动在全书 PDF、单章 PDF 矩阵和 GitHub Pages 网页版中同步剔除该章节，杜绝死链接。

### 3.3 章节草稿与隐藏（暂不发布）规范

若章节正处于撰写中，不想让它被公开编译到全书 PDF 或发布到 GitHub Pages：

1. 在 `_quarto.yml` 中使用 `#` 注释掉该章节条目；
2. 将文件夹名称前加上下划线（例如 `chapters/_10-draft/`）：
   * Quarto 与 CI 脚本在扫描时会自动忽略带下划线（`_`）的文件夹；
   * 本地作者依然可通过命令单独预览和编译它：
     ```bash
     quarto preview chapters/_10-draft/index.qmd
     ```
   * 待定稿后移除下划线并在 `_quarto.yml` 中解除注释即可一键正式上线。

### 3.4 常用单章与全书编译命令速查

| 操作场景 | 执行命令 | 输出与效果 |
| :--- | :--- | :--- |
| **单章网页实时预览** | `quarto preview chapters/01-introduction/index.qmd` | 浏览器直达该章，保存即 0.5s 热重载 |
| **单章独立 PDF 编译** | `quarto render chapters/01-introduction/index.qmd --profile chapter --to typst` | 生成 `_book/chapters/01-introduction/index.pdf`（仅 200~300KB） |
| **全书整本 PDF 编译** | `quarto render --to typst` | 生成 `_book/high-temp-3d-printer.pdf`（整本大专著） |
| **全书网页站点编译** | `quarto render --to html` | 生成 `_book/index.html`（整站网页） |

---

## 4. Main 主分支保护与合并门禁机制

为了保证全书始终处于随时可编译出高水准 Typst 彩印 PDF 的稳定状态，仓库已对 `main` 分支启用了**强制分支保护（Branch Protection）**：

1. **禁止直接推送**：严禁且无法直接执行 `git push origin main`，任何代码变动必须通过特性分支以 Pull Request (PR) 形式提交。
2. **强制 CI 编译通过（Required Status Check）**：每个 PR 提交或更新后，GitHub Actions 会自动触发 `Build Book & Deploy to GitHub Pages` 流水线。**只有 `build` 任务绿灯通过（Typst PDF 与 HTML 双端零错误渲染）方可合入**。
3. **强制同行评审（Peer Review）**：PR 必须获得至少 1 位编写组成员（Reviewer）的审查批准（Approved）。
4. **禁止强制推送与删除**：`main` 分支禁止 `git push --force` 与删除分支操作。

---

## 5. 全书统一工程参数基线

多人编写专著最忌讳各章节参数互相打架。在涉及整机工程指标时，所有章节必须对齐以下基线：

* **喷嘴极限温度**：$\ge 450^\circ\text{C}\sim 500^\circ\text{C}$
* **恒温热室工作温区**：$90^\circ\text{C}\sim 150^\circ\text{C}$（典型针对 PEEK $T_g \approx 143^\circ\text{C}$）
* **成型热床温度**：$120^\circ\text{C}\sim 200^\circ\text{C}$
* **外壳人体安全触碰温度**：$\le 55^\circ\text{C}$（依据 GB/T 8464）
* **基准研究材料**：PEEK、PEKK、PEI (ULTEM 9085/1010)、PPS 以及短切碳纤增强系列（CF-PEEK 等）

---

## 6. 学术诚信与文献规范

* **拒绝虚构文献**：引用的文献必须真实可信，必须具有作者、刊名、年份和真实 DOI，杜绝一切未经核实的幻觉文献；
* **原创与版权归属**：严禁直接抄袭国内外专著或商业公司保密文档。引用已有研究成果或行业公开数据时，必须如实标明来源。

---

## 7. 作者署名与致谢机制

* **贡献确认**：所有通过 PR 参与本书实质性撰写、深度审稿、重要数据或图表提供的贡献者，都将在本书前言的**“编写组名单”**中予以正式署名；
* **章节署名**：对于主笔完成某个完整章节的作者，将在该章节开头以作者身份署名并注明所属工作机构/团队；
* **开源协议**：全书内容统一基于 [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh) 协议发布，共同维护开源知识成果。
