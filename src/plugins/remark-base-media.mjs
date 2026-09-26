import { visit } from "unist-util-visit";

/**
 * Pages CMS 在正文里插入的是根绝对路径(/media/...)。
 * 根路径部署(Cloudflare)天然可用;子路径部署(GitHub Pages /fuge-blog/)需要补前缀。
 * prefix 取自 BASE_PATH 环境变量,与 astro.config.mjs 的 base 保持一致。
 */
export function remarkBaseMedia() {
	const prefix = (process.env.BASE_PATH || "").replace(/\/$/, "");
	return (tree) => {
		if (!prefix) return;
		visit(tree, "image", (node) => {
			if (node.url.startsWith("/media/")) node.url = prefix + node.url;
		});
		visit(tree, "html", (node) => {
			if (typeof node.value === "string" && node.value.includes('src="/media/')) {
				node.value = node.value.replaceAll('src="/media/', `src="${prefix}/media/`);
			}
		});
	};
}
