//
//  SpeedView.swift
//  NetStat
//
//  Created by Ashwini Purohit on 11/04/17.
//  Copyright © 2017 GDG. All rights reserved.
//

import Cocoa

class SpeedView: NSView {

    @IBOutlet weak var uploadText: NSTextField!
    @IBOutlet weak var downloadText: NSTextField!
    @IBAction func TestButton(_ sender: NSButton) {
        
        uploadText.stringValue = "20Kbps"
        downloadText.stringValue = "35Kbps"
    }
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
