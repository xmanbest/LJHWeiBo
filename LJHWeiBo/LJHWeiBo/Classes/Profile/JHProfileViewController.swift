//
//  JHProfileViewController.swift
//  LJHWeiBo
//
//  Created by 李建華 on 16/5/30.
//  Copyright © 2016年 lijianhua. All rights reserved.
//

import UIKit

class JHProfileViewController: JHBasicTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isLogin {
            (view as! JHLoginView).setDisplayItems(false, iconName: "visitordiscover_image_profile", text: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
        }
    }
}
