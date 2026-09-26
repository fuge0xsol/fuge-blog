#!/usr/bin/env bash
# fuge's blog (Astro + Fuwari) 本地发布脚本
# GitHub Pages 由 Actions 在 push 后自动构建;本脚本负责 Cloudflare(根路径构建 + wrangler 直传)。
# 配置 CLOUDFLARE_API_TOKEN 仓库密钥后,CF 也由 Actions 自动部署,本脚本可不用。
set -e
export HTTPS_PROXY=http://127.0.0.1:7897
export NO_UPDATE_CHECK=1 WRANGLER_SEND_METRICS=false

if [ -n "$(git status --porcelain)" ]; then
    git add -A
    git commit -m "post: update content $(date +%F)" --quiet
fi
git push

unset BASE_PATH
pnpm build
wrangler pages deploy dist --project-name=fuge-blog --branch=main --commit-dirty=true

echo "完成: https://fuge0xsol.github.io/fuge-blog/ (Actions 约 2 分钟)  |  https://fuge-blog.pages.dev"
