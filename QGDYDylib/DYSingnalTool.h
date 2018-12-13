//
//  DYSingnalTool.h
//  QGDYDylib
//
//  Created by 李超群 on 2018/10/16.
//  Copyright © 2018 李超群. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DYSingnalTool : NSObject

/** 视频的 id */
@property (nonatomic, copy) NSString *itemId;

/** 单利对象 */
+(instancetype)singnalTool;

/** 设置自动滑动 */
-(void)autoScrollTableView:(UITableView *)tableView;

@end
