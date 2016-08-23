//
//  PersonDBTool.m
//  第三方-FMDB
//
//  Created by czbk on 16/7/25.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "PersonDBTool.h"
#import "FMDB.h"


@implementation PersonDBTool

static FMDatabase *_db;

+(void)initialize{
    NSLog(@"----1----1-----1-----");
    //数据库路径
    NSString *dbPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"person.db"];
    
    //创建并打开数据库
    _db = [FMDatabase databaseWithPath:dbPath];
    
    //判断是否打开
    BOOL result = [_db open];
    if(result){
        //建立表格
        BOOL temp = [_db executeUpdate:@"create table if not exists t_Person(id integer primary key,name text not null, age integer);"];
        
        if(temp){
            NSLog(@"建立表格成功");
        }
    }
    
}

//增加数据
+(void)insertWithPerson:(Person*)person{
    [_db executeUpdateWithFormat:@"insert into t_Person(name,age) values(%@,%@)",person.name,person.age];
}


//更改数据
+(void)updateWithPerson:(Person*)person{
    [_db executeUpdateWithFormat:@"update t_Person set name = %@,age = %@ where id = 1",person.name,person.age];
}


//查询数据
+(NSArray*)queryAllPerson{
    NSMutableArray *arrM = [NSMutableArray array];
    
    FMResultSet *resultSet = [_db executeQuery:@"select name,age from t_Person;"];
    
    while ([resultSet next]) {
        Person *per = [[Person alloc]init];
        per.name = [resultSet stringForColumn:@"name"];
        per.age = @([resultSet intForColumn:@"age"]);
        
        [arrM addObject:per];
    }
    return arrM.copy;
}


//模糊查询数据
+(NSMutableArray*)queryAllPerson:(NSString *)key{
    NSMutableArray *arrM = [NSMutableArray array];

    FMResultSet *result = [_db executeQuery:[NSString stringWithFormat:@"select name, age from t_Person where name like '%%%@%%';",key]];
    
    while ([result next]) {
        Person *per = [[Person alloc]init];
        per.name = [result stringForColumn:@"name"];
        per.age = @([result intForColumn:@"age"]);
        
        [arrM addObject:per];
    }
    
    return arrM;
}


@end
