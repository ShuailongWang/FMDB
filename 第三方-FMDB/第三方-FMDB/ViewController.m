//
//  ViewController.m
//  第三方-FMDB
//
//  Created by czbk on 16/7/25.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "ViewController.h"
#import "PersonDBTool.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) NSMutableArray *arrayList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self setupUI];
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //
    [self demo1];
    
    //
//    [self demo2];
    
    //
//    [self demo3];
    
}

-(void)demo3{
    Person *per = [[Person alloc]init];
    per.name = @"Laowang11";
    per.age = @20;
    
    [PersonDBTool queryAllPerson];
}

-(void)demo2{
    Person *per = [[Person alloc]init];
    per.name = @"Laowang11";
    per.age = @20;
    
    //修改数据
    [PersonDBTool updateWithPerson:per];
}

-(void)demo1{
    Person *per = [[Person alloc]init];
    NSArray *arr = @[@"Wang",@"Li",@"Liu",@"Zhao",@"Cao",@"Huang",@"Dong",@"Peng"];
    
    NSArray *array = @[@"q",@"w",@"e",@"r",@"t",@"y",@"u",@"i",@"o",@"p",@"a",@"s",@"d",@"f",@"g",@"h",@"j",@"k",@"l",@"z",@"x",@"c",@"v",@"b",@"n",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
     
    for (int i = 0; i < 100; i++) {
        int a = arc4random_uniform(35);
        int b = arc4random_uniform(8);
        
        
        int age = arc4random_uniform(100);
        
        
        per.name = [NSString stringWithFormat:@"%@%@",arr[b],array[a]];
        per.age = @(age);
        
        //插入数据
        [PersonDBTool insertWithPerson:per];
    }
}

#pragma mark 添加搜索框
-(void)setupUI{
    UISearchBar *searBar = [[UISearchBar alloc]init];
    searBar.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 30);
    searBar.delegate = self;
    self.tableView.tableHeaderView = searBar;
}

#pragma mark 搜索框代理方法
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"%@",searchText);
    if(searchText.length != 0){
        self.arrayList = [PersonDBTool queryAllPerson:searchText];
    }else{
        [self.arrayList removeAllObjects];
    }
    
    [self.tableView reloadData];
}

#pragma mark 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    Person *model = self.arrayList[indexPath.row];
    
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",model.age];
    
    return cell;
}


@end
