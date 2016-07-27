//
//  YuanViewController.swift
//  L02
//
//  Created by ethen on 16/7/26.
//  Copyright © 2016年 刘旺磊. All rights reserved.
//

import Foundation
import UIKit

class YuanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var _tableView: UITableView?
    var _dataSource: NSArray?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let img = UIImage(named: "3.jpg")
        self.tabBarItem = UITabBarItem(title: "",image: img, tag: 1)
        UITabBar.appearance().tintColor = UIColor.redColor()
        
        _dataSource = ["Anglababy", "柳岩"]
        _tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        _tableView?.backgroundColor = UIColor.whiteColor()
        _tableView?.delegate = self
        _tableView?.dataSource = self
        _tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        return 45
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        let row = indexPath.row
        let text = _dataSource![row] as! String
        cell.textLabel!.text = text
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