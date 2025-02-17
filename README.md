# 🏆 FiveM Playtime-Tag Script

This **FiveM Lua script** displays a text above a player's head once they have not reached a certain playtime.

![image](https://github.com/user-attachments/assets/1d05e8ca-2ac4-47a0-801a-6f59a7bb9a55)

## 📌 Features
- Displays a text above the character when the set playtime is not reached
- Customizable playtime threshold and text display
- A command to deactivate these tags 

## 📂 Installation
1. **Download**: Download the script and save it in the `resources` folder of your FiveM server.
2. **Configuration**: Open `config.lua` and adjust the settings.
3. **Server.cfg**: Add the following line to your `server.cfg`:

   ```plaintext
   ensure esx_newbie
   ```
4. **Restart**: Restart your server, and the script will be active.

## ⚙️ Configuration
In `config.lua`, you can adjust:
```lua
Config = {}

Config.WhitelistedGroups = {"test_group"} -- Groups that do not have the text over their heads regardless of their playing time

Config.Time = 120 -- Up to what minute is the player considered “new” and receives the newbie status
Config.Text = "~g~Newbie" -- Which text should be displayed (you can use color codes like ~r~)

Config.minScale = 0.3 -- How small the text should be with minimum DrawDistance 
Config.maxScale = 0.35 -- How large the text should be at maximum DrawDistance 
Config.TextHeight = 0.85 -- How large the distance to the top of the head should be 

Config.DrawDistance = 5 -- How far away should you be able to see the text 
Config.SeeOwnText = true -- Should the player see his own text over his head? 

Config.SyncFrequenz = 30 -- How often the server sends the player information to the client in seconds, should not happen too often 30 seconds is a good value

Config.EnableHideCommand = true -- Activate the command to switch off the newcomer tag
Config.Command = "hideNew" -- The command to hide the tags 
```

## 🛠️ Support & Development
If you have any questions or want to contribute to further development, feel free to create an issue or pull request!

Enjoy the script! 🚀
