//
//  AppDelegate.m
//  AVAudioPlayerTest
//
//  Created by Caixing Wang on 2019/5/3.
//  Copyright © 2019 Caixing Wang. All rights reserved.
//

#import "AppDelegate.h"
#import "AVFoundation/AVFoundation.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
    return YES;
}

-(void) remoteControlReceivedWithEvent:(UIEvent *)event{
    if (event.type == UIEventTypeRemoteControl) {
        switch (event.subtype) {
                   //单击播放按钮或者耳机线控中间的那个按钮
            case UIEventSubtypeRemoteControlPlay:
            {
                NSLog(@"play");
            }
                break;
                //单击暂停与播放切换按钮即抽屉中间的按钮
            case UIEventSubtypeRemoteControlTogglePlayPause:
            {
                NSLog(@"pause - play");
            }
                break;
                //单击下一曲或者耳机线控中间的按钮连击两下
            case UIEventSubtypeRemoteControlNextTrack:
            {
                NSLog(@"next");
            }
                break;
                //单击上一曲按钮或者耳机线控中间的按钮三下
            case UIEventSubtypeRemoteControlPreviousTrack:
            {
                NSLog(@"previous");
            }
                break;
            default:
                break;
        }
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
