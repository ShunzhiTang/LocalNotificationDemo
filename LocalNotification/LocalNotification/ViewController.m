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

#pragma mark: 本地推送的属性分析
/*
 // 触发时间
 @property(nullable, nonatomic,copy) NSDate *fireDate;
 @property(nullable, nonatomic,copy) NSTimeZone *timeZone; //时区
 
 @property(nonatomic) NSCalendarUnit repeatInterval;      // 0 means don't repeat //重复间隔
 @property(nullable, nonatomic,copy) NSCalendar *repeatCalendar;//重复间隔
 
 // location-based scheduling
 @property(nullable, nonatomic,copy) CLRegion *region NS_AVAILABLE_IOS(8_0); //区域
 @property(nonatomic,assign) BOOL regionTriggersOnce NS_AVAILABLE_IOS(8_0); 区域触发一次
 
 // alerts
 @property(nullable, nonatomic,copy) NSString *alertBody; 提示主题
 @property(nonatomic) BOOL hasAction;                // defaults to YES. pass NO to hide launching button/slider 滑动
 @property(nullable, nonatomic,copy) NSString *alertAction;滑动解锁的按钮的提示
 
 @property(nullable, nonatomic,copy) NSString *alertLaunchImage; 通知启动图片
 @property(nullable, nonatomic,copy) NSString *alertTitle NS_AVAILABLE_IOS(8_2);  提示标题
 
 // sound
 @property(nullable, nonatomic,copy) NSString *soundName;     UILocalNotificationDefaultSoundName
 // badge
 @property(nonatomic) NSInteger applicationIconBadgeNumber; 图标文字
 
 // user info
 @property(nullable, nonatomic,copy) NSDictionary *userInfo; 携带参数
 @property (nullable, nonatomic, copy) NSString *category NS_AVAILABLE_IOS(8_0); nil
 */

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
