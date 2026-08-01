# 📊 A/B Test 实验效果分析与用户转化优化 Dashboard


## 项目简介

本项目针对电商平台一次产品版本迭代实验进行 A/B Test 分析。

通过对 **Control Group（旧版本）** 和 **Treatment Group（新版本）**
的用户行为数据进行对比，评估新版本是否能够提升用户转化效果。

主要分析目标：

- 📈 新版本是否提升用户 Conversion Rate
- 🛒 是否带来更多购买用户
- 🔍 用户在哪些环节产生流失
- 💡 是否建议推广 Treatment 版本


项目最终使用 **Python + Tableau** 完成数据分析与可视化 Dashboard。



---

# 一、项目背景与实验设计 🧪


## 1.1 实验背景

某电商平台上线新的用户体验方案，希望通过页面设计优化提高用户购买转化。

因此设计 A/B Test：

| 实验组 | 描述 |
|-|-|
| Control Group | 原始版本 |
| Treatment Group | 新版本 |


实验目标：

> 判断新版本是否能够显著提高用户购买转化率。


---

## 1.2 实验数据


实验用户规模：Total Experiment Users = 100,000



核心字段：

| 字段 | 含义 |
|-|-|
| Group | 实验组别 |
| Users | 用户数量 |
| Purchases | 购买用户数量 |
| Conversion Rate | 转化率 |



---

# 二、数据分析与 Dashboard 展示 📊


## Dashboard Overview


![A/B Test Experiment Performance Dashboard](dashboard/AB_Test_Experiment_Performance_Dashboard.png)



Dashboard 包含三个分析模块：


---

# 2.1 实验核心指标 KPI


## 用户规模

实验总用户：100,000


## Control Group 转化率
4.34%


## Treatment Group 转化率
4.80%


通过 KPI Card 快速监控实验核心结果。


---

# 2.2 Conversion Rate 对比分析


## 转化率比较


| Group | Conversion Rate |
|-|-:|
| Control | 4.34% |
| Treatment | 4.80% |


结果：

Treatment 版本相比 Control：
提升：
4.80% - 4.34% = 0.46

相对提升：
(4.80%-4.34%) / 4.34% ≈ 10.6%



分析：

新版本提高了用户完成购买行为的概率。


---

# 2.3 Purchase Users 对比分析 🛒


购买用户数量：


| Group | Purchasers |
|-|-:|
| Control | 2,169 |
| Treatment | 2,401 |



结果：

Treatment 增加购买用户：
2401 - 2169 = +232



说明：

新版本不仅提高转化率，同时带来了更多实际购买用户。


---

# 2.4 用户转化漏斗分析 🔍


用户路径：
Visitors → Product View → Cart → Checkout → Purchase



分析结果：


|阶段|用户数量|
|-|-:|
|Visitors|269,792|
|Product View Users|61,252|
|Cart Users|12,545|
|Checkout Users|9,715|
|Purchasers|4,419|



---

## 最大流失环节


最大用户流失发生在：
Visitors → Product View Users


用户：
269,792 → 61,252


流失原因可能：

- 首页吸引力不足
- 推荐内容匹配度不足
- 用户进入页面后的兴趣不足


优化方向：

✅ 优化 Landing Page

✅ 增强商品推荐

✅ 提升首屏内容吸引力



---

# 三、实验分析结论与业务建议 💡


# 3.1 A/B Test 实验结论


根据实验结果：

|指标|Control|Treatment|变化|
|-|-:|-:|-:|
|Conversion Rate|4.34%|4.80%|⬆ +10.6%|
|Purchasers|2169|2401|⬆ +232|


实验结果显示：

> Treatment Group 在核心业务指标上均优于 Control Group。


因此：

### 推荐推广 Treatment 版本。


---

# 3.2 业务洞察


## Insight 1：

### 新版本有效提升用户转化


Conversion Rate:
4.34% → 4.80%


说明新的产品体验能够促进用户完成购买。


---


## Insight 2：

### 转化提升带来真实商业价值


购买用户增加：
+232 users


如果扩大实验规模：

预计可以带来更多订单增长。


---

## Insight 3：

### 最大优化空间仍在用户前端阶段


漏斗数据显示：

大量用户在浏览商品之前流失。


因此未来优化方向：

1. 提升广告流量质量

2. 优化首页和商品展示

3. 增强个性化推荐

4. 持续进行页面 A/B Test


---

# 3.3 后续实验建议 🚀


未来可以继续测试：


## 产品页面优化

测试：

- 商品图片
- 商品描述
- 推荐模块


## 购买流程优化

测试：

- Checkout 页面
- 支付流程
- 优惠策略


## 用户分群实验

进一步分析：

- 新用户 vs 老用户
- 不同地区用户
- 不同渠道用户



---

# 项目技术栈 🛠


## 数据分析

- Python
- Pandas
- NumPy


## 可视化

- Tableau


## 分析方法

- A/B Testing
- Conversion Rate Analysis
- Funnel Analysis
- KPI Dashboard


---

# 项目结构 📂

