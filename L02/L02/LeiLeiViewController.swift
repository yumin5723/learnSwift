//
//  LeiLeiViewController.swift
//  L02
//
//  Created by ethen on 16/7/26.
//  Copyright © 2016年 刘旺磊. All rights reserved.
//

import Foundation
import UIKit

class LeiLeiViewController: UIViewController,UITabBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.brownColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initTabarItem(){
        let firstImage = UIImage(named:"pie bar icon")
        self.tabBarItem = UITabBarItem(title: "首页",image: firstImage,tag: 0)
    }
    
    
}