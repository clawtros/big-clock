//
//  ViewController.swift
//  bigclock
//
//  Created by Adam Benzan on 2015-10-01.
//  Copyright © 2015 clawtros. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var timer:NSTimer?
    var formatter:NSDateFormatter = NSDateFormatter()
    
    @IBOutlet var backgroundView: NSView!
    @IBOutlet weak var timerLabel: NSTextField!
    
    func updateTime() {
        formatter.dateFormat = ""
        formatter.timeStyle = .ShortStyle
        timerLabel.stringValue = formatter.stringFromDate(NSDate())
        self.view.window!.title = timerLabel.stringValue
        timerLabel.sizeToFit()
    }
    
    func handleResize(event:AnyObject?) {
        print(event)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(backgroundView)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "windowDidResize", name: "handleResize", object: nil)
        backgroundView.wantsLayer = true
        backgroundView.layer?.backgroundColor = CGColorCreateGenericRGB(0.2, 0.2, 0.2, 1)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target:self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

