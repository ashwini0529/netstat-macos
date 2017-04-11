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
    @IBOutlet weak var SpeedView: SpeedView!
    var speedMenuItem: NSMenuItem!
    
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    @IBAction func QuitButton(_ sender: NSMenuItem) {
        
        NSApplication.shared().terminate(self)
        
    }
    
    override func awakeFromNib() {
        // Set up the icon
        
        speedMenuItem = statusMenu.item(withTitle: "Speed")
        speedMenuItem.view = SpeedView
        let icon = NSImage(named: "line-chart")
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        
        statusItem.menu = statusMenu
        
        let reachability = Reachability()
        reachability?.whenReachable = { reachability in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            DispatchQueue.main.async {
                if reachability.isReachableViaWiFi {
                    print("Reachable via WiFi")
                    
                } else {
                    print("Reachable via Cellular")
                }
            }
        }
        reachability?.whenUnreachable = { reachability in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            DispatchQueue.main.async {
                print("Not reachable")
            }
        }
        
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
        

    }
}
