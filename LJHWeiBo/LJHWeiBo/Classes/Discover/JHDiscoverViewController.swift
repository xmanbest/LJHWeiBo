//
//  JHDiscoverViewController.swift
//  LJHWeiBo
//
//  Created by 李建華 on 16/5/30.
//  Copyright © 2016年 lijianhua. All rights reserved.
//

import UIKit

class JHDiscoverViewController: JHBasicTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isLogin {
            (view as! JHLoginView).setDisplayItems(false, iconName: "visitordiscover_image_profile", text: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
        }
    }
}
