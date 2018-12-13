// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DYSingnalTool.h"
#import <objc/message.h>
#import "QGBlockTool.h"

%hook AWEFeedTableViewController

- (void)_onScrollDidEnd{
    %orig;

    UITableView *view = (UITableView *)[((UITableViewController *)self) valueForKey:@"tableView"];
    [[DYSingnalTool singnalTool] autoScrollTableView:view];
}

%end

%hook AWEFeedViewCell

- (void)configWithModel:(id)arg1{
    %orig;
    
    NSString *itemId = [(arg1) valueForKey:@"itemID"];
    [DYSingnalTool singnalTool].itemId = itemId;
}

%end

%hook TTNetworkManagerAFNetworking

- (id)requestForJSONWithURL:(id)arg1 params:(id)arg2 method:(id)arg3 needCommonParams:(_Bool)arg4 requestSerializer:(Class)arg5 responseSerializer:(Class)arg6 autoResume:(_Bool)arg7 callback:(id)arg8{
    [QGBlockTool printBlockDescriptor:(QGBlockLiteral *)arg8];
    id c = %orig;    
    return c;
}

%end
