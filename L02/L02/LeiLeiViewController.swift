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
        //首先创建一个模糊效果
        let blurEffect = UIBlurEffect(style: .Light)
        //接着创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        //设置模糊视图的大小（全屏）
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        
        //创建并添加vibrancy视图
        let vibrancyView = UIVisualEffectView(effect:
            UIVibrancyEffect(forBlurEffect: blurEffect))
        vibrancyView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        blurView.contentView.addSubview(vibrancyView)
        
        //将文本标签添加到vibrancy视图中
        let image1 = UIImage(named:"mayday1")
        let maoimageView = UIImageView(image: image1)
        maoimageView.frame=self.view.bounds
        maoimageView.contentMode = .ScaleAspectFit
//        vibrancyView.contentView.addSubview(maoimageView)
        
        self.view.addSubview(maoimageView)

    }
    
}