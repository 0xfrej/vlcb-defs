use anyhow::Result;
use std::fs::{self};
use std::path::Path;

fn main() -> Result<()> {
    let manifest_dir = Path::new(env!("CARGO_MANIFEST_DIR"));

    // Read and parse the input
    let input_path = manifest_dir.join("..").join("output").join("generated.rs");
    let input_contents = fs::read_to_string(&input_path)?;
    let syntax_tree = syn::parse_file(&input_contents)?;

    // Write prettified output
    let output_path = manifest_dir.join("..").join("output").join("vlcb_defs.rs");
    let string = prettyplease::unparse(&syntax_tree);
    fs::write(&output_path, string)?;

    Ok(())
}
