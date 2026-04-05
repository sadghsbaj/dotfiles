import { mount } from "svelte";
import "./app.css";
import App from "./App.svelte";
import "virtual:uno.css";

const element = document.getElementById("app");

let app: ReturnType<typeof mount> | undefined;

if (element) {
	app = mount(App, {
		target: element,
	});
} else {
	throw new Error("Root-Element 'app' wurde im DOM nicht gefunden.");
}

export default app;
