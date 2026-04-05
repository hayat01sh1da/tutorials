const gulp = require("gulp");
const esbuild = require("esbuild");
const fancy_log = require("fancy-log");
const paths = { pages: ["./src/*.html"] };
gulp.task("copy-html", () => {
  return gulp.src(paths.pages).pipe(gulp.dest("dist"));
});
const bundle = async () => {
  await esbuild.build({
    entryPoints: ["./src/main.ts"],
    bundle: true,
    sourcemap: true,
    outfile: "./dist/bundle.js",
  });
}
gulp.task("default", gulp.series(gulp.parallel("copy-html"), bundle));
