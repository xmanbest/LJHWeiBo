//
//  JHPopupViewController.swift
//  LJHWeiBo
//
//  Created by 李建華 on 16/6/2.
//  Copyright © 2016年 lijianhua. All rights reserved.
//

import UIKit

class JHPopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

extension JHPopupViewController: UITableViewDataSource, UITableViewDelegate {
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
