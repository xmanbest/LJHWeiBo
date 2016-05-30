//
//  JHMainTabBarController.swift
//  LJHWeiBo
//
//  Created by 李建華 on 16/5/30.
//  Copyright © 2016年 lijianhua. All rights reserved.
//

import UIKit

class JHMainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup tabbar item selected color
        tabBar.tintColor = UIColor.orangeColor()
        
        setupChildController()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // add plus button to tabbar
        setupPlusBtn()
    }
    
    /**
     add plus button to tabbar
     */
    private func setupPlusBtn() {
        // get button info
        let tabbarItemCount = childViewControllers.count
        let tabbarItemWidth = UIScreen.mainScreen().bounds.size.width / CGFloat(tabbarItemCount)
        
        // setup button
        let plusBtn = UIButton(frame: CGRect(x: tabbarItemWidth * 2, y: 0, width: tabbarItemWidth, height: 49))
        plusBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        plusBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        plusBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        plusBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        plusBtn.addTarget(self, action: #selector(JHMainTabBarController.plusBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        tabBar .addSubview(plusBtn)
    }
    
    /**
     plus button click handler
     */
    func plusBtnClick() {
        print(#function)
    }
    
    /**
     setup ChildController
     */
    private func setupChildController() {
        
        if let path = NSBundle.mainBundle().pathForResource("MainVCSettings", ofType: "json") {
            
            let jsonData = NSData.dataWithContentsOfMappedFile(path) as! NSData
            
            do {
                let vcSettingArray = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers)
                
                // obtain jsonData
                for vcSetting in vcSettingArray as! [[String:String]] {
                    
                    // add child controller
                    setChildController(vcSetting["vcName"]!, title: vcSetting["title"]!, imageName: vcSetting["imageName"]!)
                }
                
            } catch let error as NSError{
                print(error.localizedDescription)
                
                setChildController("JHHomeViewController", title: "首页", imageName: "tabbar_home")
                setChildController("JHMessageViewController", title: "消息", imageName: "tabbar_message_center")
                setChildController("JHPlaceHolderViewController", title: "", imageName: "")
                setChildController("JHDiscoverViewController", title: "发现", imageName: "tabbar_discover")
                setChildController("JHProfileViewController", title: "我", imageName: "tabbar_profile")
            }
            
            
        }
    }
    
    /**
     add items to Tabbar
     */
    private func setChildController(controllerName: String, title: String, imageName: String) {
        
        // get NameSpace name
        let nameSpaceName = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        // obtain Vc Class
        let controllerClass = NSClassFromString(nameSpaceName + "." + controllerName) as! UIViewController.Type
        // get controller
        let controller = controllerClass.init()
        
        // set property
        controller.title = title
        controller.tabBarItem.image = UIImage(named: imageName)
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")

        
        // add child controller
        let nav = UINavigationController(rootViewController: controller)
        addChildViewController(nav)
    }
}
