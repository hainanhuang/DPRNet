# 投稿记录 (Submission Log)

> 逐次投稿的事实台账：目标刊、级别、日期、稿件版本、结果、原因、下一步。
> 配合「投稿漏斗」串行策略使用（一稿一投，被拒即转，见文末）。
> 期刊级别以本人学校《计算机科学与技术》T4+ 毕业名单为准；推荐清单见
> `/Users/bytedance/WorkSpace/DPRNet/DPRNet_投稿推荐.csv`。

---

## 投稿一览表

| # | 目标刊 | 级别 | 出版社 | 投稿日 | 稿件版本 | 状态 | 结果日期 | 结果 |
|---|---|---|---|---|---|---|---|---|
| 1 | Neurocomputing | T2 | Elsevier | 2026-07-29 | `main_els`（elsarticle 单栏） | ❌ Desk reject → **拒绝转投(ATS Declined)** | 2026-08-01 | 编辑初筛拒稿，转投候选无对口刊，已选 Do not transfer |
| 2 | **Machine Vision and Applications (MVAP)** | T4 | Springer | **2026-08-02** | `main_springer`（价值锚点重构版） | ↩️ **作者主动撤稿** | **2026-09-01** | 撤稿时页面仍显示 `With editor`；因毕业时限不能接受预期长周期而撤回，非拒稿 |
| 3 | **Computers & Graphics** | T4 | Elsevier | 待投稿 | `main_els` 待改为 C&G 双匿名投稿版 | 🛠️ **当前目标，准备中** | — | 订阅发表无 APC；历史指标约 78 天实质审稿、105 天投稿到录用 |
| 4 | The Visual Computer (TVCJ) | T3 | Springer | 计划中（备投） | `main_springer`（同一正文，换 Cover Letter） | ⏳ 备用 | — | 订阅发表无 APC；作为 C&G 未录用后的下一站 |

---

## 详细记录

### 投稿 #1 — Neurocomputing（Elsevier，T2）

- **稿件编号（Ms. Ref. No.）**：`NEUCOM-D-26-16600`
- **标题**：Dynamic Prototype Routing for Lightweight Image Super-Resolution
- **通讯作者**：Hainan Huang（黄海南），China University of Geosciences (Wuhan)；第二作者 Xiang Li（李向）
- **投稿日期**：2026-07-29
- **投稿稿件**：`paper/main_els.tex` → `submit/` 套装（`manuscript_latex_source.zip` / `main_els.pdf` / `abstract.docx` / `highlights.docx` / `cover_letter_neurocomputing.txt`）
- **投稿系统**：Elsevier 新版 "Upload your submission files"（非旧 Editorial Manager 界面）
- **投稿元数据**：subject area = Computer Vision；关键词 6 个；competing interest 在系统内勾选"无"确认。
- **结果**：2026-08-01 收到**编辑级 desk reject**（初筛未送外审）+ **Article Transfer Service (ATS)** 转投 offer。
- **拒稿理由（原文）**：
  > "This paper looks like a fairly straightforward application of existing algorithms.
  > The distinctive contributions to Neural Networks or Learning systems are weak.
  > We receive a much larger number of papers than we are able to accept."
- **转投 offer**：可免重投/免重排把稿件与信息转到另一本 Elsevier 期刊；**答复截止 2026-08-30 23:59**；不保证录用。
  - Agree to Transfer / Decline to Transfer 二选一。
- **归因分析**：Neurocomputing 定位为"神经网络/学习系统"的方法贡献；本文是 CV/图像超分的**工程模块替换**且精度**追平** CATANet，编辑判定对该刊读者的**新意/契合度不足**。属**范围契合 + 新意感知**问题，与既有软肋（"追平精度 + 更重"）一致，非数据/写作硬伤，且未进外审。

#### 针对本次拒稿的决策（待用户确认执行）

1. **ATS 硬规则**：转投目标**必须在 T4+ 名单内**，且应为 **CV/图像类**期刊（勿转通用 ML/NN 刊，会撞同一"新意不足"墙）。
   - 若 ATS 选刊页提供 **CVIU** 或其他 T4+ 的 CV/图像刊 → 可转投（省重排）。
   - 若只提供非名单刊或通用 ML 刊 → **Decline**，改重新投稿。
2. **投稿前必做（无论转投/重投）**：
   - **价值锚点重构**：Abstract/引言/效率段把卖点从"追平精度"改为"可解释、抗坍缩的置信度路由 + 即插即用 + 3-seed 扎实消融，仍显著轻于 SwinIR/SRFormer-light"。
   - **换针对性 Cover Letter**：正面预防"新意不足"质疑，突出 DPR 的机制贡献而非精度碾压。
3. **下一个最佳落点（若 Decline）**：CVIU（T3/Elsevier/免费/可复用 elsarticle）为首选；备选 The Visual Computer（T3/Springer/免费）、Machine Vision and Applications（T4/Springer/免费，录取概率更高）。

#### 执行记录（2026-08-01）

