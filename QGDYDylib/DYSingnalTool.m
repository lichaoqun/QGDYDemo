//
//  DYSingnalTool.m
//  QGDYDylib
//
//  Created by 李超群 on 2018/10/16.
//  Copyright © 2018 李超群. All rights reserved.
//

#import "DYSingnalTool.h"
#import <objc/message.h>

typedef void (^MyBlock)(NSError *error, id params);

@interface DYSingnalTool()
/** <#注释#> */
@property (nonatomic, strong) NSMutableArray *itemids;

/** <#注释#> */
@property (nonatomic, strong) UILabel *toastLabel;


@end

@implementation DYSingnalTool{
    UITableView *_tabViw;
}

static DYSingnalTool *singnalTool_;

/** 单利对象 */
+(instancetype)singnalTool{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singnalTool_ = [[self alloc]init];
        singnalTool_.itemids = [NSMutableArray array];
    });
    return singnalTool_;
}

- (UILabel *)toastLabel{
    
    if (!_toastLabel) {
        _toastLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 40)];
        _toastLabel.textAlignment = NSTextAlignmentCenter;
        _toastLabel.textColor = [UIColor whiteColor];
        _toastLabel.font = [UIFont systemFontOfSize:12];
        _toastLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        [[UIApplication sharedApplication].keyWindow addSubview:_toastLabel];
    }
    return _toastLabel;
}

-(void)autoScrollTableView:(UITableView *)tableView{

    _tabViw = tableView;
    int commentTime = arc4random() % 4 + 3;
    int scrollTime = commentTime + arc4random() % 4 + 2;
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(autoScroll) object:nil];
    [self performSelector:@selector(autoScroll) withObject:nil afterDelay:scrollTime];
    
    NSString *itemId = [DYSingnalTool singnalTool].itemId;
    if ([self.itemids containsObject:itemId]) return;
    
    id (*fn)(Class, SEL) = (id (*)(Class, SEL))objc_msgSend;
    id p = fn(NSClassFromString(@"TTNetworkManagerAFNetworking"), NSSelectorFromString(@"shareInstance"));
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(commentTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        MyBlock block = ^(NSError *error, id data){
            self.toastLabel.text  = data[@"status_msg"];
            self.toastLabel.hidden = NO;
        };
        
        id (*fn1)(id, SEL, id, id, id, BOOL, Class, Class, BOOL, MyBlock) = (id (*)(id, SEL, id, id, id, BOOL, Class, Class, BOOL, MyBlock))objc_msgSend;
        
        fn1(p,        NSSelectorFromString(@"requestForJSONWithURL:params:method:needCommonParams:requestSerializer:responseSerializer:autoResume:callback:"),
            @"https://aweme.snssdk.com/aweme/v1/comment/publish/",
            @{@"aweme_id" : itemId, @"text" : @"我是抖音最最最6的用户,请关注我!!!"},
            @"POST",
            YES,
            nil,
            nil,
            YES,
            block
            );
        
        if (![self.itemids containsObject:[DYSingnalTool singnalTool].itemId]) {
            [self.itemids addObject:[DYSingnalTool singnalTool].itemId];
        }
    });

}

-(void)autoScroll{
    CGFloat hei = [UIScreen mainScreen].bounds.size.height;
    [_tabViw setContentOffset:CGPointMake(0, _tabViw.contentOffset.y + hei) animated:YES];
    self.toastLabel.hidden = YES;
}

@end
