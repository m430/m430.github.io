---
# type: docs 
title: Hugo配置giscus评论模块
summary: 使用Giscus为你的博客可以为你的Github Pages博客配置一个简单美观的评论系统
date: 2023-05-17T13:44:21+08:00
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
  - Hugo
images: [
  "https://m430-blog.oss-cn-beijing.aliyuncs.com/images/202305171618503.png?x-oss-process=image/quality,q_80/format,webp"
]
---

# Hugo配置giscus评论系统

上一篇 [Github Pages搭建个人博客](http://localhost:1313/blog/2023/05/build-your-blog/) 我们已经成功的用[Hugo](https://gohugo.io/)把自己的博客搭建在了Github Pages上。既然是博客，我们肯定是希望能够发表的文章能够跟读者有交互。[Hugo](https://gohugo.io/)可以很方便的集成多种评论系统，比如：

- [Disqus](https://disqus.com/)
- [Utterances](https://utteranc.es/)
- [Giscus](https://giscus.app/)

这里我选择了[Giscus](https://giscus.app/)，因为它集成非常方便，配置最简单。

## 一、什么是Giscus

---

[Giscus](https://giscus.app/)是一个开源的轻量的评论系统，基于`Github Discussions`，特性如下：

![](https://m430-blog.oss-cn-beijing.aliyuncs.com/images/202305171618504.png?x-oss-process=image/quality,q_80/format,webp)

## 二、配置Giscus

---

### 2.1 安装Giscus
首先在[Github Marketplace](https://github.com/marketplace)上搜索giscus，然后按照步骤进行安装：

![](https://m430-blog.oss-cn-beijing.aliyuncs.com/images/202305171618505.png?x-oss-process=image/quality,q_80/format,webp)

### 2.2 生成配置脚本

安装好之后，直接进入[giscus](https://giscus.app/zh-CN)官网进行配置。这里根据官网的配置提示进行操作即可，选择配置的仓库需符合条件：

- 公开仓库
- 安装`Giscus app`
- 启用`Discussions`

仓库填写格式为`Github用户名/仓库名`，比如你的博客仓库为`<username>.github.io`，就填写`<username>/<username>.github.io`把`<username>`替换成你自己的即可。

配置完成后，会得到下面一个脚本：

```jsx
<script src="https://giscus.app/client.js"
        data-repo="[在此输入仓库]"
        data-repo-id="[在此输入仓库 ID]"
        data-category="[在此输入分类名]"
        data-category-id="[在此输入分类 ID]"
        data-mapping="pathname"
        data-strict="0"
        data-reactions-enabled="1"
        data-emit-metadata="0"
        data-input-position="bottom"
        data-theme="preferred_color_scheme"
        data-lang="zh-CN"
        crossorigin="anonymous"
        async>
</script>
```
### 2.3 配置Giscus到主题

把这个脚本嵌入到页面中使用 `.giscus` 和 `.giscus-frame` 选择器来自定义容器布局。上一篇中我使用的主题是[HBS](https://hbs.razonyang.com/)。就不需要这么麻烦去做嵌入了，主题已经帮你做好了，你只需要把上面脚本中的信息复制到`config/_default/params.yaml`中就行了，如下：

```yaml
giscus:
  repo: "<username>/<username>.github.io" # required.
  repoId: "[在此输入仓库 ID]" # required.
  category: "[在此输入分类名]" # required.
  categoryId: "[在此输入分类 ID]" # required.
```

最后，你会在文章后面看到一个漂亮的评论模块：

![](https://m430-blog.oss-cn-beijing.aliyuncs.com/images/202305171618506.png?x-oss-process=image/quality,q_80/format,webp)

支持使用Github账户登录，评论支持Markdown语法，简洁、美观。

## 参考

[giscus官网网站](https://giscus.app/zh-CN)

[Comments Widget - HBS (Hugo Theme Bootstrap) v1 (razonyang.com)](https://hbs.razonyang.com/v1/en/docs/widgets/comments/)