- **ATS 决定：Declined（选 "Do not transfer submission"）**。转投页给出的 10 个候选刊经真实 T4+ 名单核对：
  - 在名单内的仅 Pattern Recognition(T1)、Neural Networks(T2)、Big Data Research(T2)；
  - 其余 7 个（Array/Displays/BSPC/ISWA/Franklin/NLP Journal/Systems&Soft）**均不在名单**，投了不计入毕业；
  - Pattern Recognition 虽 T1 达标，但对"追平型"稿件 desk/审稿风险高；Neural Networks/Big Data 与 #1 同属"通用 NN/学习"错配方向。
  - 结论：无"名单内 + CV/图像对口 + 现实可中"的转投目标 → 拒绝转投，改重新投稿。
- **价值锚点重构（已完成，投稿前必做项①）**：改 `sections/0_abstract.tex` 摘要 + `sections/1_introduction.tex`「Our approach」段，把叙事从"精度追平"移到**"机制层面贡献：把 center-based 路由改造为 confidence-aware 路由；即插即用；三-seed 受控消融隔离各设计；改进归因于路由设计而非增容"**。效率段末句已有"trade a modest cost increase ... for an interpretable, confidence-aware routing"表述，保留。
  - 摘要重排后压到 246 词（≤250 限制），`main_els` 重编译 37 页、0 undefined。
  - 同步 `make_docx.py` → 刷新 `submit/abstract.docx`（246 词）与整套 `submit/` 投稿件。
- **推荐表已按真实名单重建**：`DPRNet_投稿推荐.csv` 现以 CVIU / The Visual Computer / RTIP / MMTA / MVAP / IET-IP / PRL 等**名单内 CV/图像刊**为主，并显式标注"避免"档（Neurocomputing/Neural Networks/ASOC 通用 NN 方向；TIP/TPAMI/CVPR 冲顶）。

#### 决策更新（2026-08-01，晚）：改投两个免费 Springer 刊，"先投一个、被拒即转"

- **背景**：用户先接受 ¥7000–10000 版面费，后明确"**我需要的只是中稿概率高的期刊**"；且核实 **IET Image Processing 实为纯 Gold OA、APC≈$2800≈¥2万（超预算，无免费通道）**，故放弃 IET-IP。
- **决策**：不再走 Elsevier CVIU（避免与 #1 同体系连续 desk reject 风险），改为**两个免费 Springer 刊并行准备、串行投递**：
  - **首投 = MVAP（Machine Vision and Applications，T4，Springer，免费，~70%）**——达标即毕业，命中率最高，且刊名直指 machine-vision applications，与本文"实用轻量 SR 模块"最契合。
  - **备投 = The Visual Computer（TVCJ，T3，Springer，免费，~60%）**——MVAP 被拒即转，稿件与作者信息零重排。
- **稿件**：新建 `paper/main_springer.tex`（两刊共用）。因 `sn-jnl.cls` 不在 CTAN、本环境联网获取全部失败，改用标准 `article` 12pt 单栏类——Springer 首投接受可编辑源、不强制模板，录用后再套 `sn-jnl.cls [iicol]`。字体上用 `lmodern`+`T1` 绕过沙箱 pk 位图生成限制。**编译通过：33 页、0 undefined、44 条参考文献。**
- **两封 Cover Letter 已就绪**：`cover_letter_mvap.txt` / `cover_letter_tvcj.txt`——正面预防"新意不足"（直述 TAB 四点缺陷 + DPR 机制贡献 + 即插即用可复用 + 诚实的精度/效率刻画 + 3-seed 消融）；仅刊名与"契合段"不同，稿件标题/作者一字不改。
- **投稿套装**：`make_springer_kit.sh` → `submit_springer/`（`main_springer.pdf` 单一 PDF 主稿 + `manuscript_latex_source.zip` 可编辑源 + 两封 cover letter + `README.txt` 上传指引）。源 zip 已独立 test-compile 通过 33 页，证明自洽。Springer 声明（作者贡献/competing interest/data availability）已在稿件 back matter，无需单独文件。

- **~~待办（投稿前必做项②）~~**：~~起草 CVIU 版 Cover Letter~~ → 已由 MVAP/TVCJ 两封 Cover Letter 取代（CVIU 路线已弃用）。

---

### 投稿 #2 — Machine Vision and Applications（Springer，T4）↩️ 已撤稿

- **标题**：Dynamic Prototype Routing for Lightweight Image Super-Resolution
- **通讯作者**：Hainan Huang（黄海南），China University of Geosciences (Wuhan)，`huanghainan.7@cug.edu.cn`；第二作者 Xiang Li（李向）
- **投稿日期**：**2026-08-02**
- **投稿系统**：Springer Nature 新版投稿平台 `submission.springernature.com`（已取代旧 Editorial Manager）
- **Article type**：**Research**（非 Brief Report——后者篇幅受限会逼砍消融，而消融是本文对抗"新意不足"的核心武器）
- **投稿稿件**：`paper/main_springer.tex` → `submit_springer/` 套装
  - 主稿以 **LaTeX 源 zip**（`manuscript_latex_source.zip`，含预编译 `.bbl`）上传，平台服务端自行编译（新版平台要求可编辑源，非传 PDF）。
  - Cover letter：`cover_letter_mvap.pdf`（本轮新建 `.tex` 源编译，2 页 PDF 文件上传）。
