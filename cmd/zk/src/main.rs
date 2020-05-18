use chrono::prelude::*;
use regex::Regex;
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let title = &args[1];
    let slug = slugify_title(title.to_string());

    let local: DateTime<Local> = Local::now();
    let timestamp = local.format("%Y%m%d%H%M");

    // make a dynamic path

    println!("{:?}{:?}", slug, timestamp);
}

fn slugify_title(title: String) -> String {
    let re = Regex::new(r"[\W_]+").unwrap();
    return re.replace_all(title.to_lowercase().trim(), "-").to_string();
}
