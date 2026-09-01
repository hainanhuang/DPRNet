# DPRNet 投稿目标全量复核

核验日期：2026-08-30

## 结论

本轮重新扫描学校名单中全部 570 个 T1--T4 条目，并结合 DPRNet 的轻量单图像
超分辨率主题、现有实验、费用和时间限制筛选。相较上一版，新增三个有实际价值的
候选：

1. `Computers & Graphics`：新的免费首选。学校名单使用 JCR 名
   `COMPUTERS & GRAPHICS-UK`，级别为 T4。出版社披露的数据为首决定 2 天、
   实质 review time 78 天、投稿到录用 105 天；2026 年仍有单图像超分论文。
2. `Algorithms`：新的付费快线首选。学校名单 T4，APC 为 CHF 1800，2026 年
   上半年首决定约 17.6 天；官网统计图显示当年拒稿率约 46%。一篇 2025 年轻量
   SISR 论文从投稿到录用为 38 天。
3. 《中国图象图形学报》：中文路线。学校名单写作《中国图像图形学报》，级别
   T4；官网称审稿一般在 2 个月以内、投稿到发表约 6 个月，APC 每页 360 元，
   彩页另加 400 元/页，最高 15000 元。

在不支付高额 APC 的前提下，推荐顺序调整为：

`Computers & Graphics -> The Visual Computer -> IJPRAI`

若允许中文重写，可在该主线中加入《中国图象图形学报》。若接受约 1.6--2.2 万元
费用，快线顺序为：

`Algorithms -> IET Image Processing -> Applied Sciences`

`Journal of Real-Time Image Processing` 的周期合格，但当前稿件仅报告自身延迟，
没有同硬件基线和应用时限论证；其官网明确说明“仅报告 processing time”不足以
满足实时性范围，因此只列为补实验后的条件选项。

## 筛选方法

- 硬门槛：题名必须能在 `计算机科学与技术.xlsx` 中匹配到 T1、T2、T3 或 T4。
- 周期口径优先级：
  1. 出版社给出的 submission-to-acceptance 或明确的外审时间；
  2. 近期已发表论文的 Received/Accepted 日期；
  3. 大样本第三方作者经验；
  4. 仅有 first decision 时明确注明其中包含 desk reject。
- “好中”不使用主观百分比。只有出版社公开接受率时才记录数值，其他情况使用
  范围匹配、篇幅要求、近期发文和第三方经验综合判断。
- 费用按常规发表路线计算；混合期刊优先选择无 APC 的订阅路线。

## 近期论文时间抽查

以下天数由 Springer 文章页公开的 Received 与 Accepted 日期相减，仅用于识别
“首页首决定很快、完整录用很慢”的情况，不把小样本当成期刊总体统计。

| 期刊 | 抽查数 | 投稿到录用天数 | 样本中位数 | 判断 |
|---|---:|---|---:|---|
| The Visual Computer | 5 | 93, 39, 233, 55, 77 | 77 | 通常较快，但存在约 8 个月离群值 |
| Journal of Real-Time Image Processing | 4 | 66, 119, 76, 74 | 75 | 周期较快，主要风险是实时性范围 |
| Multimedia Tools and Applications | 4 | 332, 404, 661, 68 | 368 | 完整录用波动大，不适合毕业时限 |
| Applied Intelligence | 5 | 173, 208, 291, 304, 728 | 291 | 首页 45 天首决定不能代表录用速度 |
| Neural Computing & Applications | 4 | 131, 257, 467, 386 | 321.5 | 首页 14 天首决定不能代表录用速度 |
| International Journal of Machine Learning and Cybernetics | 5 | 272, 273, 365, 166, 198 | 272 | 完整录用约 9 个月 |
| Pattern Analysis and Applications | 2 | 210, 217 | 213.5 | 两个近期样本均超过 6 个月 |
| Complex & Intelligent Systems | 2 | 181, 74 | 127.5 | 样本分散，且强制 OA 费用高 |

抽查所用 DOI：

- The Visual Computer：`10.1007/s00371-026-04696-4`,
  `10.1007/s00371-026-04712-7`, `10.1007/s00371-026-04715-4`,
  `10.1007/s00371-026-04717-2`, `10.1007/s00371-026-04723-4`。
- JRTIP：`10.1007/s11554-026-01953-6`, `10.1007/s11554-026-01957-2`,
  `10.1007/s11554-026-01958-1`, `10.1007/s11554-026-01971-4`。
- MTAP：`10.1007/s11042-026-21887-2`, `10.1007/s11042-026-21889-0`,
  `10.1007/s11042-026-21890-7`, `10.1007/s11042-026-21894-3`。
