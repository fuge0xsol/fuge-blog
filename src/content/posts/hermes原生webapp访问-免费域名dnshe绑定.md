---
title: hermes原生webapp访问+免费域名dnshe绑定
published: 2026-11-05T13:40:00
description: hermes原生webapp访问+免费域名dnshe绑定
category: 免费资源
tags:
  - hermes
  - 免费域名
  - cloudflare
draft: false
---

得知hermes可以使用原生webapp，考虑到做为tg的一个补充，而且面板管理起来更方便，于是实操了一下。

- 申请免费域名

[DNSHE](https://my.dnshe.com/go.php?code=kaYbMVJ0bu) 为全球开发者、学生和开源爱好者提供**免费域名服务** ：
✓ 无需信用卡绑定
✓ 无隐藏费用
✓ 支持全类型 DNS 记录解析
✓ 即时上线各类数字项目
初始额度：可注册 3 个域名
!!!注意选择 [**de5.net**](http://de5.net/)后缀，其他的域名添加域时会提示：Please ensure you are providing the root domain and not any subdomains (e.g., [example.com](http://example.com/), not [subdomain.example.com](http://subdomain.example.com/))
![](/media/20261105-133759.png)

- 更换DNS服务器为cloudflare

cah.ns.cloudflare.com
paige.ns.cloudflare.com
等待添加成功
![](/media/20261105-134532.png)

- 添加hermes给你的A地址，不要开代理

![](/media/20261105-134731.png)


**构建webapp正确方式如下**

```plain
hermes config set webapp.enabled true
```

```plain
hermes gateway restart
```

```plain
hermes webapp
```

[![](/media/20261105-155333.png)](https://hermes-agent.nousresearch.com/docs/user-guide/desktop)
