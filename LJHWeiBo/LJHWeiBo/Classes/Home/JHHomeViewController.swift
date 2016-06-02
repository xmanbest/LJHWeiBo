//
//  JHHomeViewController.swift
//  LJHWeiBo
//
//  Created by 李建華 on 16/5/30.
//  Copyright © 2016年 lijianhua. All rights reserved.
//

import UIKit

class JHHomeViewController: JHBasicTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if not login
        if !isLogin {
            (view as! JHLoginView).setDisplayItems(true, iconName: "visitordiscover_feed_image_house", text: "关注一些人，回这里看看有什么惊喜")
            return
        }
        
        // have login
        setupNaviBar()
        
    }
    
    /**
     setup navigationBar item
     */
    func setupNaviBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.createButtonItem("navigationbar_friendattention", target: self, action: #selector(JHHomeViewController.leftNaviItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem.createButtonItem("navigationbar_pop", target: self, action: #selector(JHHomeViewController.rightNaviItemClick))
        
        titleBtn.addTarget(self, action: #selector(JHHomeViewController.titleBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    func titleBtnClick() {
        titleBtn.selected = !titleBtn.selected
        
        // popup view
        popupView()
        
    }
    
    private func popupView() {
        let popupVc = UIStoryboard(name: "Popup", bundle: nil).instantiateInitialViewController()
        popupVc?.modalPresentationStyle = UIModalPresentationStyle.Custom
        popupVc?.transitioningDelegate = self;
//        popupVc?.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        presentViewController(popupVc!, animated: true, completion: nil)
    }
    
    func leftNaviItemClick() {
        print(#function)
    }
    
    func rightNaviItemClick() {
        print(#function)
    }
    
    // MARK: - Lazy
    
    private lazy var titleBtn: JHTitleButton = {
        return JHTitleButton(type: UIButtonType.Custom)
    }()
}

// MARK: - UIViewControllerTransitioningDelegate
extension JHHomeViewController: UIViewControllerTransitioningDelegate {
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return JHPopupPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}
