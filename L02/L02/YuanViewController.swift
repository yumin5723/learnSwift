//
//  YuanViewController.swift
//  L02
//
//  Created by ethen on 16/7/26.
//  Copyright © 2016年 刘旺磊. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class YuanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var _tableView: UITableView?
    var _dataSource: NSArray?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let img = UIImage(named: "coffee.jpg")
        self.tabBarItem = UITabBarItem(title: "",image: img, tag: 1)
        
        _dataSource = ["Anglababy", "柳岩", "小泽玛利亚", "柚木提娜", "苍井空"]
        _tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        _tableView?.backgroundColor = UIColor.whiteColor()
        _tableView?.delegate = self
        _tableView?.dataSource = self
        _tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        self.view.addSubview(_tableView!)
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableViewDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if ((_dataSource?.count) != 0) {
            return _dataSource!.count
        }else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 88
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as UITableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        let row: Int = indexPath.row
        let text: String = _dataSource![row] as! String
        let image: UIImage = UIImage(named: String(format: "%i.jpg", indexPath.row+1))!
        cell.textLabel!.text = text
        cell.imageView?.image = image
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let detailsViewController = YuanDetailsViewController()
        detailsViewController.setImage(imageName: String(format: "%i.jpg", indexPath.row+1))
        detailsViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}