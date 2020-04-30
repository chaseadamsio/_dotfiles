#!/usr/local/bin/node

// First run at a ZettelKestan script for creating a note from anywhere and opening it in VS Code

const path = require("path");
const child_process = require("child_process");
const fs = require("fs");

if (!process.argv[2]) {
  throw new Error(
    `zk requires a string wrapped in " " as an argument for a note title.`
  );
}

const note_title = process.argv[2];

const NOTEBOOK_DIR = path.join(require("os").homedir(), "Dropbox", "notebook");
const INBOX_DIR = path.join(NOTEBOOK_DIR, "!inbox");

const slug = note_title
  .trim()
  .toLowerCase()
  .replace(/[^a-zA-Z0-9 ]+/g, "")
  .replace(/\s+/g, "-");

const maybeAddZero = (val) => {
  return val < 10 ? `0${val}` : val;
};

const getTimestamp = () => {
  const date = new Date();
  const year = date.getFullYear();
  const month = maybeAddZero(date.getMonth() + 1);
  const day = maybeAddZero(date.getDate());
  const hour = maybeAddZero(date.getHours());
  const minute = maybeAddZero(date.getMinutes());
  return `${year}${month}${day}${hour}${minute}`;
};

const timestamp = getTimestamp();

const filepath = path.join(INBOX_DIR, `${timestamp}-${slug}.md`);

try {
  fs.writeFileSync(filepath, `# ${timestamp} ${note_title}`);
} catch (err) {
  throw new Error(`unable to write file: ${err.stack}`);
}

child_process.exec(`code ${filepath}`);
