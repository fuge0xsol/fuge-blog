#!/usr/bin/env bash
# fuge's blog 双平台发布脚本：GitHub Pages (gh-pages 分支) + Cloudflare Pages (wrangler 直传)
# 用法：写完文章后在本目录执行 ./deploy.sh
set -e
export PATH="/c/Users/fg/tools/hugo:/c/Program Files/GitHub CLI:$PATH"
export HTTPS_PROXY=http://127.0.0.1:7897
export NO_UPDATE_CHECK=1 WRANGLER_SEND_METRICS=false

# 1. GitHub Pages：按子路径构建 → 灌入 gh-pages 孤儿分支 → 推送
hugo --gc --minify --baseURL "https://fuge0xsol.github.io/fuge-blog/"
IDX="$PWD/.git/ghpages-index"
rm -f "$IDX"
export GIT_WORK_TREE="$PWD/public" GIT_INDEX_FILE="$IDX"
git add -A
git update-ref refs/heads/gh-pages "$(git commit-tree "$(git write-tree)" -m "deploy: $(date -u +%FT%TZ)")"
unset GIT_WORK_TREE GIT_INDEX_FILE
git push origin gh-pages

# 2. Cloudflare Pages：按根域名重新构建 → wrangler 直传
hugo --gc --minify --baseURL "https://fuge-blog.pages.dev/"
wrangler pages deploy public --project-name=fuge-blog --branch=main --commit-dirty=true

echo "完成: https://fuge0xsol.github.io/fuge-blog/  |  https://fuge-blog.pages.dev"
