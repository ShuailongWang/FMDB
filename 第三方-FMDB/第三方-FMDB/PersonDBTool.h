//
//  PersonDBTool.h
//  第三方-FMDB
//
//  Created by czbk on 16/7/25.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


@interface PersonDBTool : NSObject

//增加数据
+(void)insertWithPerson:(Person*)person;

//更改数据
+(void)updateWithPerson:(Person*)person;

//查询数据
+(NSArray*)queryAllPerson;

//模糊查询数据
+(NSMutableArray*)queryAllPerson:(NSString *)key;

@end