- Applied Intelligence：`10.1007/s10489-026-07396-7`,
  `10.1007/s10489-026-07413-9`, `10.1007/s10489-026-07424-6`,
  `10.1007/s10489-026-07426-4`, `10.1007/s10489-026-07435-3`。
- Neural Computing & Applications：`10.1007/s00521-026-12332-4`,
  `10.1007/s00521-026-12393-5`, `10.1007/s00521-026-12408-1`,
  `10.1007/s00521-026-12439-8`。
- International Journal of Machine Learning and Cybernetics：
  `10.1007/s13042-026-03215-0`, `10.1007/s13042-026-03264-5`,
  `10.1007/s13042-026-03271-6`, `10.1007/s13042-026-03277-0`,
  `10.1007/s13042-026-03282-3`。
- Pattern Analysis and Applications：`10.1007/s10044-026-01757-1`,
  `10.1007/s10044-026-01763-3`。
- Complex & Intelligent Systems：`10.1007/s40747-026-02467-1`,
  `10.1007/s40747-026-02491-1`。

## 关键来源

- Computers & Graphics 作者指南：
  https://www.elsevier.com/journals/computers-and-graphics/0097-8493/guide-for-authors
- Computers & Graphics 出版社授权周期数据：
  http://www.letpub.com.cn/index.php?page=journalapp&view=detail&journalid=2007
- 2026 年 Computers & Graphics 超分论文：
  https://doi.org/10.1016/j.cag.2026.104677
- The Visual Computer：
  https://link.springer.com/journal/371
- IJPRAI：
  https://www.worldscientific.com/worldscinet/ijprai
- Algorithms：
  https://www.mdpi.com/journal/algorithms
- Algorithms 统计与费用：
  https://www.mdpi.com/journal/algorithms/stats
  https://www.mdpi.com/journal/algorithms/apc
- 2025 年 Algorithms 轻量 SISR 论文：
  https://doi.org/10.3390/a18080454
- 中国图象图形学报同行评议与费用：
  http://www.cjig.cn/zh/info/13449/
  http://cjig.ijournals.cn/jig/ch/common_item.aspx?parent_id=20080618121700001&menu_id=20230224092338001
- IET Image Processing 指标与费用：
  https://ietresearch.onlinelibrary.wiley.com/journal/17519667/journal-metrics
  https://ietresearch.onlinelibrary.wiley.com/hub/journal/17519667/homepage/open-access
- Applied Sciences 指标与费用：
  https://www.mdpi.com/journal/applsci/stats
  https://www.mdpi.com/journal/applsci/apc
- JRTIP 范围、周期和费用：
  https://link.springer.com/journal/11554
  https://link.springer.com/journal/11554/submission-guidelines
  https://link.springer.com/journal/11554/how-to-publish-with-us

## 排除结论

- 看似首页决定很快、但近期录用历史慢：Applied Intelligence、Neural Computing
  & Applications、International Journal of Machine Learning and Cybernetics、
  Multimedia Tools and Applications。
- 官网或大样本数据已超过约 6 个月：CVIU、PRL、PAAA、Soft Computing、
  Computers & Electrical Engineering、IET Computer Vision、IET Signal Processing、
  International Journal of Computational Intelligence Systems。
- 录用率过低或范围明显不合：The Imaging Science Journal、International Journal
  of Image and Data Fusion、Expert Systems。
- 免费但完整周期不稳：International Journal of Interactive Multimedia and
  Artificial Intelligence；官网称首轮应在 8 周内，但投稿到发表通常 6--12 个月。
- 名称相近但不在学校名单：Signal Image and Video Processing、Journal of Visual
  Communication and Image Representation、IEEE Access、Electronics、PeerJ Computer
  Science、Journal of Electronic Imaging、Multimedia Systems。
- 当前可匹配的 T3 视觉会议均错过全文截稿：WACV 2027 与 3DV 2027 截止
  2026-08-28；ACCV 2026 截止 2026-07-05；BMVC 2026 截止 2026-05-29。

## 风险边界

- 出版社指标是历史统计，不保证单篇稿件的实际时长。
- “首决定”通常混有 desk reject，不能当作外审时长；优先参考 review time、
  submission-to-acceptance 和近期论文历史。
- `Computers & Graphics` 的 OA 镜像刊 `Computers & Graphics: X` 是不同题名，
  不在学校名单；必须选择名单内的订阅母刊。
- Algorithms 官网标示为 ESCI，但学校名单明确列为 T4；是否还附带其他数据库要求，
  应在投稿前向学院确认。
- 状态更新（2026-09-01）：用户确认 MVAP 已完成撤稿；下一刊可按一稿一投原则开始提交。
