---
# type: docs 
title: 使用Github Page搭建个人博客
summary: Github Pages是Github提供的免费静态网站托管服务，可以很方便的用于个人博客搭建、项目展示页搭建，甚至是初创团队的产品展示页等都是可以的。
date: 2023-05-15T16:15:25+08:00
featured: true
draft: false
comment: true
toc: true
math: true
reward: true
pinned: false
carousel: false
series:
  - Github Pages
categories: 
  - 技术
tags: 
  - Github Pages
  - Hugo
images: [
  "https://jsdelivr.andyzheng.cc/gh/m430/images@master/202305230956525.webp"
]
---
## 一、Github Pages介绍
---
Github Pages是Github提供的免费静态网站托管服务，可以很方便的用于个人博客搭建、项目展示页搭建，甚至是初创团队的产品展示页等都是可以的。

## 二、创建Github Pages仓库
---

首先，你需要在[Github](https://github.com)上创建一个仓库，个人博客仓库必须命名为`<username>.github.io`，这个非常重要。

![](https://jsdelivr.andyzheng.cc/gh/m430/images@master/202305230956524.webp)

## 三、静态生成站点

---

创建好后，默认Github是通过[Jeklly](https://jekyllrb.com/)来生成静态网页的，社区有多种静态生成站点的选择比如：

- Jeklly
- Hugo
- Hexo
- Gastby

我个人比较喜欢用[Hugo](https://gohugo.io/)，它是用Go语言开发的静态生成框架，编译速度很快，框架生态、主题都很丰富。这里你可以根据个人爱好进行选择。

### 3.1 创建站点

参考Hugo官网直接创建一个站点：

```bash
hugo new site <username>.github.io
```

创建好后的的目录如下：

```bash
<username>.github.io
├── archetypes
│   └── default.md
├── assets
├── config.toml
├── content
├── data
├── layouts
├── public
├── static
└── themes
```

目录我就不一一介绍了，直接参考Hugo的官方文档具体进行了解。暂时不用了解那么多。创建好后完成Git初始化并设置好`remote`：

```bash
git init
git remote add origin <your_blog_repo_github_url>
```

### 3.2 选择一个主题使用

你可以到[Hugo 主题](https://themes.gohugo.io/)下面去选择一个你喜欢的主题，主题非常丰富，这里我个人选择了主题[HBS](https://hbs.razonyang.com/)

![](https://jsdelivr.andyzheng.cc/gh/m430/images@master/202305230956523.webp)

HBS很多功能已经帮你做好了，你只需要配置一下就可以了，是一个功能很完备的一个主题，选择好你喜欢的主题后，需要把主题下载到刚才创建的站点的`themes`目录下才可以让Hugo识别。你在站点根目录执行如下命令：

```bash
git submodule add <theme_github_url> themes/<theme_name>
```

设置好主题后，你需要把一个HBS的模板项目拷贝到上面创建的项目下：

```bash
git clone https://github.com/razonyang/hugo-theme-bootstrap-skeleton /tmp/hbs-skeleton
mkdir config
cp -a /tmp/hbs-skeleton/config/* ./config
cp -r /tmp/hbs-skeleton/content/* ./content
cp -r /tmp/hbs-skeleton/archetypes/* ./archetypes
cp -r /tmp/hbs-skeleton/static/* ./static
cp -r /tmp/hbs-skeleton/assets/* ./assets
```

然后安装相关的依赖就可以本地启动项目了：

```bash
hugo mod npm pack
npm install
hugo server
```

恭喜你，已经可以看到站点的最初样子了，比如我这里选择的主题是[HBS](https://hbs.razonyang.com/)，就可以看到如下：

![](https://jsdelivr.andyzheng.cc/gh/m430/images@master/202305230956522.webp)

看起来还是很精美的有没有。后续针对主题自定义就不在这里展开了，后面可以单独开一篇来讲。

## 四、通过Github Action配置自动部署

---

本地预览成功后，我们最终希望发布到互联网上，让其他人看到，这个部署的过程可以通过Github Action直接自动化完成。

### 4.1 配置Github Pages的Action

进入`<username>.github.io`仓库的`Settings>Pages`页面，然后再`Build and deployment`下配置发布源为Github Actions，并选择Hugo的预设Action。如图所示：

![](https://jsdelivr.andyzheng.cc/gh/m430/images@master/202305230956521.webp)

配置好以后会再你的站点仓库下生成`.github/hugo.yml`文件，里面定义了自动化部署流程，新手不需要有任何改动，直接将它拉取到本地的仓库。

### 4.2 推送站点

最后把本地的站点推送到Github即可。推送后会自动触发Github Actions的流程，在仓库的Pages配置页面下可以看到：

![](https://jsdelivr.andyzheng.cc/gh/m430/images@master/202305230956520.webp)

恭喜你，到这里，站点已经可以在互联网上被所有人访问了，点击`Visit site`，就可以访问自己的站点了。默认的站点域名就是仓库名`https://<username>.github.io`**。**

## 五、总结

Github Pages部署个人站点非常方便，配合静态工具生成框架，是个人搭建独立博客非常好的选择，如果你想搭建一个属于自己的个性独立博客，非常推荐这种方式。

## 六、参考资料

[创建 GitHub Pages 站点 - GitHub 文档](https://docs.github.com/zh/pages/getting-started-with-github-pages/creating-a-github-pages-site)

[Quick Start | Hugo (gohugo.io)](https://gohugo.io/getting-started/quick-start/)

[Introduction - HBS (Hugo Theme Bootstrap) v1 (razonyang.com)](https://hbs.razonyang.com/v1/en/docs/getting-started/introduction/)
