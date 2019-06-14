//
//  ViewController.m
//  WangYiYun
//
//  Created by TouGBao on 2019/6/9.
//  Copyright © 2019 TouGBao. All rights reserved.
//
#import "NodeRunner.hpp"
#import "ViewController.h"

@implementation ViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"UnblockNeteaseMusic-masters/IMG_0220"];
   self. view.layer.contents = (id) image.CGImage;
    
 
    
  //  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  //  btn.frame = CGRectMake(0, 0, self.view.frame.size.width, 88);
  //  btn.backgroundColor = [UIColor yellowColor];
  //  [self.view addSubview:btn];
 //   [btn addTarget:self action:@selector(myButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(IBAction)myButtonAction:(id)sender
{

    [self showinformation];

}

- (void)startNode {
    NSString* srcPath = [[NSBundle mainBundle] pathForResource:@"UnblockNeteaseMusic-masters/app.js" ofType:@""];//这个路径 是蓝色文件夹才行
    NSArray* nodeArguments = [NSArray arrayWithObjects:
                              @"node",
                              srcPath,
                              @"-p",
                              @"8080:8081",
                              nil
                              ];
    [NodeRunner startEngineWithArguments:nodeArguments];
}



-(IBAction)myButtonAction2:(id)sender
{
    [self showurl];
    
}
-(IBAction)myButtonAction3:(UISwitch*)sender
{
    //Currently, only a single instance of the Node.js runtime can be started within an application.
    //Restarting the engine after it has finished running is also not supported.
    NSThread* nodejsThread = nil;
    if(sender.on==true){
         nodejsThread = [[NSThread alloc]
                    initWithTarget:self
                    selector:@selector(startNode)
                    object:nil
                    ];
   
    // Set 2MB of stack space for the Node.js thread.
    //The iOS node runtime expects to have 1MB of stack space available. Having 2MB of stack space available is recommended.
    [nodejsThread setStackSize:10*1024*1024];
    [nodejsThread start];
    
    }
    else {
        [self showAlertDialog];
        
       
        
    }
    
    
}

-(void)showurl{
    UIAlertView *alertInformationView = [[UIAlertView alloc]initWithTitle:
                                         @"即将打开外部链接" message:@"安装描述文件" delegate:self
                                                        cancelButtonTitle:@"OK" otherButtonTitles:nil, nil, nil];
    [alertInformationView show];
}

-(void)showinformation{
    UIAlertView *alertInformationView = [[UIAlertView alloc]initWithTitle:
                              @"使用说明" message:@"wifi环境：1.开启版权服务2.去设置-无线局域网-HTTP代理-配置代理。4G环境：1.开启版权服务2.点击安装描述文件3.在safari中打开文件，按提示操作。" delegate:self
                                             cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil, nil];
    [alertInformationView show];
}




-(void)showAlertDialog{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
                              @"提示" message:@"立即退出app" delegate:self
                                             cancelButtonTitle:@"确定" otherButtonTitles:nil, nil, nil];
    [alertView show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *btnTitle = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([btnTitle isEqualToString:@"取消"]) {
                NSLog(@"你点击了取消");
           }else if ([btnTitle isEqualToString:@"确定"] ) {
               //NSLog(@"点击了确定按钮");
               exit(0);
              
               
               
               
               
           }
    else if([btnTitle isEqualToString:@"知道了"])
        
    {
        
    }
    else if([btnTitle isEqualToString:@"OK"])
        
    {
        NSString *str = [NSString stringWithFormat:@"https://pan.baidu.com/s/1eermdI-AvO6fyM3ljlIU2w"];         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];    }
    
    /*
    switch (buttonIndex) {
        case 0:
            //NSLog(@"点击了确定按钮");
            exit(0);
            break;
            
        case 1:
           // NSLog(@"点击了取消按钮");
            
            break;
            
        default:
            break;
    }
     
     */
}




@end
