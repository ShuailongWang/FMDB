//
//  ViewController.swift
//  FMDBDemo
//
//  Created by czbk on 16/8/21.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //插入
        SqliteManager.sharedManager.insertData()
        
        //查找
        SqliteManager.sharedManager.selectData()
        
    }




}

