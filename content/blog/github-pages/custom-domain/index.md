---
# type: docs 
title: Github Pages自定义域名
summary: 默认Github Pages的域名为username.github.io，我们肯定是希望拥有一个自己独立的域名，你可以去任何一个域名交易网站买一个自己喜欢的域名，配置到自己的博客上。
date: 2023-05-17T16:45:01+08:00
featured: false
draft: false
comment: true
toc: true
reward: true
pinned: false
carousel: false
series:
categories: 
  - 技术
tags: 
  - Github Pages
images: [
  "https://cdn.jsdelivr.net/gh/m430/images@master/202305230956536.webp"
]
---

## 一、自定义域名介绍
---

默认`Github Pages`的域名为`<username>.github.io`，我们肯定是希望拥有一个自己独立的域名，你可以去任何一个域名交易网站买一个自己喜欢的域名，配置到自己的博客上。通常的域名交易网站有：

- [Godaddy](https://www.godaddy.com/)
- [阿里云-万网](https://wanwang.aliyun.com/domain?source=5176.11533457&userCode=l3bvairs)
- [腾讯云-DNSPod](https://dnspod.cloud.tencent.com/)

这里我直接选择阿里云了，因为我的图床也在阿里云OSS上面，这样操作起来方便点。

`Github Pages`支持的自定义域名如下：

- `www`子域
- 自定义子域
- apex域名（也叫顶级域，不包含www，比如`example.com`）

## 二、配置apex顶级域
---

配置顶级域，官方建议还设置一个`www`子域，这样Github Pages会自动把`www`子域重定向到顶级域上。
### 2.1 配置www子域CNAME

打开阿里云，配置一个`CNAME`记录，配置如图：

![](https://cdn.jsdelivr.net/gh/m430/images@master/202305230956535.webp)

### 2.2 配置顶级域A记录
然后配置顶级域，需要配置`A`记录，指向`Github Pages`的IPv4地址如下：

```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

阿里云上配置完成截图如下：

![](https://cdn.jsdelivr.net/gh/m430/images@master/202305230956534.webp)

1个`CNAME`记录，4个`A`记录。

### 2.3 检查DNS解析

配置完成后，使用`dig`命令查看顶级域的`A`记录是否配置成功：

```bash
$ dig andyzheng.cc +noall +answer -t A

; <<>> DiG 9.10.6 <<>> andyzheng.cc +noall +answer -t A
;; global options: +cmd
andyzheng.cc.		600	IN	A	185.199.108.153
andyzheng.cc.		600	IN	A	185.199.110.153
andyzheng.cc.		600	IN	A	185.199.109.153
andyzheng.cc.		600	IN	A	185.199.111.153
```

然后同样用`dig`查看子域`www`是否生效：

```bash
$ dig www.andyzheng.cc +nostats +nocomments +nocmd

; <<>> DiG 9.10.6 <<>> www.andyzheng.cc +nostats +nocomments +nocmd
;; global options: +cmd
;www.andyzheng.cc.		IN	A
www.andyzheng.cc.	600	IN	CNAME	m430.github.io.
m430.github.io.		3600	IN	A	185.199.111.153
m430.github.io.		3600	IN	A	185.199.110.153
m430.github.io.		3600	IN	A	185.199.109.153
m430.github.io.		3600	IN	A	185.199.108.153
```

### 2.4 设置自定义域名

发现都已经生效。在站点仓库`Settings>Pages`下设置好顶级域，如图：

![](https://cdn.jsdelivr.net/gh/m430/images@master/202305230956533.webp)

点击保存的时候，Github Pages会对设置的域名进行DNS检查，检查成功就表示自定义域名生效了。欢迎大家去我的[博客](https://andyzheng.cc)参观。

## 三、参考资料

[关于自定义域名和 GitHub 页面 - GitHub 文档](https://docs.github.com/zh/pages/configuring-a-custom-domain-for-your-github-pages-site/about-custom-domains-and-github-pages)
