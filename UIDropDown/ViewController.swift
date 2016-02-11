//
//  ViewController.swift
//  UIDropDown
//
//  Created by Isaac Gongora on 13/11/15.
//  Copyright © 2015 Isaac Gongora. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDropDownDelegate {
    
    @IBOutlet weak var segmented: UISegmentedControl!
    var drop: UIDropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drop = UIDropDown(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        drop.center = CGPoint(x: CGRectGetMidX(self.view.frame), y: CGRectGetMidY(self.view.frame))
        drop.delegate = self
        drop.options = ["Mexico", "EUA", "England", "France", "Germany", "Spain", "Italy", "Canada"]
        drop.placeholder = "Select a country..."
        self.view.addSubview(drop)
        
        segmented.addTarget(self, action: "segmentedDidChange:", forControlEvents: .ValueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        drop.resignFirstResponder()
    }
    
    func segmentedDidChange(sender: UISegmentedControl) {
    
        let index = sender.selectedSegmentIndex
        drop.animationType = UIDropDownAnimationType(rawValue: index)!
    }
    
    // UIDropDown Delegate
    
    func dropDown(dropDown: UIDropDown, didSelectOption option: String, atIndex index: Int) {
        print("Selected option: \(option) at index: \(index)")
    }
}

