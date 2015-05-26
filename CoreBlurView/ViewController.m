//
//  ViewController.m
//  CoreBlurView
//
//  Created by 冯成林 on 15/5/26.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "CoreBlurView.h"



@interface ViewController ()

@property (nonatomic,weak) CoreBlurView *blurView;

@property (weak, nonatomic) IBOutlet UIImageView *imageV;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CoreBlurView *blurView = [[CoreBlurView alloc] initWithFrame:CGRectMake(20, 40, 100, 100)];
    
    blurView.layer.borderColor = [UIColor redColor].CGColor;
    
    blurView.layer.borderWidth = .5f;
    
    //开启动态模糊
    blurView.blurEnabled = YES;

    blurView.dynamic =NO;
    
    blurView.blurRadius = 16;
    
    blurView.tintColor = [UIColor clearColor];
    
    blurView.underlyingView = self.view.window;
    
    _blurView = blurView;
    
    [self.view addSubview:blurView];
    
    
//    [CoreBlurView setBlurEnabled:NO];
    
    
    _imageV.layer.borderColor = [UIColor redColor].CGColor;
    
    _imageV.layer.borderWidth = .5f;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"开始");
        _imageV.image = [[UIImage imageNamed:@"1"] blurredImageWithRadius:20 iterations:10 tintColor:[UIColor clearColor]];
        NSLog(@"结束");
    });
}


//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//    UIViewController *vc= [[UIViewController alloc] init];
//    
//    [self.navigationController pushViewController:vc animated:YES];
//}



-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = touches.anyObject;
    
    self.blurView.center = [touch locationInView:touch.view];
    
    [_blurView updateAsynchronously:NO completion:^{
        NSLog(@"完成");
    }];
    
}




@end
