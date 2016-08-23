//
//  ViewController.m
//  sqliet原生
//
//  Created by czbk on 16/7/25.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()
{
    sqlite3 *_db;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    //创建数据库
    
    //文件路径
    NSString *dbPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"my.db"];
    
    //打开数据库文件
    int result = sqlite3_open(dbPath.UTF8String, &_db);
    
    //判断数据库是否打开
    if(result == SQLITE_OK){
        
        NSString *createTable = [NSString stringWithFormat:@"create table if not exists t_Tearch(id integer primary key,name not null, age integer);"];
        char *error = NULL;
        
        /*
         参数1,数据库实例
         参数2,sql语句
         参数3,回调函数
         参数4,回调函数的参数
         参数5,错误信息
         */
        sqlite3_exec(_db, createTable.UTF8String, NULL, NULL, &error);
        
        if(error == NULL){
            NSLog(@"创建成功.");
        }
        
    }
    
}


//添加
- (IBAction)addTable:(UIButton *)sender {
    
        int a = arc4random_uniform(100);
        int age = arc4random_uniform(100);
        NSString *insertTable = [NSString stringWithFormat:@"insert into t_Tearch(id,name,age) values(%zd,'apple%D',%d);",4,a,age];
        
        char *error = NULL;
        sqlite3_exec(_db, insertTable.UTF8String, NULL, NULL, &error);
        if(error == NULL){
            NSLog(@"添加成功.");
        }else{
            NSLog(@"添加失败");
        }

}

//删除
- (IBAction)delTable:(UIButton *)sender {
    NSString *delTable = [NSString stringWithFormat:@"delete from t_Tearch where id = 4"];
    char *error = NULL;
    sqlite3_exec(_db, delTable.UTF8String, NULL, NULL, &error);
    if(nil == error){
        NSLog(@"删除成功.");
    }
    
}

//修改
- (IBAction)updateTable:(UIButton *)sender {
    NSString *uptateTable = [NSString stringWithFormat:@"update t_Tearch set name = 'Laowang' where id = 4"];
    
    char *error = NULL;
    sqlite3_exec(_db, uptateTable.UTF8String, NULL, NULL, &error);
    if(error == NULL){
        NSLog(@"更新成功.");
    }
}







@end
