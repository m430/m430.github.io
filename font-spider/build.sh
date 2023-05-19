#!/bin/bash
script_dir=$(dirname $0)
scss_dir=assets/main/scss
fsp local "$script_dir/en.html"
fsp local "$script_dir/zh.html"
echo "====已压缩字体===="

font=LXGWWenKai-Regular
eot=$(cat $script_dir/fonts/$font.eot | base64 | tr -d '\n')
woff=$(cat $script_dir/fonts/$font.woff | base64 | tr -d '\n')
woff2=$(cat $script_dir/fonts/$font.woff2 | base64 | tr -d '\n')
ttf=$(cat $script_dir/fonts/$font.ttf | base64 | tr -d '\n')
svg=$(cat $script_dir/fonts/$font.svg | base64 | tr -d '\n')

cat >$scss_dir/_font_zh.scss <<EOF
@font-face {
    font-family: $font;
    src: url(data:application/font-eot;charset=utf-8;base64,$eot) format('eot');
    font-weight: normal;
    font-style: normal;
}
EOF
echo "====生成中文css===="

enFont=JetBrainsMonoNL-Regular
eot=$(cat $script_dir/fonts/$enFont.eot | base64 | tr -d '\n')
woff=$(cat $script_dir/fonts/$enFont.woff | base64 | tr -d '\n')
woff2=$(cat $script_dir/fonts/$enFont.woff2 | base64 | tr -d '\n')
ttf=$(cat $script_dir/fonts/$enFont.ttf | base64 | tr -d '\n')
svg=$(cat $script_dir/fonts/$enFont.svg | base64 | tr -d '\n')

cat >$scss_dir/_font_en.scss <<EOF
@font-face {
    font-family: $enFont;
    src: url(data:application/font-eot;charset=utf-8;base64,$eot) format('eot');
    font-weight: normal;
    font-style: normal;
}
EOF
echo "====生成英文css===="
