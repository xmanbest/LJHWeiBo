//
//  JHPopupPresentationController.swift
//  LJHWeiBo
//
//  Created by 李建華 on 16/6/2.
//  Copyright © 2016年 lijianhua. All rights reserved.
//

import UIKit

class JHPopupPresentationController: UIPresentationController {
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        // setup presented view's frame
        presentedView()?.frame = CGRectMake(0, 0, 200, 200)
        
        // setup cover view between presented and presenting view
        setupCoverView()
    }
    
    // setup cover view between presented and presenting view
    func setupCoverView() {
        // create cover view
        let coverView = UIView()
        // add gesture recognizer
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(JHPopupPresentationController.tapCoverView))
        coverView.addGestureRecognizer(tapGes)
        // insert cover view between presented and presenting view
        containerView?.insertSubview(coverView, atIndex: 0)
        // setup constraints
        coverView.snp_makeConstraints { (make) in
            make.edges.equalTo(containerView!)
        }
    }
    
    func tapCoverView() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