- **投稿页逐项决策（备查/备投复用）**：
  - **Files**：传 LaTeX 源 zip；Figures and tables / Supplementary material 初投不单独上传（图已在 zip 内，录用后才需高清原图）。
  - **Details**：Title/Abstract 与稿件逐字一致（页面强校验）；Collection 留空（非专刊）。
  - **Authors**：Given=Hainan / Family=Huang（首字母大写）+ 机构邮箱；Add another author = Xiang Li；主单位 China University of Geosciences (Wuhan)。
  - **Author Contributions Statement**：用 initials 叙述（H.H. 实现+全部实验+画图+初稿；X.L. 指导+经费+定稿；All authors approved）——此栏会**取代**稿件内 CRediT 作为发表版。
  - **Third party material**：选 **No**（结果图为自制、底图为公开 benchmark 且正文已 `\cite` 六个数据集，无需版权许可）。
  - **Competing interests**：无；**Data availability**：公开数据集、无新数据、代码因机构限制不公开。
- **稿件技术要点**：标准 `article` 12pt 单栏（`sn-jnl.cls` 不在 CTAN 无法获取，Springer 首投不强制模板）；`lmodern`+`T1` 绕过沙箱 pk 字体生成；复用全部 shared sections/tables/figures + 价值锚点重构版摘要/引言。编译 **33 页、0 undefined、44 条参考文献**。
- **撤稿前状态**：页面显示 **With editor**，未显示已进入同行评审。
- **撤稿日期**：**2026-09-01**。
- **撤稿性质**：作者因毕业时间约束主动撤回，**不是编辑拒稿**；原投稿不得与下一刊形成重叠投稿。
- **撤稿后状态**：用户已确认撤稿完成，可以开始下一刊投稿流程。
- **下一步**：转投 **Computers & Graphics**。现有 Elsevier 稿件可作为基础，但该刊采用双匿名评审，不能直接上传当前含作者身份的 `main_els.pdf`。

---

### 目标 #3 — Computers & Graphics（Elsevier，T4）🛠️ 准备中

- **选择理由**：学校名单名为 `COMPUTERS & GRAPHICS-UK`，T4；选择订阅发表路线无 APC。已核验的历史指标约为实质审稿 78 天、投稿到录用 105 天，但不保证单篇时长。
- **投稿入口**：<https://www.editorialmanager.com/CAG>
- **评审方式**：双匿名。匿名主稿必须删除作者、单位、邮箱、致谢、基金及其他可识别身份的信息；作者信息单独放入 title page。
- **当前可复用基础**：`main_els.tex`、`preamble_els.tex`、共享的 sections/tables/figures、`highlights_els.txt` 和利益冲突声明。
- **提交前要完成**：
  1. 将 `main_els` 从 Neurocomputing 定制版改为 C&G 版本，并生成匿名审稿 PDF；
  2. 单独制作 title page、C&G cover letter、highlights 和 Declaration of Interest；
  3. 按实际使用情况准备 generative-AI 写作声明，不能遗漏或虚构；
  4. 清理 PDF 元数据和文件名中的作者身份，核对匿名正文无单位、邮箱、基金或致谢；
  5. 在 Editorial Manager 选择 Research paper；若投稿阶段未询问开放方式，则在录用后选择订阅发表；
  6. 上传前独立编译投稿包，检查引用、图表、页数和匿名性。
- **官方要求**：<https://www.elsevier.com/journals/computers-and-graphics/0097-8493/guide-for-authors>

---

## 投稿漏斗（串行策略，一稿一投）

学术论文必须**一稿一投**；被拒后**当天转投**下一个以提速。禁止同时投多个期刊/会议。

```
#1 Neurocomputing (T2, Elsevier)  ❌ desk reject 2026-08-01
      │  （价值锚点重构 + 换 Cover Letter）
      ▼
#2 Machine Vision and Applications (T4, Springer, 免费)  ↩️ 2026-09-01 作者主动撤稿
      │  （毕业时限不能接受预期长周期；非拒稿）
      ▼
#3 Computers & Graphics (T4, Elsevier, 订阅免费)  🛠️ 当前目标，待制作双匿名投稿包
      │  被拒 → 转下一个
      ▼
#4 The Visual Computer (T3, Springer, 订阅免费)
      │  被拒 → 转付费快线
      ▼
保底 Algorithms (T4, MDPI, APC CHF 1800)
```

- 模板成本：C&G 可复用现有 Elsevier 源文件，但必须拆分匿名主稿和 title page；TVCJ 可复用 `main_springer` 正文。
- C&G 与 TVCJ 均选择订阅发表路线，无 APC；Algorithms 是接受付费时的快速保底。
- 详见推荐表 `DPRNet_投稿推荐.csv`（含各刊级别、费用、周期、可行性和来源链接）。
