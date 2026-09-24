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
明确列出 `Image Processing`，并将 visual computing 定义为 graphics、computer
vision 与 AI 的交叉；2026 年还刊发了高效图像超分论文。因此，TVCJ 的范围证据
不是仅靠宽泛的“picture manipulation”措辞，而是有明确主题条目和近期论文先例。

## 候选比较

| 顺序 | 期刊 | 名单级别 | 常规费用 | 范围证据 | 主要风险 |
|---|---|---|---|---|---|
| 1 | The Visual Computer | T3 | Subscription 无 APC | 官网明列 Image Processing；2026 年有 efficient image SR 论文 | 首页首决定中位数包含 desk；需作者简介和照片 |
| 2 | IJPRAI | T4 | US$100 投稿费，不可退；录用后订阅路线无页费 | 官网明列 Image Processing、Computer Vision、Deep Learning | 投稿费在 desk reject 时也不退；缺少可靠的短录用周期保证 |
| 3 | Algorithms | T4 | CHF 1800 APC | 算法与应用范围可容纳 DPR；2026 年有直接 SISR 论文 | 纯 OA，费用较高；学校若还有 SCIE 硬要求需再次确认 |

## 不选 Journal of Real-Time Image Processing

JRTIP 官网明确要求稿件完整处理 real-time 的算法、硬件、软件或实现问题，并明确
说明仅报告 processing time 或 speed 不构成充分的实时性论证。该刊还要求双栏
12 页以内（含参考文献与作者简介）。当前 DPRNet 只提供自身 GPU 运行时间，没有
同硬件基线、FPS、应用时限和软硬件优化分析，因此直接投稿存在明确的 scope 和
格式退回风险。

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

## 官方来源

- The Visual Computer 首页与 scope：
  https://www.springer.com/journal/371
- The Visual Computer 投稿指南：
  https://www.springer.com/journal/371/submission-guidelines
- The Visual Computer 费用与订阅路线：
  https://www.springer.com/journal/371/how-to-publish-with-us
- 2026 年 TVCJ efficient SR 论文：
  https://doi.org/10.1007/s00371-026-04357-6
- IJPRAI scope：
  https://www.worldscientific.com/page/ijprai/aims-scope
- IJPRAI 投稿费：
  https://www.worldscientific.com/page/ijprai/submission-fee
- IJPRAI 投稿指南：
  https://www.worldscientific.com/page/ijprai/submission-guidelines
- JRTIP scope：
  https://www.springer.com/journal/11554/aims-and-scope
- JRTIP 投稿指南：
  https://www.springer.com/journal/11554/submission-guidelines
- Algorithms 费用：
  https://www.mdpi.com/journal/algorithms/apc
- 2026 年 Algorithms SISR 论文：
  https://doi.org/10.3390/a19070582
