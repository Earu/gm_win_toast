#include <wintoastlib.h>
#include <filesystem>
#include <GarrysMod/Lua/Interface.h>

//using namespace WinToastLib;

const auto AUMI = WinToastLib::WinToast::configureAUMI(L"Facepunch", L"Garry's Mod");
bool is_usable = true;
static const char* error_reasons[] = {
	"No error",
	"Not inialized",
	"OS is not supported",
	"Unable to create a shell link",
	"Invalid AUMI",
	"Initialization params are invalid",
	"Could not display toast",
	"Unknown"
};

const std::string get_toast_error(int enum_value)
{
	return std::string(error_reasons[enum_value]);
}

const std::wstring to_utf16(const char* utf8_str)
{
	const std::string base_str(utf8_str);
	std::wstring utf16_str(base_str.size(), L' ');
	utf16_str.resize(std::mbstowcs(&utf16_str[0], base_str.c_str(), base_str.size()));

	return utf16_str;
}

class WinNotifsHandler : public WinToastLib::IWinToastHandler {
public:
	void toastActivated() const {}
	void toastActivated(int action_index) const {}
	void toastDismissed(WinToastLib::IWinToastHandler::WinToastDismissalReason state) const {}
	void toastFailed() const {}
};

LUA_FUNCTION(show_toast)
{
	if (!is_usable) {
		LUA->PushBool(false);
		return 1;
	}

	const bool has_image_path = LUA->Top() >= 3;
	const char* title = LUA->CheckString(1);
	const char* content = LUA->CheckString(2);

	WinToastLib::WinToastTemplate templ(has_image_path 
		? WinToastLib::WinToastTemplate::ImageAndText02
		: WinToastLib::WinToastTemplate::Text02
	);

	templ.setTextField(to_utf16(title), WinToastLib::WinToastTemplate::TextField::FirstLine);
	templ.setTextField(to_utf16(content), WinToastLib::WinToastTemplate::TextField::SecondLine);

	if (has_image_path) 
	{
		const char* data_path = LUA->CheckString(3);
		const std::wstring gmod_path = std::filesystem::current_path().wstring();
		const std::wstring full_path = gmod_path + L"/garrysmod/data/" + to_utf16(data_path);
		templ.setImagePath(full_path);
	}

	const bool success = WinToastLib::WinToast::instance()->showToast(templ, new WinNotifsHandler()) >= 0;
	LUA->PushBool(success);
	return 1;
}

GMOD_MODULE_OPEN()
{
	if (!WinToastLib::WinToast::isCompatible())
	{
		//LUA->ThrowError("[WinToasts] Your system is not supported!");
		is_usable = false;
		return 0;
	}

	WinToastLib::WinToast::instance()->setAppName(L"Garry's Mod");
	WinToastLib::WinToast::instance()->setAppUserModelId(AUMI);

	WinToastLib::WinToast::WinToastError err;
	if (!WinToastLib::WinToast::instance()->initialize(&err))
	{
		//const std::string err_msg = "[WinToasts] Could not initialize: " + get_toast_error(err);
		//LUA->ThrowError(err_msg.c_str());
		is_usable = false;
		return 0;
	}

	LUA->PushSpecial(GarrysMod::Lua::SPECIAL_GLOB);

	LUA->CreateTable();
	LUA->PushCFunction(show_toast);
	LUA->SetField(-2, "Show");
	LUA->SetField(-2, "WinToast");

	LUA->Pop();

	return 0;
}

GMOD_MODULE_CLOSE()
{
	return 0;
}