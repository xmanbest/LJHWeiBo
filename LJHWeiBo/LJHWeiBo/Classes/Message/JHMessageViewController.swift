//
//  JHMessageViewController.swift
//  LJHWeiBo
//
//  Created by 李建華 on 16/5/30.
//  Copyright © 2016年 lijianhua. All rights reserved.
//

import UIKit

class JHMessageViewController: JHBasicTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isLogin {
            (view as! JHLoginView).setDisplayItems(false, iconName: "visitordiscover_image_message", text: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
        }
    }
}
