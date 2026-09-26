import { defineAstroPaperConfig } from "./src/types/config";

export default defineAstroPaperConfig({
  site: {
    // GH Pages 构建时由 SITE_URL 覆盖为 https://fuge0xsol.github.io/fuge-blog/
    url: process.env.SITE_URL || "https://fuge-blog.pages.dev/",
    title: "fuge's blog",
    description: "Web3 · 链上 · 随笔 —— fuge 的个人博客。",
    author: "fuge",
    profile: "https://github.com/fuge0xsol",
    ogImage: "default-og.jpg",
    lang: "en",
    timezone: "Asia/Shanghai",
    dir: "ltr",
  },
  posts: {
    perPage: 6,
    perIndex: 4,
    scheduledPostMargin: 15 * 60 * 1000,
  },
  features: {
    lightAndDarkMode: true,
    dynamicOgImage: false,
    showArchives: true,
    showBackButton: true,
    editPost: {
      enabled: true,
      url: "https://github.com/fuge0xsol/fuge-blog/edit/main/",
    },
    search: "pagefind",
  },
  socials: [
    { name: "github", url: "https://github.com/fuge0xsol" },
    { name: "x",      url: "https://x.com/fuge0xsol" },
    { name: "mail",   url: "mailto:fuge0xsol@proton.me" },
  ],
  shareLinks: [
    { name: "x",        url: "https://x.com/intent/post?url=" },
    { name: "telegram", url: "https://t.me/share/url?url=" },
    { name: "whatsapp", url: "https://wa.me/?text=" },
  ],
});
