#include "mac_notif.h"
#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

void display_notification(const char* title, const char* message, const char* image_path) 
{
    @autoreleasepool 
    {
        NSUserNotification* notification = [[NSUserNotification alloc] init];
        notification.title = [NSString stringWithUTF8String: title];
        notification.informativeText = [NSString stringWithUTF8String: message];
        notification.soundName = NSUserNotificationDefaultSoundName; // default sound

        if (image_path != nullptr) 
        {
            NSString* path_string = [NSString stringWithUTF8String: image_path];
            notification.contentImage = [[NSImage alloc] initWithContentsOfFile: path_string];
        }

        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification: notification];
        [notification autorelease];
    }
}