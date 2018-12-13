#line 1 "/Users/lichaoqun/Desktop/QGDYDemo/QGDY/QGDYDylib/Logos/QGDYDylib.xm"


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DYSingnalTool.h"
#import <objc/message.h>
#import "QGBlockTool.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class TTNetworkManagerAFNetworking; @class AWEFeedTableViewController; @class AWEFeedViewCell; 
static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$_onScrollDidEnd)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$_onScrollDidEnd(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEFeedViewCell$configWithModel$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedViewCell* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEFeedViewCell$configWithModel$(_LOGOS_SELF_TYPE_NORMAL AWEFeedViewCell* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$TTNetworkManagerAFNetworking$requestForJSONWithURL$params$method$needCommonParams$requestSerializer$responseSerializer$autoResume$callback$)(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerAFNetworking* _LOGOS_SELF_CONST, SEL, id, id, id, _Bool, Class, Class, _Bool, id); static id _logos_method$_ungrouped$TTNetworkManagerAFNetworking$requestForJSONWithURL$params$method$needCommonParams$requestSerializer$responseSerializer$autoResume$callback$(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerAFNetworking* _LOGOS_SELF_CONST, SEL, id, id, id, _Bool, Class, Class, _Bool, id); 

#line 9 "/Users/lichaoqun/Desktop/QGDYDemo/QGDY/QGDYDylib/Logos/QGDYDylib.xm"


static void _logos_method$_ungrouped$AWEFeedTableViewController$_onScrollDidEnd(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    _logos_orig$_ungrouped$AWEFeedTableViewController$_onScrollDidEnd(self, _cmd);

    UITableView *view = (UITableView *)[((UITableViewController *)self) valueForKey:@"tableView"];
    [[DYSingnalTool singnalTool] autoScrollTableView:view];
}





static void _logos_method$_ungrouped$AWEFeedViewCell$configWithModel$(_LOGOS_SELF_TYPE_NORMAL AWEFeedViewCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
    _logos_orig$_ungrouped$AWEFeedViewCell$configWithModel$(self, _cmd, arg1);
    
    NSString *itemId = [(arg1) valueForKey:@"itemID"];
    [DYSingnalTool singnalTool].itemId = itemId;
}





static id _logos_method$_ungrouped$TTNetworkManagerAFNetworking$requestForJSONWithURL$params$method$needCommonParams$requestSerializer$responseSerializer$autoResume$callback$(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerAFNetworking* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3, _Bool arg4, Class arg5, Class arg6, _Bool arg7, id arg8){
    [QGBlockTool printBlockDescriptor:(QGBlockLiteral *)arg8];
    id c = _logos_orig$_ungrouped$TTNetworkManagerAFNetworking$requestForJSONWithURL$params$method$needCommonParams$requestSerializer$responseSerializer$autoResume$callback$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);    
    return c;
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$AWEFeedTableViewController = objc_getClass("AWEFeedTableViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(_onScrollDidEnd), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$_onScrollDidEnd, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$_onScrollDidEnd);Class _logos_class$_ungrouped$AWEFeedViewCell = objc_getClass("AWEFeedViewCell"); MSHookMessageEx(_logos_class$_ungrouped$AWEFeedViewCell, @selector(configWithModel:), (IMP)&_logos_method$_ungrouped$AWEFeedViewCell$configWithModel$, (IMP*)&_logos_orig$_ungrouped$AWEFeedViewCell$configWithModel$);Class _logos_class$_ungrouped$TTNetworkManagerAFNetworking = objc_getClass("TTNetworkManagerAFNetworking"); MSHookMessageEx(_logos_class$_ungrouped$TTNetworkManagerAFNetworking, @selector(requestForJSONWithURL:params:method:needCommonParams:requestSerializer:responseSerializer:autoResume:callback:), (IMP)&_logos_method$_ungrouped$TTNetworkManagerAFNetworking$requestForJSONWithURL$params$method$needCommonParams$requestSerializer$responseSerializer$autoResume$callback$, (IMP*)&_logos_orig$_ungrouped$TTNetworkManagerAFNetworking$requestForJSONWithURL$params$method$needCommonParams$requestSerializer$responseSerializer$autoResume$callback$);} }
#line 40 "/Users/lichaoqun/Desktop/QGDYDemo/QGDY/QGDYDylib/Logos/QGDYDylib.xm"
