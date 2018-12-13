//
//  QGBlockTool.m
//  QGDYDylib
//
//  Created by 李超群 on 2018/10/19.
//  Copyright © 2018 李超群. All rights reserved.
//

#import "QGBlockTool.h"

@implementation QGBlockTool

/** 输出逆向的 block 的说明 */
+ (NSMethodSignature *)printBlockDescriptor:(QGBlockLiteral *)blockStruct{
    
    /** 判断 block 是否有签名 */
    BOOL hasSign = ((blockStruct -> flags  & (1 << 30)) != 0);
    if (!hasSign) return nil;
    QGBlockDescriptor *descriptor = blockStruct->descriptor;
    NSLog(@"descriptor : %@", [NSString stringWithUTF8String:descriptor -> signature]);
    NSMethodSignature *methodSignature = [NSMethodSignature signatureWithObjCTypes:descriptor -> signature];
    return methodSignature;
}
@end
