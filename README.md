# 《高温 3D 打印机设计与制造》

> **机械构型、热场管理、高温挤出与嵌入式控制**  
> An Engineering Guide to High-Temperature 3D Printer Design and Manufacturing

[![Build Book & Deploy](https://github.com/wangyh775/book-high-temp-3d-printer/actions/workflows/build-and-deploy.yml/badge.svg)](https://github.com/wangyh775/book-high-temp-3d-printer/actions/workflows/build-and-deploy.yml)
[![Online Book](https://img.shields.io/badge/在线阅读-GitHub%20Pages-brightgreen.svg)](https://wangyh775.github.io/book-high-temp-3d-printer/)
[![Download PDF](https://img.shields.io/badge/PDF下载-高清完整版-orange.svg)](https://wangyh775.github.io/book-high-temp-3d-printer/high-temp-3d-printer.pdf)
[![Quarto](https://img.shields.io/badge/framework-Quarto-blue.svg)](https://quarto.org/)
[![Typst](https://img.shields.io/badge/engine-Typst-orange.svg)](https://typst.app/)

---

## 📖 专著简介

随着增材制造技术向航空航天、汽车轻量化、生物医疗等严苛工业场景拓展，以 PEEK（聚醚醚酮）、PEKK（聚醚酮酮）、PEI（聚醚酰亚胺/ULTEM）为代表的**特种工程塑料（High-Performance Polymers, HPPs）**已成为高端 3D 打印的核心发展方向。

然而，特种工程塑料的成型需要严苛的热工边界（熔融加工温度 $\ge 350^\circ\text{C}\sim 450^\circ\text{C}$，结晶敏感温区 $90^\circ\text{C}\sim 150^\circ\text{C}$），面临高温卡料、热应力翘曲开裂及层间结合强度衰减三大行业瓶颈。

本书由多位增材制造装备研发工程师与高校科研人员联合编写，旨在全面解构**工业级高温 3D 打印机的设计方法论与工程实现**，从底层热物理场传递、机械构型热稳定性、超高温挤出流变学，到嵌入式闭环温控与固件算法，提供一套系统化、可落地的工程设计参考指南。

---

## 📚 全书章节导览与快速入口

点击下表链接可直接在线阅读各章节，或单独预览/下载单章独立 PDF（每章仅约 200~300 KB，无需等待整本大文件下载）：

| 篇卷分部 | 章节编号与主题 | 网页在线阅读 | 单章独立 PDF 预览 | 源码 Markdown |
| :--- | :--- | :---: | :---: | :---: |
| **开篇** | **前言** 编写背景、读者对象与体例说明 | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/) | [📥 全书 PDF (1.5M)](https://wangyh775.github.io/book-high-temp-3d-printer/high-temp-3d-printer.pdf) | [`index.qmd`](index.qmd) |
| **第一部分** 硬件架构与恒温物理场 | **第 1 章** 高温 3D 打印技术概述 | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/01-introduction/) | [📄 单章 PDF](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/01-introduction/index.pdf) | [`源码`](chapters/01-introduction/index.qmd) |
| | **第 2 章** 高温恒温腔室与热管理设计 | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/02-chamber-design/) | [📄 单章 PDF](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/02-chamber-design/index.pdf) | [`源码`](chapters/02-chamber-design/index.qmd) |
| **第二部分** 机械运动与热膨胀补偿 | **第 3 章** 机械运动系统与部件选型 | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/03-motion-system/) | [📄 单章 PDF](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/03-motion-system/index.pdf) | [`源码`](chapters/03-motion-system/index.qmd) |
| | **第 4 章** 热膨胀抑制与结构补偿 | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/04-thermal-compensation/) | [📄 单章 PDF](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/04-thermal-compensation/index.pdf) | [`源码`](chapters/04-thermal-compensation/index.qmd) |
| **第三部分** 超高温挤出与热端系统 | **第 5 章** 超高温热端结构设计 | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/05-hotend-design/) | [📄 单章 PDF](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/05-hotend-design/index.pdf) | [`源码`](chapters/05-hotend-design/index.qmd) |
| | **第 6 章** 挤出机构与高温线材驱动 | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/06-extruder-system/) | [📄 单章 PDF](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/06-extruder-system/index.pdf) | [`源码`](chapters/06-extruder-system/index.qmd) |
| **第四部分** 电气控制、传感与固件算法 | **第 7 章** 高温电气与供电系统设计 | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/07-control-electronics/) | [📄 单章 PDF](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/07-control-electronics/index.pdf) | [`源码`](chapters/07-control-electronics/index.qmd) |
| | **第 8 章** 高温测温与高精度采样 | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/08-thermal-sensors/) | [📄 单章 PDF](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/08-thermal-sensors/index.pdf) | [`源码`](chapters/08-thermal-sensors/index.qmd) |
| | **第 9 章** 温度闭环控制与固件配置 | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/09-pid-and-firmware/) | [📄 单章 PDF](https://wangyh775.github.io/book-high-temp-3d-printer/chapters/09-pid-and-firmware/index.pdf) | [`源码`](chapters/09-pid-and-firmware/index.qmd) |
| **附录** | **附录 A** 典型高温线材物性参数表 | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/appendices/01-materials/) | [📄 单章 PDF](https://wangyh775.github.io/book-high-temp-3d-printer/appendices/01-materials/index.pdf) | [`源码`](appendices/01-materials/index.qmd) |
| | **附录 B** 整机核心物料清单（BOM） | [🌐 网页阅读](https://wangyh775.github.io/book-high-temp-3d-printer/appendices/02-bom/) | [📄 单章 PDF](https://wangyh775.github.io/book-high-temp-3d-printer/appendices/02-bom/index.pdf) | [`源码`](appendices/02-bom/index.qmd) |

---

## 💻 本地阅读与编译指南

本书源码基于现代出版工具链 **Quarto** 构建，PDF 渲染采用前沿排版引擎 **Typst**（使用 `quarto-ext/orange-book` 专著主题）。

### 1. 前置环境要求

1. **Quarto CLI**：推荐安装最新版 [Quarto (>= 1.5.0)](https://quarto.org/docs/get-started/)
2. **中文字体支持**：
   * 思源宋体 / Noto Serif CJK SC（正文字体）
   * 思源黑体 / Noto Sans CJK SC（无衬线字体）
   * Cascadia Code 或 JetBrains Mono（等宽代码字体）
   * *(Ubuntu/Debian 快速安装：`sudo apt-get install -y fonts-noto-cjk`)*

### 2. 常用操作命令

克隆本项目到本地后，在根目录下执行：

```bash
# 单章网页实时预览（专注某一章，保存即 0.5s 热重载）
quarto preview chapters/01-introduction/index.qmd

# 仅编译某一章的独立 PDF（耗时 1 秒，产物位于 _book/chapters/01-introduction/index.pdf）
quarto render chapters/01-introduction/index.qmd --profile chapter --to typst

# 启动全书本地实时热重载预览
quarto preview

# 编译整本交互式 HTML 网站（产物输出至 _book/ 目录）
quarto render --to html

# 编译整本专业彩印级 Typst PDF 专著（产物输出至 _book/high-temp-3d-printer.pdf）
quarto render --to typst

# 检查当前 Quarto 环境与依赖健全性
quarto check
```

---

## 🚀 持续集成与发布

本项目配置了基于 GitHub Actions 的全自动化 CI/CD 流水线：

* **每次提 PR**：自动触发 Typst PDF 与 HTML 编译测试，验证标记语法与文献引用完整性；
* **合并至主分支**：自动编译最新版本并无缝发布至 **GitHub Pages**，同时在 Release/Artifacts 中归档可供打印下载的最新完整版 PDF。

---

## 🤝 参与贡献与团队协作

本项目为开源协作项目，诚邀高校师生、装备研发工程师与开源创客参与编写、勘误与补充实战案例！

* 详细贡献流程、章节认领与规范请参阅：**[CONTRIBUTING.md](CONTRIBUTING.md)**
* 智能体（AI Agent）协助编写的权限与技术栈红线请参阅：**[AGENTS.md](AGENTS.md)**

---

## 📄 版权与许可

本书内容遵循 [CC BY-NC-SA 4.0 (知识共享 署名-非商业性使用-相同方式共享 4.0 国际许可协议)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh) 开源发布。
