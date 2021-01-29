newoption({
	trigger = "gmcommon",
	description = "Sets the path to the garrysmod_common (https://github.com/danielga/garrysmod_common) directory",
	value = "path to garrysmod_common directory"
})

local gmcommon = assert(_OPTIONS.gmcommon or os.getenv("GARRYSMOD_COMMON"),
	"you didn't provide a path to your garrysmod_common (https://github.com/danielga/garrysmod_common) directory")
include(path.join(gmcommon, "generator.v3.lua"))

CreateWorkspace({name = "win_toast"})
    CreateProject({serverside = false})
        links("AppKit.framework")
        IncludeLuaShared()
        filter("system:linux")
            linkoptions({"-lnotify", "`pkg-config --libs libnotify`"})
	    buildoptions({"`pkg-config --cflags-only-I libnotify`"})
        filter({})
        includedirs({"include"})
        files({
            "include/*.cpp",
            "include/*.mm",
            "include/*.h"
        })