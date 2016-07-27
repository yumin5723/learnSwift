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
    
    var layout0_: UIImage!
    var _imageView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.brownColor()
        self.title = "五月天-天使"
        let image = UIImage(named:"473976-XXL")
        _imageView = UIImageView(image: image)
//        _imageView!.frame=CGRectMake(0,0,image!.size.width,image!.size.height)
        _imageView!.contentMode = .ScaleAspectFit
        self.view.addSubview(_imageView!)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initTabarItem(){
        let firstImage = UIImage(named:"pie bar icon")
        self.tabBarItem = UITabBarItem(title: "首页",image: firstImage, tag: 0)
        UITabBar.appearance().tintColor = UIColor.redColor()
    }
    
    
}