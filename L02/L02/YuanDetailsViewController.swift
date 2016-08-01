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

    var scrollView: UIScrollView?
    var imageView: UIImageView?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Details"
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    func setImage(imageName imageName: String) {
        
        if scrollView==nil {
            
            scrollView = UIScrollView(frame: self.view.bounds)
            scrollView!.backgroundColor = UIColor.whiteColor()
            self.view.addSubview(scrollView!)
        }
        if imageView==nil {
            
            imageView = UIImageView()
            imageView!.backgroundColor = UIColor.whiteColor()
            imageView!.contentMode = UIViewContentMode.Center
            scrollView!.addSubview(imageView!)
        }
        
        let image: UIImage = UIImage(named: imageName)!
        imageView!.image = image
        imageView!.frame = CGRectMake(0, 0, image.size.width, image.size.height)
        scrollView!.contentSize = CGSizeMake(image.size.width, image.size.height)
    }
}
