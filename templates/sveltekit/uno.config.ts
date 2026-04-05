import transformerDirectives from "@unocss/transformer-directives";
import { defineConfig, presetWind4 } from "unocss";
import { presetScrollbarHide } from "unocss-preset-scrollbar-hide";

export default defineConfig({
	presets: [
		presetScrollbarHide(),
		presetWind4({
			preflights: {
				reset: true,
			},
		}),
	],

	transformers: [transformerDirectives()],
});
