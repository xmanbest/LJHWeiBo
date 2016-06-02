//
//  JHTitleButton.swift
//  LJHWeiBo
//
//  Created by 李建華 on 16/6/2.
//  Copyright © 2016年 lijianhua. All rights reserved.
//

import UIKit

class JHTitleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitle("长相搞笑 ", forState: UIControlState.Normal)
        setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: UIControlState.Selected)
        sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = (titleLabel?.frame.size.width)!
    }
}
