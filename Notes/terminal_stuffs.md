# Error: 'xterm-kitty': unknown terminal type.
- Solute: *Run the following commands on the local machine's bash prompt*
   - ```sh
   `echo "export TERM=xterm-256color" >> ~/.bashrc`
   `source ~/.bashrc`
   ```
   -`source ~/.bashrc`

  ## For  keyboard speed
   **200** → *Delay (in milliseconds): This is the time the system waits after a key is pressed before it starts repeating. In this case, 150 milliseconds.*
                                       **50**  → *Repeat rate (per second): This is how many times the key repeats per second once it starts repeating. Here, it's set to 70 repeats per second.*

  `xset r rate 200 100`


   - use `xset -q` to check the current settings

## how to unzip to a folder
   - `unzip <zipfile> -d <zip-folder-name>`
