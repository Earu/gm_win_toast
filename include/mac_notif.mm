#include "mac_notif.h"
#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

void display_notification(const char* title, const char* message, const char* image_path) 
{
    NSUserNotification* notification = [[NSUserNotification alloc] init];
    notification.title = [NSString stringWithUTF8String: title];
    notification.informativeText = [NSString stringWithUTF8String: message];
    notification.soundName = NSUserNotificationDefaultSoundName; // default sound

    if (image_path != nullptr) 
    {
        NSString* path_string = [NSString stringWithUTF8String: image_path];
        NSURL* path_url = [NSURL URLWithString: path_string];
        notification.contentImage = [[NSImage alloc] initWithContentsOfURL: path_url];
    }

    [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification: notification];
    [notification autorelease];
}