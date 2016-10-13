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
        
        drop = UIDropDown(frame: CGRect(x: 85, y: 270, width: 150, height: 30))
        drop.delegate = self
        drop.placeholder = "Select a country..."
        drop.options = ["Mexico", "USA", "England", "France", "Germany", "Spain", "Italy", "Canada"]
        
        drop.didSelect { (option, index) in
            print("Option: \(option) @ index: \(index)")
        }
        
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

