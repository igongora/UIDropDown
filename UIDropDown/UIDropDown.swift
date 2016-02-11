//
//  UIDropDown.swift
//  UIDropDown
//
//  Created by Isaac Gongora on 13/11/15.
//  Copyright © 2015 Isaac Gongora. All rights reserved.
//

import UIKit

enum UIDropDownAnimationType : Int {
    case Default
    case Bouncing
}

@objc protocol UIDropDownDelegate {
    func dropDown(dropDown: UIDropDown, didSelectOption option: String, atIndex index: Int)
    optional func dropDownTableWillAppear(dropDown: UIDropDown)
    optional func dropDownTableDidAppear(dropDown: UIDropDown)
    optional func dropDownTableWillDisappear(dropDown: UIDropDown)
    optional func dropDownTableDidDisappear(dropDown: UIDropDown)
}

class UIDropDown: UIControl, UITableViewDataSource, UITableViewDelegate {
    
    private var title: UILabel!
    private var arrow: UILabel!
    private var table: UITableView!
    var selectedIndex: Int?
    var font: UIFont! {
        didSet {
            title.font = font
        }
    }
    var options = NSMutableArray()
    var delegate: UIDropDownDelegate!
    var animationType: UIDropDownAnimationType = .Default
    var hideOptionsWhenSelect = false
    var placeholder: String! {
        didSet {
            title.text = placeholder
            title.adjustsFontSizeToFitWidth = true
        }
    }
    override var tintColor: UIColor! {
        didSet {
            title.textColor = tintColor
            arrow.textColor = tintColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    func setup() {
    
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.backgroundColor = .whiteColor()
        
        title = UILabel(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(self.frame)-30, height: CGRectGetHeight(self.frame)))
        title.textAlignment = .Center
        title.backgroundColor = .clearColor()
        title.font = font
        self.addSubview(title)
        
        arrow = UILabel(frame: CGRect(x: CGRectGetMaxX(title.frame), y: 0, width: 30, height: CGRectGetHeight(self.frame)))
        arrow.textAlignment = .Center
        arrow.font = UIFont.ioniconOfSize(20)
        arrow.text = String.ioniconWithName(.IosArrowDown)
        arrow.backgroundColor = .clearColor()
        self.addSubview(arrow)
        self.addTarget(self, action: "touch", forControlEvents: .TouchUpInside)
    }
    
    func touch() {
    
        selected = !selected
        self.userInteractionEnabled = false
        selected ? showTable() : hideTable()
    }
    
    override func resignFirstResponder() -> Bool {
        
        if selected {
            hideTable()
        }
        
        return true
    }
    
    func showTable() {
        
        delegate.dropDownTableWillAppear?(self)
        
        table = UITableView(frame: CGRect(x: CGRectGetMinX(self.frame), y: CGRectGetMinY(self.frame), width: CGRectGetWidth(self.frame), height: CGRectGetHeight(self.frame)))
        table.dataSource = self
        table.delegate = self
        table.layer.cornerRadius = 5.0
        table.layer.borderWidth = 1.0
        table.layer.borderColor = UIColor.blackColor().CGColor
        table.alpha = 0
        self.superview?.insertSubview(table, belowSubview: self)
        
        UIView.animateWithDuration(0.2) { () -> Void in
            self.arrow.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
        }
        
        switch animationType {
        
        case .Default:
            
            UIView.animateWithDuration(0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .TransitionFlipFromTop, animations: { () -> Void in
                
                self.table.frame = CGRect(x: CGRectGetMinX(self.frame), y: CGRectGetMaxY(self.frame)+5, width: CGRectGetWidth(self.frame), height: 100)
                self.table.alpha = 1
                
                }, completion: { (didFinish) -> Void in
                    self.userInteractionEnabled = true
                    self.delegate.dropDownTableDidAppear?(self)
            })
            
            break
            
        case .Bouncing:
            
            table.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001)
            
            UIView.animateWithDuration(0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .TransitionCurlUp, animations: { () -> Void in
                
                self.table.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1)
                self.table.frame = CGRect(x: CGRectGetMinX(self.frame), y: CGRectGetMaxY(self.frame)+5, width: CGRectGetWidth(self.frame), height: 100)
                self.table.alpha = 1
                
                }, completion: { (didFinish) -> Void in
                    self.userInteractionEnabled = true
                    self.delegate.dropDownTableDidAppear?(self)
            })
            
            break
        }
    }
    
    func hideTable() {
        
        delegate.dropDownTableWillDisappear?(self)
        
        UIView.animateWithDuration(0.2) { () -> Void in
            self.arrow.transform = CGAffineTransformMakeRotation(0)
        }
        
        switch animationType {
        
        case .Default:
            
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .TransitionFlipFromBottom, animations: { () -> Void in
                
                self.table.frame = CGRect(x: CGRectGetMinX(self.frame), y: CGRectGetMinY(self.frame), width: CGRectGetWidth(self.frame), height: 0)
                self.table.alpha = 0
                
                }, completion: { (didFinish) -> Void in
                    
                    self.table.removeFromSuperview()
                    self.userInteractionEnabled = true
                    self.selected = false
                    self.delegate.dropDownTableDidDisappear?(self)
            })
            
            break
            
        case .Bouncing:
            
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .TransitionCurlUp, animations: { () -> Void in
                
                self.table.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001)
                self.table.center = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMinY(self.frame))
                self.table.alpha = 0
                
                }, completion: { (didFinish) -> Void in
                    
                    self.table.removeFromSuperview()
                    self.userInteractionEnabled = true
                    self.selected = false
                    self.delegate.dropDownTableDidDisappear?(self)
            })
            
            break
        }
    }
    
    // UITableView DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "UIDropDownCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        
        cell?.textLabel?.font = font
        cell?.textLabel?.text = "\(options[indexPath.row])"
        cell?.accessoryType = indexPath.row == selectedIndex ? .Checkmark : .None
        cell?.selectionStyle = .None
        
        return cell!
    }
    
    // UITableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedIndex = indexPath.row
        
        delegate.dropDown(self, didSelectOption: "\(options[indexPath.row])", atIndex: indexPath.row)
        
        title.alpha = 0.0
        title.text = "\(self.options[indexPath.row])"
        
        UIView.animateWithDuration(0.6) { () -> Void in
            self.title.alpha = 1.0
        }
        
        tableView.reloadData()
        
        if hideOptionsWhenSelect {
            hideTable()
        }
    }
}
