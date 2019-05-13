const generateTheme = require("./generate-theme");
const path = require("path");
const fs = require("fs");

const themeName = "jellyfish";

const themePath = path.resolve(
  __dirname,
  "..",
  "themes",
  `${themeName}-theme.json`
);

const colors = {
  black: "#20242D",
  blacklight: "#343740",
  blackout: "#1E2129",
  white: "#C7C8FF",
  white77: "#C7C8FF77",
  white33: "#C7C8FF33",
  cyan: "#8ce8ff",
  blue: "#69B4F9",
  blue77: "#69B4F977",
  blue33: "#69B4F933",
  magenta: "#DD92F6",
  magenta77: "#DD92F677",
  magenta33: "#DD92F633",
  magentaMuted: "#DD92F633",
  red: "#FF8E8E",
  green: "#7efdd0",
  green77: "#7efdd077",
  green33: "#7efdd033",
  yellow: "#FCAD3F"
};

const theme = generateTheme(themeName, colors);

const main = async function(themePath, theme) {
  await fs.writeFileSync(themePath, JSON.stringify(theme), "utf-8");
};

main(themePath, theme);
