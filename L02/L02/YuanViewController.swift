//
//  YuanViewController.swift
//  L02
//
//  Created by ethen on 16/7/26.
//  Copyright © 2016年 刘旺磊. All rights reserved.
//

import Foundation
import UIKit

class YuanViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.blackColor()
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "yuan_background.jpg")
        imageView.contentMode = UIViewContentMode.ScaleAspectFill;
        self.view.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}