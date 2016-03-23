//
//  WBDataModel.m
//  TYDemo
//
//  Created by wanglj on 16/3/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "WBDataModel.h"
#import "WBDealing.h"

@implementation WBDataModel
-(instancetype)initWithJsonDictionary:(NSDictionary *)dic
{
    self=[super init];
    if (self)
    {
        WSet_Dic_Obj_Key(dic,self.statuses,@"statuses");
        WSet_Dic_Obj_Key(dic,self.ad,@"ad");
        WSet_Dic_Int_Key(dic,self.total_number,@"total_number");
    }
    return self;
}

@end
