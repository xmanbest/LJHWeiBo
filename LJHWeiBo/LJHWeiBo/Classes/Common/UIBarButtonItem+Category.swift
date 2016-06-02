//
//  UIBarButtonItem+Category.swift
//  LJHWeiBo
//
//  Created by 李建華 on 16/6/2.
//  Copyright © 2016年 lijianhua. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    class func createButtonItem(imageName: String, target: AnyObject?, action:Selector) -> UIBarButtonItem {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        btn.sizeToFit()
        
        return UIBarButtonItem(customView: btn)
    }
}