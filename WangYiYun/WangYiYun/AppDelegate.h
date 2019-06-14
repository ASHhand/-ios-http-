//
//  AppDelegate.h
//  WangYiYun
//
//  Created by TouGBao on 2019/6/9.
//  Copyright © 2019 TouGBao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

