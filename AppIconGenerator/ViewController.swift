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
}

