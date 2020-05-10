# gm_win_toast
Windows 10 &amp; 8 notifications from Garry's Mod


### Functions

`WinToast.Show(string title, string content, string? image_path)`

image_path is an optional parameter its root is located in the `data` folder.

### Example

The example below will fire a new Windows notification for each chat message with the title being the player's nick and the content, the player message.
```lua
hook.Add("OnPlayerChat", "chat_notification", function(ply, msg)
	WinToast.Show(ply:Nick(), msg)
end)
```