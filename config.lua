Config = {}

Config.WhitelistedGroups = {"test_group"} -- Groups that do not have the text over their heads regardless of their playing time

Config.Time = 120 -- Up to what minute is the player considered “new” and receives the newbie status (minutes)
Config.Text = "~g~Newbie" -- Which text should be displayed (you can use color codes like ~r~)

Config.minScale = 0.3 -- How small the text should be with minimum DrawDistance 
Config.maxScale = 0.35 -- How large the text should be at maximum DrawDistance 
Config.TextHeight = 0.85 -- How large the distance to the top of the head should be 

Config.DrawDistance = 5 -- How far away should you be able to see the text 
Config.SeeOwnText = true -- Should the player see his own text over his head? 

Config.SyncFrequenz = 30 -- How often the server sends the player information to the client in seconds, should not happen too often 30 seconds is a good value 


Config.EnableHideCommand = true -- Activate the command to switch off the newcomer tag
Config.Command = "hideNew" -- The command to hide the tags 
