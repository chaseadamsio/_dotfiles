#![warn(clippy::all)]

use chrono::prelude::*;
use dirs::home_dir;
use regex::Regex;
use std::env;
use std::error::Error;
use std::fs::File;
use std::io::prelude::*;
use std::path::Path;
use std::process::Command;

fn main() {
    let args: Vec<String> = env::args().collect();

    let local: DateTime<Local> = Local::now();
    let timestamp = local.format("%Y%m%d%H%M");

    let input_title = if args.len() > 1 {
        format!("{} {}", timestamp, &args[1])
    } else {
        format!("{}", timestamp)
    };

    let slug = slugify_title(input_title.to_string());

    let contents = format!("# {}", input_title);

    let home_path = home_dir();
    let inbox_path = "Dropbox/notebook/!inbox";

    let filepath = &format!(
        "{}/{}/{}.md",
        home_path.unwrap().display(),
        inbox_path,
        slug
    );
    let path = Path::new(filepath);

    create_file(&path, &contents);
    open_file_in_code(&path);
}

fn slugify_title(title: String) -> String {
    let re = Regex::new(r"[\W_]+").unwrap();
    re.replace_all(title.to_lowercase().trim(), "-").to_string()
}

fn create_file(path: &Path, contents: &str) {
    let display = path.display();

    let mut file = match File::create(&path) {
        Err(why) => panic!("could not create {}: {}", display, why),
        Ok(file) => file,
    };

    match file.write_all(contents.as_bytes()) {
        Err(why) => panic!("could not write to {}: {}", display, why.description()),
        Ok(_) => println!("successfully wrote to {}", display),
    }
}

fn open_file_in_code(path: &Path) {
    // open VS Code with current file
    let mut child = Command::new("code")
        .arg(path)
        .spawn()
        .expect("failed to open editor");
    let ecode = child
        .wait()
        .expect("failed to wait on command to open editor");
    assert!(ecode.success());
}
