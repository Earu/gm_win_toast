# gm_win_toast
Cross-platform desktop notifications from Garry's Mod.

**Why is it called win_toast?** The module was originally intended for Windows, but later on got support for Linux.

### Compiling for linux/macosx
1) Get [premake](https://github.com/premake/premake-core/releases/download/v5.0.0-alpha14/premake-5.0.0-alpha14-linux.tar.gz) add it to your `PATH`
2) Get [garrysmod_common](https://github.com/danielga/garrysmod_common) (with `git clone https://github.com/danielga/garrysmod_common --recursive --branch=x86-64-support-sourcesdk`) and set an env var called `GARRYSMOD_COMMON` to the path of the local repo
3) Run `premake5 gmake --gmcommon=$GARRYSMOD_COMMON` in your local copy of **this** repo
4) Navigate to the makefile directory (`cd /projects/linux/gmake` or `cd /projects/macosx/gmake`)
5) Run `make config=releasewithsymbols_x86_64`

### Usage
Get one the pre-compiled binaries or build it yourself, then put the binary under `garrysmod/lua/bin`.

### Functions

`WinToast.Show(string title, string content, string? image_path)`

image_path is an optional parameter its root is located in the `data` folder.

### Example

The example below will display a new desktop notification for each chat message with the title being the player's nick and the content, the player message.
```lua
hook.Add("OnPlayerChat", "chat_notification", function(ply, msg)
	WinToast.Show(ply:Nick(), msg)
end)
```
