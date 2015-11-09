//
//  AppDelegate.m
//  LocalNotification
//
//  Created by Tsz on 15/11/8.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "AppDelegate.h"

#import "TSZChatViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

// 接收到通知调用
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
    //1、接收到通知就应该跳转到对应的界面做事情
    
    //聊天的内容 : 接收到通知之后会跳转到对应的界面做事情
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 500, 100, 30)];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%@",notification.userInfo[@"content"]];
    
//    [self.window.rootViewController.view addSubview:label];
    
    
    //添加控制器
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Chat" bundle:nil];
    
    TSZChatViewController *vc = sb.instantiateInitialViewController;
    
    [vc.view addSubview:label];
    self.window.rootViewController = vc;
    
    //更新显示的消息的条数
    [UIApplication sharedApplication].applicationIconBadgeNumber = notification.applicationIconBadgeNumber - 1;

    NSLog(@"%@  , %@  ,%@",notification.userInfo[@"name"] , notification.userInfo[@"time"] ,notification.userInfo[@"content"]);
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSLog(@"-------%@" ,launchOptions [UIApplicationLaunchOptionsLocalNotificationKey] );
    //1、接收通知启动
    if (launchOptions [UIApplicationLaunchOptionsLocalNotificationKey]) {
        //1、接收到通知就应该跳转到对应的界面做事情
        
        //聊天的内容 : 接收到通知之后会跳转到对应的界面做事情
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 500, 100, 30)];
        label.numberOfLines = 0;
        label.backgroundColor = [UIColor redColor];
        label.text = [NSString stringWithFormat:@"%@" , launchOptions [UIApplicationLaunchOptionsLocationKey]];
        
        //    [self.window.rootViewController.view addSubview:label];
        
        
        //添加控制器
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Chat" bundle:nil];
        
        TSZChatViewController *vc = sb.instantiateInitialViewController;
        
        [vc.view addSubview:label];
        self.window.rootViewController = vc;
        
        //更新显示的消息的条数
        
        UILocalNotification *local  = launchOptions [UIApplicationLaunchOptionsLocationKey];
        
        [UIApplication sharedApplication].applicationIconBadgeNumber = local.applicationIconBadgeNumber - 1;
    }else{
        NSLog(@"hhaha");
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
