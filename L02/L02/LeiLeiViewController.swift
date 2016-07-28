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
    var refreshAlert:UIAlertController!
    var isDisplay: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "五月天-天使"
        let image = UIImage(named:"473976-XXL")
        _imageView = UIImageView(image: image)
        _imageView!.frame=self.view.bounds
        _imageView!.contentMode = .ScaleAspectFit
        self.view.addSubview(_imageView!)
  
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(LeiLeiViewController.imageTapped(_:)))
        _imageView!.userInteractionEnabled = true
        _imageView!.addGestureRecognizer(tapGestureRecognizer)
        
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
    
    func imageTapped(img: AnyObject)
    {
        //将文本标签添加到vibrancy视图中
        let image1 = UIImage(named:"mayday1")
        let maoimageView = UIImageView(image: image1)
        maoimageView.frame=self.view.bounds
        maoimageView.contentMode = .ScaleAspectFit
//        vibrancyView.contentView.addSubview(maoimageView)
        if isDisplay == 0 {
            _imageView!.addSubview(maoimageView)
            isDisplay = 1
        } else {
            for maoimageView in _imageView!.subviews {
                maoimageView.removeFromSuperview()
                isDisplay = 0
            }
            
        }
        
    }
    
    
}