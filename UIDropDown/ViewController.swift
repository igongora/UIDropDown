//
//  ViewController.swift
//  UIDropDown
//
//  Created by Isaac Gongora on 13/11/15.
//  Copyright © 2015 Isaac Gongora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmented: UISegmentedControl!
    var drop: UIDropDown!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drop = UIDropDown(frame: CGRect(x: 0, y: 0, width: 150, height: 75))
        drop.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        drop.delegate = self
        drop.options = ["Mexico", "EUA", "England", "France", "Germany", "Spain", "Italy", "Canada"]
        drop.placeholder = "Select a country..."
       // drop.tableHeight = 300
        self.view.addSubview(drop)
        
        segmented.addTarget(self, action: #selector(ViewController.segmentedDidChange(_:)), for: .valueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        drop.resignFirstResponder()
    }
    
    func segmentedDidChange(_ sender: UISegmentedControl) {
    
        let index = sender.selectedSegmentIndex
        drop.animationType = UIDropDownAnimationType(rawValue: index)!
    }
    
    // UIDropDown Delegate
    
    func dropDown(_ dropDown: UIDropDown, didSelectOption option: String, atIndex index: Int) {
        print("Selected option: \(option) at index: \(index)")
    }
}

