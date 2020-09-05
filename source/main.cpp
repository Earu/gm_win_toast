#ifdef _WIN32
#include <wintoastlib.h>
#elif defined(__linux__)
#include <libnotify/notify.h>
#elif defined(__APPLE__)
#include <mac_notif.h>
#include <mach-o/dyld.h>
#include <vector>
#endif
#include <filesystem>
#include <GarrysMod/Lua/Interface.h>

//using namespace WinToastLib;

#ifdef _WIN32
const auto AUMI = WinToastLib::WinToast::configureAUMI(L"Facepunch", L"Garry's Mod");
#endif

bool is_usable = true;

#ifdef _WIN32
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
#endif

#ifdef __APPLE__
std::string get_current_path()
{
	unsigned int buffer_size = 512;
	std::vector<char> buffer(buffer_size + 1);
	if (_NSGetExecutablePath(&buffer[0], &buffer_size))
	{
		buffer.resize(buffer_size);
		_NSGetExecutablePath(&buffer[0], &buffer_size);
	}

	std::string path = &buffer[0];
	return path;
}
#endif

LUA_FUNCTION(show_toast)
{
	if (!is_usable) {
		LUA->PushBool(false);
		return 1;
	}

	const bool has_image_path = LUA->Top() >= 3;
	const char* title = LUA->CheckString(1);
	const char* content = LUA->CheckString(2);

#ifdef _WIN32

	WinToastLib::WinToastTemplate templ(has_image_path 
		? WinToastLib::WinToastTemplate::ImageAndText02
		: WinToastLib::WinToastTemplate::Text02
	);

	templ.setTextField(to_utf16(title), WinToastLib::WinToastTemplate::TextField::FirstLine);
	templ.setTextField(to_utf16(content), WinToastLib::WinToastTemplate::TextField::SecondLine);
#endif

#ifdef __linux__
	NotifyNotification* Notification;
#endif
	if (has_image_path) 
	{
		const char* data_path = LUA->CheckString(3);
#ifdef _WIN32
		const std::wstring gmod_path = std::filesystem::current_path().wstring();
		const std::wstring full_path = gmod_path + L"/garrysmod/data/" + to_utf16(data_path);
		templ.setImagePath(full_path);
#elif defined(__linux__)
		const std::string gmod_path = std::filesystem::current_path();
		const std::string full_path = gmod_path + "/garrysmod/data/" + data_path;
		Notification = notify_notification_new(title, content, full_path.c_str());
#elif defined(__APPLE__)
		const std::string gmod_path = get_current_path();
		const std::string needle = "/common/GarrysMod";
		std::size_t pos = gmod_path.find(needle);
		if (pos != std::string::npos) 
		{
			const std::string full_path = gmod_path.substr(0, pos + needle.size()) + "/garrysmod/data/" + data_path;
			display_notification(title, content, full_path.c_str());
		}
		else
		{
			display_notification(title, content, nullptr);
		}
#endif
	}
#ifdef __linux__
	else 
	{
		Notification = notify_notification_new(title, content, "dialog-information");
	}
#elif defined(__APPLE__)
	else
	{
		display_notification(title, content, nullptr);
	}
#endif

#ifdef __linux__
	const bool success = notify_notification_show(Notification, NULL) == TRUE;
	g_object_unref(G_OBJECT(Notification));
#elif defined(_WIN32)
	const bool success = WinToastLib::WinToast::instance()->showToast(templ, new WinNotifsHandler()) >= 0;
#elif defined(__APPLE__)
	const bool success = true;
#endif
	LUA->PushBool(success);
	return 1;
}

GMOD_MODULE_OPEN()
{
#ifdef __linux__
	if(notify_init("Garry's Mod") == FALSE) {
		is_usable = false;
		return 0;
	}
#elif defined(_WIN32)
	if (!WinToastLib::WinToast::isCompatible())
	{
		is_usable = false;
		return 0;
	}

	WinToastLib::WinToast::instance()->setAppName(L"Garry's Mod");
	WinToastLib::WinToast::instance()->setAppUserModelId(AUMI);

	WinToastLib::WinToast::WinToastError err;
	if (!WinToastLib::WinToast::instance()->initialize(&err))
	{
		is_usable = false;
		return 0;
	}
#elif defined(__APPLE__)
	is_usable = true;
#else
	// some weird os?
	is_usable = false;
#endif

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
#ifdef __linux__
	notify_uninit();
#endif
	return 0;
}
