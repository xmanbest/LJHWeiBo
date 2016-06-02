//
//  JHBasicTableViewController.swift
//  LJHWeiBo
//
//  Created by 李建華 on 16/6/1.
//  Copyright © 2016年 lijianhua. All rights reserved.
//

import UIKit
import SnapKit


class JHBasicTableViewController: UITableViewController {
    
    // MARK: - Property
    
    /// login:true  not:false
    var isLogin = true
    
    override func loadView() {
        // if login display default view , otherwise login view
        isLogin ? super.loadView() : displayLoginView()
    }
    
    
    /**
     display login view instead of default view
     */
    private func displayLoginView() {
        // change display view
        view = JHLoginView(frame: UIScreen.mainScreen().bounds)
        
        // setup navibar item
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(JHBasicTableViewController.register))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(JHBasicTableViewController.login))
        
    }
    
    func register() {
        print(#function)
    }
    
    func login() {
        print(#function)
    }
    
}
