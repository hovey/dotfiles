# vscode

For Rust, turn off "inlay hints", which are provided by the rust-analyzer extension
in VS Code.  While they can be helpful, they can also feel like clutter if you're not
used to them.

To disable:

Edit settings.json:

1. Open the Command Palette with Cmd + Shift + P
2. Type: Preferences: Open User Settings (JSON) and press Enter
3. Add the following line to the JSON file to disable ALL inlay hints:

"rust-analyzer.inlayHints.enable": false,

or, if you just want to disable type hints, add this line instead:

"rust-analyzer.inlayHints.typeHints.enable": false

Either method will remove the tray type annotations and give a cleaner appearance in
VS Code with Rust.

Restart VS Code.  Success!

