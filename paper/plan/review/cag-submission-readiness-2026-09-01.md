# Computers & Graphics 初投稿包核验

核验日期：2026-09-01

> 历史核验记录。作者邮箱、未来城校区地址、日期和推荐审稿人已于
> 2026-09-23 定稿；当前结论以
> `cag-submission-readiness-2026-09-23.md` 为准。

## 结论

C&G 初投稿包已生成在 `paper/submit_cag/`。匿名主稿、title page、cover
letter、highlights、利益声明和生成式 AI 声明均已生成并完成格式检查。当前状态为
“文件就绪，尚未在 Editorial Manager 提交”。

## 官方要求映射

| 要求 | 落地文件 | 状态 |
|---|---|---|
| 双栏主稿 | `main_cag_anonymous.pdf` | 通过 |
| 行号 | `main_cag_anonymous.pdf` | 通过 |
| 双匿名 | 匿名主稿与匿名 cover letter | 通过 |
| 作者信息单列 | `title_page_cag.pdf` / `.docx` | 通过 |
| 初投仅上传主稿 PDF，不上传 LaTeX 源 | `submit_cag/` 不含 `.tex/.bib/.zip` | 通过 |
| 最多 6 个关键词 | 匿名主稿含 6 个关键词 | 通过 |
| 3--5 条 highlights，每条不超过 85 字符 | `highlights_cag.docx`，5 条，长度 66--73 | 通过 |
| Competing-interest statement | title page + 独立 DOCX | 通过 |
| AI 使用声明置于参考文献之前 | 匿名主稿 + 独立 DOCX | 通过 |
| Cover letter 说明贡献、最近工作及差异 | `cover_letter_cag.pdf` | 通过 |

## 文件清单

- `main_cag_anonymous.pdf`：16 页；References 从第 13 页开始。
- `title_page_cag.pdf`：1 页；另提供 DOCX 兼容版本，二选一上传。
- `cover_letter_cag.pdf`：1 页；匿名。
- `highlights_cag.docx`：5 条。
- `declaration_of_interest_cag.docx`：无利益冲突声明。
- `generative_ai_declaration_cag.docx`：与主稿中的声明一致。
- `README.txt`：Editorial Manager 文件类型映射和提交注意事项。

## 验证结果

- 三个 PDF 均从清理后的 LaTeX 构建产物重新编译成功。
- 匿名主稿日志无 LaTeX error、未定义引用、未定义文献、Overfull hbox 或
  Overfull vbox。
- 匿名主稿 PDF 正文和 metadata 均不包含作者姓名、邮箱、单位或邮寄地址。
- 匿名 cover letter 正文和 metadata 均不包含作者身份。
- title page 含两位作者、通讯邮箱和完整邮寄地址。
- 44 个正文引用 key 均可在 `references.bib` 中解析。
- 四个 DOCX 文件均通过 ZIP/XML 完整性检查。
- 逐页渲染检查确认 16 页均非空白，跨栏架构图、主结果表、视觉比较和聚类图未越界。

## 页数说明

C&G 不设硬性页数上限，但通常希望正文不超过双栏 12 页（参考文献除外）。
当前参考文献从第 13 页开始，正文只略超建议范围。Cover letter 已加入长度说明，
解释三尺度主比较、三种子消融、视觉结果和路由诊断均是验证核心贡献所需。

## 投稿前人工确认

1. 确认作者共同认可 title page 中的 CRediT、无外部资助、无利益冲突、数据可用性
   和 AI 使用声明。
2. 当前 title page 使用学校官方南望山校区通信地址：
   `388 Lumo Road, Hongshan District, Wuhan, Hubei 430074, China`。若作者实际
   署名单位应使用未来城校区或具体学院地址，须在提交前替换。
3. 若 Editorial Manager 在 Attach Files 页面提供官方 Declaration of Interest
   DOCX 模板，应直接使用该原始模板并勾选“无利益冲突”，不要转换模板格式。
4. 审稿人建议尚未生成；应由作者核对近期合作者、同单位人员和利益冲突后填写。
5. 上传后必须检查系统合成 PDF，并以收到投稿确认邮件为提交完成标志。

## 来源

- C&G Guide for Authors：
  https://www.elsevier.com/journals/computers-graphics/0097-8493/guide-for-authors
- Elsevier generative-AI policy：
  https://www.elsevier.com/about/policies-and-standards/generative-ai-policies-for-journals
- CUG 官方通信地址：
  https://www.cug.edu.cn/xxgk/lxwm.htm
