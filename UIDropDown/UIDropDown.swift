//
//  UIDropDown.swift
//  UIDropDown
//
//  Created by Isaac Gongora on 13/11/15.
//  Copyright © 2015 Isaac Gongora. All rights reserved.
//

import UIKit

enum UIDropDownAnimationType : Int {
    case `default`
    case bouncing
}

@objc protocol UIDropDownDelegate {
    func dropDown(_ dropDown: UIDropDown, didSelectOption option: String, atIndex index: Int)
    @objc optional func dropDownTableWillAppear(_ dropDown: UIDropDown)
    @objc optional func dropDownTableDidAppear(_ dropDown: UIDropDown)
    @objc optional func dropDownTableWillDisappear(_ dropDown: UIDropDown)
    @objc optional func dropDownTableDidDisappear(_ dropDown: UIDropDown)
}

class UIDropDown: UIControl, UITableViewDataSource, UITableViewDelegate {
    
    fileprivate var title: UILabel!
    fileprivate var arrow: UILabel!
    fileprivate var table: UITableView!
    var selectedIndex: Int?
    var font: UIFont! {
        didSet {
            title.font = font
        }
    }
    var options = NSMutableArray()
    var delegate: UIDropDownDelegate!
    var animationType: UIDropDownAnimationType = .default
    var hideOptionsWhenSelect = false
    var tableHeight:CGFloat = 100
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
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .white
        
        title = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width-30, height: self.frame.height))
        title.textAlignment = .center
        title.backgroundColor = .clear
        title.font = font
        self.addSubview(title)
        
        arrow = UILabel(frame: CGRect(x: title.frame.maxX, y: 0, width: 30, height: self.frame.height))
        arrow.textAlignment = .center
        arrow.font = UIFont.ioniconOfSize(20)
        arrow.text = String.ioniconWithName(.IosArrowDown)
        arrow.backgroundColor = .clear
        self.addSubview(arrow)
        self.addTarget(self, action: #selector(UIDropDown.touch), for: .touchUpInside)
    }
    
    func touch() {
    
        isSelected = !isSelected
        self.isUserInteractionEnabled = false
        isSelected ? showTable() : hideTable()
    }
    @discardableResult
    override func resignFirstResponder() -> Bool {
        
        if isSelected {
            hideTable()
        }
        
        return true
    }
    
    func showTable() {
        
        delegate.dropDownTableWillAppear?(self)
        
        table = UITableView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height))
        table.dataSource = self
        table.delegate = self
        table.layer.cornerRadius = 5.0
        table.layer.borderWidth = 1.0
        table.layer.borderColor = UIColor.black.cgColor
        table.alpha = 0
        self.superview?.insertSubview(table, belowSubview: self)
        
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.arrow.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(M_PI)) / 180.0)
        }) 
        
        switch animationType {
        
        case .default:
            
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .transitionFlipFromTop, animations: { () -> Void in
                
                self.table.frame = CGRect(x: self.frame.minX, y: self.frame.maxY+5, width: self.frame.width, height: self.tableHeight)
                self.table.alpha = 1
                
                }, completion: { (didFinish) -> Void in
                    self.isUserInteractionEnabled = true
                    self.delegate.dropDownTableDidAppear?(self)
            })
            
            break
            
        case .bouncing:
            
            table.transform = CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
            
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .transitionCurlUp, animations: { () -> Void in
                
                self.table.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
                self.table.frame = CGRect(x: self.frame.minX, y: self.frame.maxY+5, width: self.frame.width, height: self.tableHeight)
                self.table.alpha = 1
                
                }, completion: { (didFinish) -> Void in
                    self.isUserInteractionEnabled = true
                    self.delegate.dropDownTableDidAppear?(self)
            })
            
            break
        }
    }
    
    func hideTable() {
        
        delegate.dropDownTableWillDisappear?(self)
        
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.arrow.transform = CGAffineTransform(rotationAngle: 0)
        }) 
        
        switch animationType {
        
        case .default:
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .transitionFlipFromBottom, animations: { () -> Void in
                
                self.table.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: 0)
                self.table.alpha = 0
                
                }, completion: { (didFinish) -> Void in
                    
                    self.table.removeFromSuperview()
                    self.isUserInteractionEnabled = true
                    self.isSelected = false
                    self.delegate.dropDownTableDidDisappear?(self)
            })
            
            break
            
        case .bouncing:
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .transitionCurlUp, animations: { () -> Void in
                
                self.table.transform = CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
                self.table.center = CGPoint(x: self.frame.midX, y: self.frame.minY)
                self.table.alpha = 0
                
                }, completion: { (didFinish) -> Void in
                    
                    self.table.removeFromSuperview()
                    self.isUserInteractionEnabled = true
                    self.isSelected = false
                    self.delegate.dropDownTableDidDisappear?(self)
            })
            
            break
        }
    }
    
    // UITableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "UIDropDownCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        cell?.textLabel?.font = font
        cell?.textLabel?.text = "\(options[(indexPath as NSIndexPath).row])"
        cell?.accessoryType = (indexPath as NSIndexPath).row == selectedIndex ? .checkmark : .none
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    // UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = (indexPath as NSIndexPath).row
        
        delegate.dropDown(self, didSelectOption: "\(options[(indexPath as NSIndexPath).row])", atIndex: (indexPath as NSIndexPath).row)
        
        title.alpha = 0.0
        title.text = "\(self.options[(indexPath as NSIndexPath).row])"
        
        UIView.animate(withDuration: 0.6, animations: { () -> Void in
            self.title.alpha = 1.0
        }) 
        
        tableView.reloadData()
        
        if hideOptionsWhenSelect {
            hideTable()
        }
    }
}
