---
title: 第一次秒成功开龟壳（甲骨文云），以及2g12g升级4g24g的操作思考
published: 2026-09-26T00:00:00+08:00
description: 第一次秒成功开龟壳（甲骨文云），以及2g12g升级4g24g的操作思考
category: 免费资源
tags:
  - vps
  - free
draft: false
---

开龟壳（甲骨文云）方法，直接安卓手机+wifi+电信号操作+gmail注册账号  
（邮箱验证的时候需要科学上网，进入gmail app后关掉科学上网，再点验证）  
信用卡用的是广发臻尚白金卡，Mastercard  
秒开成功，免费账户开2g+12g都开不出来，于是选择升级账户成Pay As You Go  
秒开2g+12g，可是不甘心只能2g+12g，找到官网  
[Oracle Cloud 官网价格页](https://www.oracle.com/cloud/price-list/#pricing-container)  
有这样一段话

_Each paid tenancy gets the first 3,000 OCPU hours and 18,000 GB hours per month for free to create Ampere A1 Compute instances. This free-tier usage is shared across Bare Metal, Virtual Machine, and Container Instances._  

![image.png](/media/image.png)

问了下 Grok

![image.png](/media/image-1.png)

![image.png](/media/image-2.png)

然后果断先停止实例，然后升级成4g+24g

![image.png](/media/image-3.png)

记得在预算这里加个提醒，超过1刀就发邮件

![image.png](/media/image-4.png)
需要补充的内容：
1. 2026 年 6 月中 Oracle 悄悄把 Always Free 租户的 A1 额度从 3,000/18,000 砍到 1,500/9,000（即 2 OCPU/12GB），8 月起超限实例会被自动回收。也就是说现在纯免费租户想稳定跑 4核/24G，升 PAYG 几乎是唯一路径——这正是你文章的价值点，建议写进去，不然读者会以为免费租户也能直接开 4/24。

2. PAYG 不可降级回免费（官方 FAQ 明说 no option to downgrade），只能删号重来。这是升级行为不可逆的风险，一句话就能交代。

3. 社区有 PAYG 用户反馈开 4/24 后收到 \~$2/天账单的案例——多数是计费展示滞后、月底冲抵为 $0，但也真有被扣的。建议加一句“第一个整月后去 Cost Analysis 确认是 $0”。

4. 升 PAYG 后免费范围仍只有：A1 4/24 + 200GB 块存储 + 10TB 流出。超出部分直接扣真卡（没有试用金垫底），快照、额外盘、负载均衡都算钱——你那张广发卡是要走外币的。

5. 4 OCPU × 744 小时(31天) = 2,976 ≤ 3,000，内存 17,856 ≤ 18,000——所以 31 天的大月也恰好免费，这是这套数字设计好的。
