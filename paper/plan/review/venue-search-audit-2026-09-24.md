# C&G 拒稿后的下一投稿目标复核

核验日期：2026-09-24

## 结论

下一投选择 **The Visual Computer（TVCJ，Springer，学校 T3）**，采用
subscription publishing 路线，无 APC。推荐顺序更新为：

```text
The Visual Computer
→ IJPRAI
→ Algorithms（接受 CHF 1800 APC 时）
```

C&G 的拒稿不评价技术质量，仅说明其编辑将期刊范围收紧到交互式计算机图形学、
可视化、虚拟环境和 CG 应用。TVCJ 虽然同属 visual computing 方向，但其当前官网
明确列出 `Image and Video Processing, Restoration, and Enhancement`，并将
visual computing 定义为 graphics、computer vision 与 AI 的交叉。2024--2026 年
该刊连续刊发多篇轻量/高效 SISR 论文。因此，TVCJ 的范围证据不是宽泛关键词或
单篇偶发先例，而是“官方明确条目 + 持续同类发表记录”。

## C&G 误判复盘与新筛选门槛

此前把 C&G 列为免费首选，主要依据其宽泛的 visual-content 表述和一篇 2026 年
SR 论文。实际 desk decision 表明，**一篇同类论文不能证明该方向属于编辑当前
稳定接收的核心范围**；它可能来自特刊、旧审稿周期或个别例外。后续候选必须同时
通过以下门槛：

1. 题名能在学校《计算机科学与技术》T4+ 名单中精确匹配，或能确认官方/JCR
   题名变体；例如 The Visual Computer 在名单中登记为 `VISUAL COMPUTER`；
2. 官方 aims and scope 明确包含 Image Processing、Image Restoration、
   Image Enhancement 或直接等价条目；
3. 2024--2026 年至少有 3 篇直接 SISR/轻量 SISR 论文，不能只依赖单篇先例；
4. 不存在当前稿件未满足的隐藏门槛，如实时系统、特定应用或极短篇幅要求；
5. 分开记录 **scope 风险** 与 **创新性/质量风险**，低 scope 风险不等于容易录用。

## 候选比较

| 顺序 | 期刊 | 名单级别 | 常规费用 | Scope 风险 | 创新性/质量风险 | 直接范围证据 |
|---|---|---|---|---|---|---|
| 1 | The Visual Computer | T3 | Subscription 无 APC | 低 | 中 | 官网明确包含 image/video processing、restoration、enhancement；2024--2026 连续刊发多篇 lightweight/efficient SISR |
| 2 | IJPRAI | T4 | US$100 投稿费，不可退；订阅路线无页费 | 低 | 低至中 | 官网明确包含 Image Processing、Computer Vision、Deep Learning；2024--2025 至少 4 篇直接 SISR |
| 3 | Algorithms | T4 | CHF 1800 APC | 低 | 中高 | 官网明确包含 Computer Vision 和 Image processing with applications；2024--2026 至少 3 篇直接 SISR |

TVCJ 的近期直接先例包括：

- `10.1007/s00371-024-03753-0`：MSPAN，lightweight image SR；
- `10.1007/s00371-025-03894-w`：hybrid feature enhancement network for
  lightweight image SR；
- `10.1007/s00371-026-04376-3`：efficient lightweight SR via transformer；
- `10.1007/s00371-026-04357-6`：efficient SISR。

IJPRAI 的近期直接先例包括：

- `10.1142/S0218001424540156`；
- `10.1142/S0218001425540035`；
- `10.1142/S0218001425540126`；
- `10.1142/S0218001425540199`。

Algorithms 的近期直接先例包括：

- `10.3390/a17030092`；
- `10.3390/a18080454`；
- `10.3390/a19070582`。

## 不选 Journal of Real-Time Image Processing

JRTIP 官网明确要求稿件完整处理 real-time 的算法、硬件、软件或实现问题，并明确
说明仅报告 processing time 或 speed 不构成充分的实时性论证。该刊还要求双栏
12 页以内（含参考文献与作者简介）。当前 DPRNet 只提供自身 GPU 运行时间，没有
同硬件基线、FPS、应用时限和软硬件优化分析，因此直接投稿存在明确的 scope 和
格式退回风险。

