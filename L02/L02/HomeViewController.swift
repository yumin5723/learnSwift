//
//  ViewController.swift
//  L04
//
//  Created by 刘旺磊 on 16/8/2.
//  Copyright © 2016年 刘旺磊. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    var txtUser: UITextField! //用户名输入框
    var txtPwd: UITextField! //密码输入款
    var formView: UIView! //登陆框视图
    var horizontalLine: UIView! //分隔线
    var confirmButton:UIButton! //登录按钮
    var titleLabel: UILabel! //标题标签
    
    var topConstraint: Constraint? //登录框距顶部距离约束
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: "my-home")
        self.tabBarItem = UITabBarItem(title: "我的",image: img, tag: 2)

        
        //视图背景色
        self.view.backgroundColor = UIColor(red: 1/255, green: 170/255, blue: 235/255,
                                            alpha: 1)
        
        //登录框高度
        let formViewHeight = 90
        //登录框背景
        self.formView = UIView()
        self.formView.layer.borderWidth = 0.5
        self.formView.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.formView.backgroundColor = UIColor.whiteColor()
        self.formView.layer.cornerRadius = 5
        self.view.addSubview(self.formView)
        //最常规的设置模式
        self.formView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            //存储top属性
            self.topConstraint = make.centerY.equalTo(self.view).constraint
            make.height.equalTo(formViewHeight)
        }
        
        //分隔线
        self.horizontalLine =  UIView()
        self.horizontalLine.backgroundColor = UIColor.lightGrayColor()
        self.formView.addSubview(self.horizontalLine)
        self.horizontalLine.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(0.5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.centerY.equalTo(self.formView)
        }
        
        //密码图
        let imgLock1 =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
        imgLock1.image = UIImage(named:"iconfont-user")
        
        //密码图
        let imgLock2 =  UIImageView(frame:CGRectMake(11, 11, 22, 22))
        imgLock2.image = UIImage(named:"iconfont-password")
        
        //用户名输入框
        self.txtUser = UITextField()
        self.txtUser.delegate = self
        self.txtUser.placeholder = "用户名"
        self.txtUser.tag = 100
        self.txtUser.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
        self.txtUser.leftViewMode = UITextFieldViewMode.Always
        self.txtUser.returnKeyType = UIReturnKeyType.Next
        
        //用户名输入框左侧图标
        self.txtUser.leftView!.addSubview(imgLock1)
        self.formView.addSubview(self.txtUser)
        
        //布局
        self.txtUser.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.centerY.equalTo(0).offset(-formViewHeight/4)
        }
        
        //密码输入框
        self.txtPwd = UITextField()
        self.txtPwd.delegate = self
        self.txtPwd.placeholder = "密码"
        self.txtPwd.tag = 101
        self.txtPwd.leftView = UIView(frame:CGRectMake(0, 0, 44, 44))
        self.txtPwd.leftViewMode = UITextFieldViewMode.Always
        self.txtPwd.returnKeyType = UIReturnKeyType.Next
        
        //密码输入框左侧图标
        self.txtPwd.leftView!.addSubview(imgLock2)
        self.formView.addSubview(self.txtPwd)
        
        //布局
        self.txtPwd.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.centerY.equalTo(0).offset(formViewHeight/4)
        }
        
        //登录按钮
        self.confirmButton = UIButton()
        self.confirmButton.setTitle("登录", forState: UIControlState.Normal)
        self.confirmButton.setTitleColor(UIColor.blackColor(),
                                         forState: UIControlState.Normal)
        self.confirmButton.layer.cornerRadius = 5
        self.confirmButton.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1,
                                                     alpha: 0.5)
        self.confirmButton.addTarget(self, action: #selector(loginConfrim),
                                     forControlEvents: .TouchUpInside)
        self.view.addSubview(self.confirmButton)
        self.confirmButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.top.equalTo(self.formView.snp_bottom).offset(20)
            make.right.equalTo(-15)
            make.height.equalTo(44)
        }
        
        //标题label
        self.titleLabel = UILabel()
        self.titleLabel.text = "hangge.com"
        self.titleLabel.textColor = UIColor.whiteColor()
        self.titleLabel.font = UIFont.systemFontOfSize(36)
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.formView.snp_top).offset(-20)
            make.centerX.equalTo(0)
            make.height.equalTo(44)
        }
    }
    
    //输入框获取焦点开始编辑
    func textFieldDidBeginEditing(textField:UITextField)
    {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.topConstraint?.updateOffset(-125)
            self.view.layoutIfNeeded()
        })
    }
    
    //输入框返回时操作
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        let tag = textField.tag
        switch tag {
        case 100:
            self.txtPwd.becomeFirstResponder()
        case 101:
            loginConfrim()
        default:
            print(textField.text)
        }
        return true
    }
    
    //登录按钮点击
    func loginConfrim(){
        //收起键盘
        self.view.endEditing(true)
        //视图约束恢复初始设置
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.topConstraint?.updateOffset(0)
            self.view.layoutIfNeeded()
        })
    }
}
