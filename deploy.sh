#!/usr/bin/env bash
# fuge's blog 发布脚本：push 到 GitHub main 触发 Actions 部署 GitHub Pages，
# 本地构建后用 wrangler 直传 Cloudflare Pages。
# 用法：写完文章后在本目录执行 ./deploy.sh
set -e
export PATH="/c/Users/fg/tools/hugo:/c/Program Files/GitHub CLI:$PATH"
export HTTPS_PROXY=http://127.0.0.1:7897
export NO_UPDATE_CHECK=1 WRANGLER_SEND_METRICS=false

# 1. 提交并推送（GitHub Pages 由 Actions 自动构建部署）
if [ -n "$(git status --porcelain)" ]; then
    git add -A
    git commit -m "post: update content $(date +%F)" --quiet
fi
git push

# 2. Cloudflare Pages：按根域名构建 → wrangler 直传
hugo --gc --minify --baseURL "https://fuge-blog.pages.dev/"
wrangler pages deploy public --project-name=fuge-blog --branch=main --commit-dirty=true

echo "完成: https://fuge0xsol.github.io/fuge-blog/ (Actions 构建约 1 分钟)  |  https://fuge-blog.pages.dev"