## 会议路线更新

- CVPR 2027 在学校名单中为 T2，官方全文截止日期为 2026-11-16，最终决定日期为
  2027-02-25。其范围覆盖 low-level vision 和 efficient/scalable vision，因此
  scope 风险低，但当前稿件的增量创新定位使录用风险明显高于期刊主线。
- CVPR 评审期禁止一稿多投，会阻塞当前 TVCJ 串行投稿，不符合“尽快中稿毕业”
  的目标，因此不为赶会议窗口撤回或延迟 TVCJ。
- WACV 2027、3DV 2027、ACCV 2026 和 BMVC 2026 的全文窗口已经关闭。
- ICIP 和 ICASSP 未出现在本地学校 T4+ 名单中，不进入毕业主线。

## TVCJ 投稿前修改

1. 更新 `main_springer.tex` 的学院、未来城地址和 Xiang Li 邮箱。
2. 将 `cover_letter_tvcj.txt` 日期改为实际投稿日期，并用官网的
   `Image Processing` scope 和近期 efficient SR 论文作为范围依据。
3. 按指南准备每位作者 50--100 词 biography 和黑白证件照。
4. 提交完整可编辑源文件；官网同时写明可接受 Word 或 LaTeX 源，但正文格式说明
   偏向 Word，正式上传时以投稿系统接受的文件类型为准。
5. 重新核验标题、摘要、关键词、声明、作者邮箱、地址和编译结果。

## 证据边界

- TVCJ 官网的 `Submission to first decision` 中位数约 3 天，会混入 desk reject，
  不能解释为外审或录用周期。
- 2026-08-30 的小样本抽查显示 TVCJ 投稿到录用中位数约 77 天，但样本量只有
  5 篇且存在 233 天离群值，只用于相对比较。
- IJPRAI 的 US$100 投稿费是一次性、不可退费用，支付不保证送外审或录用。
- Algorithms 的 17.6 天首决定和 3.9 天录用后上线均为出版社历史中位数，不保证
  本稿件时长。
- “Scope 风险低”只表示不太可能因研究主题越界被拒，不能排除编辑以贡献有限、
  broad interest 不足、实验或表达质量为由 desk reject。
- Algorithms 当前被官方列为 ESCI，而不是 SCIE。虽然学校名单列为 T4，若毕业
  条件另有 SCIE 硬约束，必须在付费投稿前取得学院确认。

## 官方来源

- The Visual Computer aims and scope：
  https://www.springer.com/journal/371/aims-and-scope
- The Visual Computer 投稿指南：
  https://www.springer.com/journal/371/submission-guidelines
- The Visual Computer 费用与订阅路线：
  https://www.springer.com/journal/371/how-to-publish-with-us
- TVCJ 近期直接 SR 论文：
  https://doi.org/10.1007/s00371-024-03753-0
  https://doi.org/10.1007/s00371-025-03894-w
  https://doi.org/10.1007/s00371-026-04376-3
  https://doi.org/10.1007/s00371-026-04357-6
- IJPRAI scope：
  https://www.worldscientific.com/page/ijprai/aims-scope
- IJPRAI 投稿费：
  https://www.worldscientific.com/page/ijprai/submission-fee
- IJPRAI 投稿指南：
  https://www.worldscientific.com/page/ijprai/submission-guidelines
- IJPRAI 近期直接 SR 论文：
  https://doi.org/10.1142/S0218001424540156
  https://doi.org/10.1142/S0218001425540035
  https://doi.org/10.1142/S0218001425540126
  https://doi.org/10.1142/S0218001425540199
- JRTIP scope：
  https://www.springer.com/journal/11554/aims-and-scope
- JRTIP 投稿指南：
  https://www.springer.com/journal/11554/submission-guidelines
- Algorithms scope：
  https://www.mdpi.com/journal/algorithms/about
- Algorithms 费用：
  https://www.mdpi.com/journal/algorithms/apc
- Algorithms 近期直接 SR 论文：
  https://doi.org/10.3390/a17030092
  https://doi.org/10.3390/a18080454
  https://doi.org/10.3390/a19070582
- CVPR 2027 Call for Papers：
  https://cvpr.thecvf.com/Conferences/2027/CallForPapers
