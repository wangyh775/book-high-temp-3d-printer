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

## 🏗️ 全书目录架构

全书划分为四个核心技术篇章与实用附录：

* **[前言](index.qmd)**：编写背景、读者对象与阅读指南
* **第一部分：硬件架构与恒温物理场设计**
  * **第 1 章 [高温 3D 打印技术概述](chapters/01-introduction/index.qmd)**：特种塑料物性、结晶动力学机理与整机顶层指标
  * **第 2 章 [高温恒温腔室与热管理设计](chapters/02-chamber-design/index.qmd)**：腔室稳态热平衡、复合绝热壁板与均温对流风道
* **第二部分：机械运动机构与热膨胀补偿**
  * **第 3 章 [机械运动机构与传动构型](chapters/03-motion-system/index.qmd)**：CoreXY/门式龙门对比、高温传动副选型与惯量匹配
  * **第 4 章 [热膨胀抑制与机械补偿设计](chapters/04-thermal-compensation/index.qmd)**：结构各向异性膨胀、运动铰链解耦与动态热漂移校准
* **第三部分：超高温挤出与热端系统**
  * **第 5 章 [超高温热端结构与热阻断](chapters/05-hotend-design/index.qmd)**：500℃ 喉管超强热阻断、熔体剪切流变与主动水冷回路
  * **第 6 章 [进料驱动与防碳化退火机构](chapters/06-extruder-system/index.qmd)**：双驱动挤出夹持力学、入料区主动冷却与防回火退火
* **第四部分：电气控制、传感与固件算法**
  * **第 7 章 [电气系统隔离与高温耐受布置](chapters/07-control-electronics/index.qmd)**：腔外冷区隔离布局、高温电机/线束耐温等级与电磁兼容
  * **第 8 章 [极端温场测量与信号调理](chapters/08-thermal-sensors/index.qmd)**：PT1000/热电偶测量方案、高精度 ADC 滤波与非线性校正
  * **第 9 章 [固件算法、多温区解耦与自适应控制](chapters/09-pid-and-firmware/index.qmd)**：热端-腔室耦合解耦 PID、前馈补偿与主流固件改造
* **附录**
  * **附录 A [特种工程塑料物性与成型工艺指南](appendices/01-materials/index.qmd)**
  * **附录 B [工业级高温 3D 打印机核心 BOM 清单](appendices/02-bom/index.qmd)**

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
# 启动本地实时热重载预览（推荐写作时使用）
quarto preview

# 编译为交互式 HTML 网站（产物输出至 _book/ 目录）
quarto render --to html

# 编译为专业彩印级 Typst PDF 专著（产物输出至 _book/high-temp-3d-printer.pdf）
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
