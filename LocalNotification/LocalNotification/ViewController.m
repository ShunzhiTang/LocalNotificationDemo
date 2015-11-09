//
//  ViewController.m
//  LocalNotification
//
//  Created by Tsz on 15/11/8.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //iOS8之后 需要注册通知类型  包含哪些(声音,图标文字,文本) 信息
    /*
     UIUserNotificationTypeNone    = 0,
     UIUserNotificationTypeBadge   = 1 << 0, 包含图标文字  0001
     UIUserNotificationTypeSound   = 1 << 1, // 声音      0010
     UIUserNotificationTypeAlert   = 1 << 2, // 主题内容  0100
     */
    
    // 指定通知的 创建类型
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:
          UIUserNotificationTypeSound |
          UIUserNotificationTypeBadge |
          UIUserNotificationTypeAlert categories:nil];
    //注册
    [[UIApplication  sharedApplication] registerUserNotificationSettings:setting];

}

// 触摸事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"测试");
    
    //1、创建本地通知
    UILocalNotification *local = [[UILocalNotification alloc] init];
    
    //设置属性
    
    local.alertBody = @"女神：在吗？";
    
    //
    local.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    //音效 , 默认
    
    local.soundName  = UILocalNotificationDefaultSoundName;
    
    // 滑动解锁的文字
    local.alertAction = @"约";
    
    
    local.alertTitle = @"通知";
    
    //显示消息数
    local.applicationIconBadgeNumber = 10;
    
    //  用户指定的携带参数
    local.userInfo = @{@"name":@"女神",@"content":@"在吗?",@"time":@"20180815"};
    
    //定制一个通知  使用代理 监听什么接收到通知
    
    [[UIApplication sharedApplication]scheduleLocalNotification:local];
    
    //立即发送
    //  [[UIApplication sharedApplication] presentLocalNotificationNow:local];
    
    //取消所有 的本地通知
    //[[UIApplication sharedApplication]cancelAllLocalNotifications];
    
    NSDictionary *dict = @{@"name info":@"zhangsa"};
    
    NSLog(@"%@  , %@  ,%@",local.userInfo[@"name"] , local.userInfo[@"time"] ,local.userInfo[@"content"]);
    
    
}

@end
