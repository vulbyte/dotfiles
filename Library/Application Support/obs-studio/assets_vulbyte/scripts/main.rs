use screenshots::Screen;
use std::env;
use std::fs;
use std::path::Path;
use std::time::Instant;

fn main() {
    let start = Instant::now();
    let current_dir = env::current_dir().unwrap();
    let target_dir = current_dir.join("target");

    // Create the target directory if it does not exist
    if !Path::new(&target_dir).exists() {
        fs::create_dir(&target_dir).unwrap();
    }

    let screens = Screen::all().unwrap();

    for screen in screens {
        println!("capturer {screen:?}");
        let mut image = screen.capture().unwrap();
        image
            .save(target_dir.join(format!("{}.png", screen.display_info.id)))
            .unwrap();

        image = screen.capture_area(300, 300, 300, 300).unwrap();
        image
            .save(target_dir.join(format!("{}-2.png", screen.display_info.id)))
            .unwrap();
    }

    let screen = Screen::from_point(100, 100).unwrap();
    println!("capturer {screen:?}");

    let image = screen.capture_area(300, 300, 300, 300).unwrap();
    image
        .save(target_dir.join("capture_display_with_point.png"))
        .unwrap();
    println!("运行耗时: {:?}", start.elapsed());
}
