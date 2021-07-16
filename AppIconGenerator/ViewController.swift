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
    
    @IBAction func onExport(_ sender: Any) {
        let dialog = NSOpenPanel()
        dialog.canChooseFiles = false
        dialog.canChooseDirectories = true
        let choice = dialog.runModal()
        
        if choice == NSFileHandlingPanelOKButton {
            if let folder = dialog.url {
                if action == 1 {
                    saveIosIconset(folder)
                } else {
                    saveMacIconset(folder)
                }
            }
        }
    }
    
    func showMainImage(_ url: URL) {
        self.image = NSImage(byReferencingFile: url.path)!
        DispatchQueue.main.async { self.imageMain.image = self.image }
    }
    
    func generateImages() {
        var folder = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        folder.appendPathComponent("AppIcon.appiconset", isDirectory: true)
        var isFolder: ObjCBool = true
        if !FileManager.default.fileExists(atPath: folder.path, isDirectory: &isFolder) {
            try? FileManager.default.createDirectory(at: folder, withIntermediateDirectories: false, attributes: nil)
        }
        
        DispatchQueue.main.async {
            self.image016A.image = self.image.resize(  16,  16);
            self.image016B.image = self.image.resize(  32,  32);
            self.image032A.image = self.image.resize(  32,  32);
            self.image032B.image = self.image.resize(  64,  64);
            self.image128A.image = self.image.resize( 128, 128);
            self.image128B.image = self.image.resize( 256, 256);
            self.image256A.image = self.image.resize( 256, 256);
            self.image256B.image = self.image.resize( 512, 512);
            self.image512A.image = self.image.resize( 512, 512);
            self.image512B.image = self.image.resize(1024,1024);

            self.imageI01A.image = self.image.resize(  40,  40);
            self.imageI01B.image = self.image.resize(  60,  60);
            self.imageI02A.image = self.image.resize(  58,  58);
            self.imageI02B.image = self.image.resize(  87,  87);
            self.imageI03A.image = self.image.resize(  80,  80);
            self.imageI03B.image = self.image.resize( 120, 120);
            self.imageI04A.image = self.image.resize( 120, 120);
            self.imageI04B.image = self.image.resize( 180, 180);
            self.imageI05A.image = self.image.resize(  20,  20);
            self.imageI05B.image = self.image.resize(  40,  40);
            self.imageI06A.image = self.image.resize(  29,  29);
            self.imageI06B.image = self.image.resize(  58,  58);
            self.imageI07A.image = self.image.resize(  40,  40);
            self.imageI07B.image = self.image.resize(  80,  80);
            self.imageI08A.image = self.image.resize(  76,  76);
            self.imageI08B.image = self.image.resize( 152, 152);

            self.imageI09B.image = self.image.resize( 167, 167);
        }
        
        if action == 1 {
            saveIosIconset(folder)
        } else {
            saveMacIconset(folder)
        }
        
        buttonFolder.isHidden = false
        buttonExport.isHidden = false
    }
}

