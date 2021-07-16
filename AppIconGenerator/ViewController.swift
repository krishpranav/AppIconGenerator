//
//  ViewController.swift
//  AppIconGenerator
//
//  Created by krisna pranav on 7/16/21.
//  Copyright © 2021 krisna pranav. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var action = 0
    var image = NSImage()
    
    @IBOutlet weak var labelType: NSTextField!
    @IBOutlet weak var imageMain: NSImageView!
    
    // mac
    @IBOutlet weak var image016A: NSImageView!
    @IBOutlet weak var image016B: NSImageView!
    @IBOutlet weak var image032A: NSImageView!
    @IBOutlet weak var image032B: NSImageView!
    @IBOutlet weak var image128A: NSImageView!
    @IBOutlet weak var image128B: NSImageView!
    @IBOutlet weak var image256A: NSImageView!
    @IBOutlet weak var image256B: NSImageView!
    @IBOutlet weak var image512A: NSImageView!
    @IBOutlet weak var image512B: NSImageView!
    
    // ios
    @IBOutlet weak var imageI01A: NSImageView!
    @IBOutlet weak var imageI01B: NSImageView!
    @IBOutlet weak var imageI02A: NSImageView!
    @IBOutlet weak var imageI02B: NSImageView!
    @IBOutlet weak var imageI03A: NSImageView!
    @IBOutlet weak var imageI03B: NSImageView!
    @IBOutlet weak var imageI04A: NSImageView!
    @IBOutlet weak var imageI04B: NSImageView!
    @IBOutlet weak var imageI05A: NSImageView!
    @IBOutlet weak var imageI05B: NSImageView!
    @IBOutlet weak var imageI06A: NSImageView!
    @IBOutlet weak var imageI06B: NSImageView!
    @IBOutlet weak var imageI07A: NSImageView!
    @IBOutlet weak var imageI07B: NSImageView!
    @IBOutlet weak var imageI08A: NSImageView!
    @IBOutlet weak var imageI08B: NSImageView!
    @IBOutlet weak var imageI09A: NSImageView!
    @IBOutlet weak var imageI09B: NSImageView!
    
    @IBOutlet weak var buttonFolder: NSButton!
    @IBOutlet weak var buttonExport: NSButton!
    @IBOutlet weak var tabView: NSTabView!
    
    @IBAction func onIconType(_ sender: Any) {
        action = (sender as! NSSegmentedControl).selectedSegment
        switch action {
        case 0: tabView.selectTabViewItem(at: 0); labelType.stringValue = "for macOS"
        case 1: tabView.selectTabViewItem(at: 1); labelType.stringValue = "for IOS"
        default: break
        }
    }
    
    @IBAction func onSelected(_ sender: Any) {
        let dialog = NSOpenPanel()
        dialog.canChooseFiles = true
        dialog.canChooseDirectories = false
        let choice = dialog.runModel()
        
        if choice == NSFileHandlingPanelOKButton {
            if let url = dialog.url {
                showMainImage(url)
                generateImages()
            }
        }
    }
    
    @IBAction func openFolder(_ sender: Any) {
        let folder = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        NSWorkspace.shared().open(folder)
    }
    
}

