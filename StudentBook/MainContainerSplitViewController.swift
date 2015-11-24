//
//  MainContainerSplitViewController.swift
//  StudentBook
//
//  Created by Sahand Nayebaziz on 11/24/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import Cocoa

class MainContainerSplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let itemSidebar = NSSplitViewItem(sidebarWithViewController: SidebarViewController())
        let itemMain = NSSplitViewItem(viewController: MainViewController())
        
        addSplitViewItem(itemSidebar)
        addSplitViewItem(itemMain)
        
        itemSidebar.maximumThickness = 250
        itemSidebar.minimumThickness = 200
    }
    
}
