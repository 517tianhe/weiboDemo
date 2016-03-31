//
//  WBUserModel.m
//  TYDemo
//
//  Created by wanglj on 16/3/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "WBUserModel.h"
#import "NSString+Size.h"

@implementation WBUserModel

- (CGFloat)nameWidth {
    return [_name textSizeWithFont:TITLE_FONT_SIZE constrainedToSize:CGSizeMake(200, TITLE_FONT_SIZE.lineHeight)].width;
}
-(void)setVerified_type:(NSInteger)verified_type
{
    switch (verified_type)
    {
        case -1:
        {
            self.verifiedImageUrl=@"";
        }
            break;
        case 0:
        {
            self.verifiedImageUrl=@"avatar_vip";
        }
            break;
        case 10:
        {
            self.verifiedImageUrl=@"avatar_vgirl";
        }
            break;
        case 200:
        {
            self.verifiedImageUrl=@"avatar_grassroot";
        }
            break;
        default:
        {
            self.verifiedImageUrl=@"avatar_enterprise_vip";
        }
            break;
    }
    _verified_type=verified_type;
}
@end
