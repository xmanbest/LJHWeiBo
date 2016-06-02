//
//  JHLoginView.swift
//  LJHWeiBo
//
//  Created by 李建華 on 16/6/1.
//  Copyright © 2016年 lijianhua. All rights reserved.
//

import UIKit

class JHLoginView: UIView {
    
    // MARK: Constant
    
    let TEXT_LAB_WIDTH: Double = 250
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // add items to view
        addItemsToView()
        
        // add constrains to items
        addConstrainsToItems()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Method
    
    func setDisplayItems(isHome: Bool, iconName: String, text: String) {
        smallicon.hidden = !isHome
        iconView.image = UIImage(named: iconName)
        textLab.text = text
    }
    
    // MARK: - Private Method
    
    /**
     setup items autoLayout
     */
    private func addConstrainsToItems() {
        iconView.snp_makeConstraints { (make) in
            make.center.equalTo(snp_center)
        }
        backgroundMask.snp_makeConstraints { (make) in
            let offY: CGFloat = -100
            make.size.equalTo(self).offset(CGSizeMake(0, -offY))
            make.top.equalTo(self.snp_top).offset(offY)
        }
        smallicon.snp_makeConstraints { (make) in
            make.center.equalTo(iconView.snp_center)
        }
        textLab.snp_makeConstraints { (make) in
            make.top.equalTo(iconView.snp_bottom)
            make.centerX.equalTo(iconView.snp_centerX)
            make.width.equalTo(TEXT_LAB_WIDTH)
        }
        loginBtn.snp_makeConstraints { (make) in
            make.top.equalTo(textLab.snp_bottom)
            make.left.equalTo(textLab.snp_left)
            make.width.equalTo(TEXT_LAB_WIDTH * 0.45)
        }
        regiserBtn.snp_makeConstraints { (make) in
            make.top.equalTo(textLab.snp_bottom)
            make.right.equalTo(textLab.snp_right)
            make.width.equalTo(TEXT_LAB_WIDTH * 0.45)
        }
    }
    
    /**
     add items to display view
     */
    private func addItemsToView() {
        addSubview(smallicon)
        addSubview(backgroundMask)
        addSubview(iconView)
        addSubview(textLab)
        addSubview(loginBtn)
        addSubview(regiserBtn)
    }

    
    // MARK: - Lazy
    private lazy var iconView: UIImageView = {
        return UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    }()
    private lazy var smallicon: UIImageView = {
        let smallIcon = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        
        // add animation to smallIcons item
        let ca = CABasicAnimation(keyPath: "transform.rotation")
        ca.fromValue = 0
        ca.toValue = M_PI * 2
        ca.repeatCount = MAXFLOAT
        ca.duration = 20
        ca.removedOnCompletion = false
        smallIcon.layer.addAnimation(ca, forKey: nil)
        
        return smallIcon
    }()
    private lazy var backgroundMask: UIImageView = {
        return UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    }()
    private lazy var textLab: UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 0
        lab.text = "测试"
        lab.textColor = UIColor.darkGrayColor()
        return lab
    }()
    private lazy var loginBtn: UIButton = {
        let btn = UIButton(type: UIButtonType.Custom)
//        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        return btn
    }()
    private lazy var regiserBtn: UIButton = {
        let btn = UIButton(type: UIButtonType.Custom)
//        btn.frame = CGRect(x: 0, y: 0, width: self.TEXT_LAB_WIDTH * 0.4, height: 30)
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        return btn
    }()
}
