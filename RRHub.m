//
//  RRHub.m
//  测试跳转A
//
//  Created by ru on 2017/8/15.
//  Copyright © 2017年 GMJK. All rights reserved.
//

#import "RRHub.h"

@interface RRHub ()


@property (nonatomic, strong) UIImageView *icon;

@end

@implementation RRHub



+ (RRHub *)shardHubView {
    
    static RRHub *shareView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareView = [[RRHub alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        
        
        
        UIImageView *icon = [[UIImageView alloc] init];
        icon.image = [UIImage imageNamed:@"loading_00000"];
        
        
        
        icon.frame = CGRectMake(0, 0, 120, 120);
        
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:15];
        for (NSInteger i = 0; i < 15; i++) {
            
            NSString *str =  [NSString stringWithFormat:@"loading_000%02zd",i];
            
            [arrM addObject:[UIImage imageNamed:str]];
        }
        
        icon.animationImages = arrM;
        icon.animationRepeatCount = 0;
        icon.animationDuration = 0.5;
        
        
        [icon startAnimating];
        
        [shareView addSubview:icon];
        
        
        
        icon.center = [shareView center];
        shareView.icon = icon;
    });
    
    return shareView;
}


+ (void)showLoding {
   
    [[[UIApplication sharedApplication].delegate window] addSubview:[self shardHubView]];
    
//    [self shardHubView].userInteractionEnabled = NO;
}


+ (void)dissmiss {
    
    [UIView animateWithDuration:0.35 animations:^{
        
        [self shardHubView].icon.transform = CGAffineTransformScale([self shardHubView].icon.transform, 0.2, 0.2);
        
        [self shardHubView].icon.opaque = 0;
        
    } completion:^(BOOL finished) {
        [self shardHubView].icon.transform = CGAffineTransformIdentity;
        
        [self shardHubView].icon.opaque = 1;
        
        [[self shardHubView] removeFromSuperview];
        
    }];
    
}



@end
