//
//  StatusMenuController.swift
//  NetStat
//
//  Created by Ashwini Purohit on 11/04/17.
//  Copyright © 2017 GDG. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {

    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    @IBAction func QuitButton(_ sender: NSMenuItem) {
        
        NSApplication.shared().terminate(self)
        
    }
    
    override func awakeFromNib() {
        // Set up the icon
        let icon = NSImage(named: "line-chart")
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu

    }
}
