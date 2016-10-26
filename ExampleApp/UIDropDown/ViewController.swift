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
        
        drop = UIDropDown(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        drop.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        drop.placeholder = "Select your country..."
        drop.options = ["Mexico", "USA", "England", "France", "Germany", "Spain", "Italy", "Canada"]
        drop.didSelect { (option, index) in
            self.label.text = "You just select \(option) at index: \(index)"
            print("You just select: \(option) at index: \(index)")
        }
        self.view.addSubview(drop)
                    
        segmented.addTarget(self, action: #selector(ViewController.segmentedDidChange(_:)), for: .valueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func segmentedDidChange(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        drop.animationType = UIDropDownAnimationType(rawValue: index)!
    }
}

