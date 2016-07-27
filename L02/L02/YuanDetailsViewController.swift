//
//  YuanDetailsViewController.swift
//  L02
//
//  Created by ethen on 16/7/27.
//  Copyright © 2016年 刘旺磊. All rights reserved.
//

import Foundation
import UIKit

class YuanDetailsViewController: UIViewController {

    var imageView: UIImageView? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Details"
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    func setImage(imageName imageName: String) {
        if imageView==nil {
            
            imageView = UIImageView(frame: self.view.bounds)
            imageView!.contentMode = UIViewContentMode.ScaleAspectFill;
            self.view.addSubview(imageView!)
        }
        imageView!.image = UIImage(named: imageName)
    }
}
