//
//  QGBlockTool.h
//  QGDYDylib
//
//  Created by 李超群 on 2018/10/19.
//  Copyright © 2018 李超群. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct  {
    unsigned long int reserved;
    unsigned long int size;
    void (*copy_helper)(void *dst, void *src);
    void (*dispose_helper)(void *src);
    const char *signature;
}QGBlockDescriptor;

typedef struct  {
    void *isa;
    int flags;
    int reserved;
    void (*invoke)(void *, ...);
    QGBlockDescriptor *descriptor;
} QGBlockLiteral;

@interface QGBlockTool : NSObject

/** 输出逆向的 block 的说明 */
+ (NSMethodSignature *)printBlockDescriptor:(QGBlockLiteral *)blockStruct;
@end
