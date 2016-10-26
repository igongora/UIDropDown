//
//  UIDropDown.swift
//  UIDropDown
//
//  Created by Isaac Gongora on 13/11/15.
//  Copyright © 2015 Isaac Gongora. All rights reserved.
//

import UIKit

public enum UIDropDownAnimationType: Int {
    case Default
    case Bouncing
    case Classic
}

public class UIDropDown: UIControl {
    
    fileprivate var title: UILabel!
    fileprivate var arrow: Arrow!
    fileprivate var table: UITableView!
    
    public fileprivate(set) var selectedIndex: Int?
    public var options = [String]()
    public var hideOptionsWhenSelect = false
    public var placeholder: String! {
        didSet {
            title.text = placeholder
            title.adjustsFontSizeToFitWidth = true
        }
    }
    public var tint: UIColor? {
        didSet {
            title.textColor = textColor ?? tint
            arrow.backgroundColor = tint
        }
    }
    public var arrowPadding: CGFloat = 7.0 {
        didSet{
            let size = arrow.superview!.frame.size.width-(arrowPadding*2)
            arrow.frame = CGRect(x: arrowPadding, y: arrowPadding, width: size, height: size)
        }
    }
    
    // Text
    public var font: String? {
        didSet {
            title.font = UIFont(name: font!, size: fontSize)
        }
    }
    public var fontSize: CGFloat = 17.0 {
        didSet{
            title.font = title.font.withSize(fontSize)
        }
    }
    public var textColor: UIColor? {
        didSet{
            title.textColor = textColor
        }
    }
    public var textAlignment: NSTextAlignment? {
        didSet{
            title.textAlignment = textAlignment!
        }
    }
    
    public var optionsFont: String?
    public var optionsSize: CGFloat = 17.0
    public var optionsTextColor: UIColor?
    public var optionsTextAlignment: NSTextAlignment?
    
    // Border
    public var cornerRadius: CGFloat = 3.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    public var borderWidth: CGFloat = 0.5 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    public var borderColor: UIColor = .black {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    public var optionsCornerRadius: CGFloat = 3.0 {
        didSet{
            table.layer.cornerRadius = optionsCornerRadius
        }
    }
    public var optionsBorderWidth: CGFloat = 0.5 {
        didSet{
            table.layer.borderWidth = optionsBorderWidth
        }
    }
    public var optionsBorderColor: UIColor = .black {
        didSet{
            table.layer.borderColor = optionsBorderColor.cgColor
        }
    }
    
    // Table Configurations
    public var animationType: UIDropDownAnimationType = .Default
    public var tableHeight: CGFloat = 100.0
    public var rowHeight: CGFloat?
    public var rowBackgroundColor: UIColor?
    
    // Closures
    fileprivate var privatedidSelect: (String, Int) -> () = {option, index in }
    fileprivate var privateTableWillAppear: () -> () = { }
    fileprivate var privateTableDidAppear: () -> () = { }
    fileprivate var privateTableWillDisappear: () -> () = { }
    fileprivate var privateTableDidDisappear: () -> () = { }
    
    // Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    // Class methods
    public func resign() -> Bool {
        if isSelected {
            hideTable()
        }
        return true
    }
    
    fileprivate func setup() {
        
        title = UILabel(frame: CGRect(x: 0,
                                      y: 0,
                                      width: (self.frame.width-self.frame.height),
                                      height: self.frame.height))
        title.textAlignment = .center
        self.addSubview(title)
        
        let arrowContainer = UIView(frame: CGRect(x: title.frame.maxX,
                                                  y: 0,
                                                  width: title.frame.height,
                                                  height: title.frame.height))
        arrowContainer.isUserInteractionEnabled = false
        self.addSubview(arrowContainer)
        
        arrow = Arrow(origin: CGPoint(x: arrowPadding,
                                      y: arrowPadding),
                      size: arrowContainer.frame.width-(arrowPadding*2))
        arrow.backgroundColor = .black
        arrowContainer.addSubview(arrow)
        
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.addTarget(self, action: #selector(touch), for: .touchUpInside)
    }
    
    @objc fileprivate func touch() {
        isSelected = !isSelected
        isSelected ? showTable() : hideTable()
    }
    
    fileprivate func showTable() {
        
        privateTableWillAppear()
        
        table = UITableView(frame: CGRect(x: self.frame.minX,
                                          y: self.frame.minY,
                                          width: self.frame.width,
                                          height: self.frame.height))
        table.dataSource = self
        table.delegate = self
        table.alpha = 0
        table.layer.cornerRadius = optionsCornerRadius
        table.layer.borderWidth = optionsBorderWidth
        table.layer.borderColor = optionsBorderColor.cgColor
        table.rowHeight = rowHeight ?? table.rowHeight
        self.superview?.insertSubview(table, belowSubview: self)
        
        switch animationType {
        case .Default:
            UIView.animate(withDuration: 0.9,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.1,
                           options: .curveEaseInOut,
                           animations: { () -> Void in
                            
                            self.table.frame = CGRect(x: self.frame.minX,
                                                      y: self.frame.maxY+5,
                                                      width: self.frame.width,
                                                      height: self.tableHeight)
                            self.table.alpha = 1
                            
                            self.arrow.position = .up
                            
                },
                           completion: { (didFinish) -> Void in
                            self.privateTableDidAppear()
            })
        case .Bouncing:
            table.transform = CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
            
            UIView.animate(withDuration: 0.9,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.1,
                           options: .curveEaseInOut,
                           animations: { () -> Void in
                            
                            self.table.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
                            self.table.frame = CGRect(x: self.frame.minX,
                                                      y: self.frame.maxY+5,
                                                      width: self.frame.width,
                                                      height: self.tableHeight)
                            self.table.alpha = 1
                            
                            self.arrow.position = .up
                            
                },
                           completion: { (didFinish) -> Void in
                            self.privateTableDidAppear()
            })
        case .Classic:
            
            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0.5,
                           options: .curveEaseInOut, animations: {
                            
                            self.table.frame = CGRect(x: self.frame.minX,
                                                      y: self.frame.maxY+5,
                                                      width: self.frame.width,
                                                      height: self.tableHeight)
                            self.table.alpha = 1
                            
                            self.arrow.position = .up
                            
                }, completion: { (finished) in
                    self.privateTableDidAppear()
            })
        }
    }
    
    fileprivate func hideTable() {
        
        privateTableWillDisappear()
        
        switch self.animationType {
        case .Default, .Classic:
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 0.9,
                           initialSpringVelocity: 0.1,
                           options: .curveEaseInOut,
                           animations: { () -> Void in
                            self.table.frame = CGRect(x: self.frame.minX,
                                                      y: self.frame.minY,
                                                      width: self.frame.width,
                                                      height: 0)
                            self.table.alpha = 0
                            
                            self.arrow.position = .down
                },
                           completion: { (didFinish) -> Void in
                            self.table.removeFromSuperview()
                            self.isSelected = false
                            self.privateTableDidDisappear()
            })
            
        case .Bouncing:
            
            UIView.animate(withDuration: 0.9,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0.1,
                           options: .curveEaseInOut,
                           animations: { () -> Void in
                            
                            self.table.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                            self.table.center = CGPoint(x: self.frame.midX, y: self.frame.minY)
                            self.table.alpha = 0
                            
                            self.arrow.position = .down
                },
                           completion: { (didFinish) -> Void in
                            self.table.removeFromSuperview()
                            self.isSelected = false
                            self.privateTableDidDisappear()
            })
        }
    }
    
    // Actions Methods
    public func didSelect(completion: @escaping (_ option: String, _ index: Int) -> ()) {
        privatedidSelect = completion
    }
    
    public func tableWillAppear(completion: @escaping () -> ()) {
        privateTableWillAppear = completion
    }
    
    public func tableDidAppear(completion: @escaping () -> ()) {
        privateTableDidAppear = completion
    }
    
    public func tableWillDisappear(completion: @escaping () -> ()) {
        privateTableWillDisappear = completion
    }
    
    public func tableDidDisappear(completion: @escaping () -> ()) {
        privateTableDidDisappear = completion
    }
}

extension UIDropDown: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "UIDropDownCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        if rowBackgroundColor != nil {
            cell!.contentView.backgroundColor = rowBackgroundColor
        }
        
        cell!.textLabel!.font = UIFont(name: optionsFont ?? font ?? cell!.textLabel!.font.fontName, size: optionsSize)
        cell!.textLabel!.textColor = optionsTextColor ?? tint ?? cell!.textLabel!.textColor
        cell!.textLabel!.textAlignment = optionsTextAlignment ?? cell!.textLabel!.textAlignment
        cell!.textLabel!.text = "\(options[indexPath.row])"
        cell!.accessoryType = indexPath.row == selectedIndex ? .checkmark : .none
        cell!.selectionStyle = .none
        
        return cell!
    }
}

extension UIDropDown: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = (indexPath as NSIndexPath).row
        
        title.alpha = 0.0
        title.text = "\(self.options[(indexPath as NSIndexPath).row])"
        
        UIView.animate(withDuration: 0.6,
                       animations: { () -> Void in
                        self.title.alpha = 1.0
        })
        
        tableView.reloadData()
        
        if hideOptionsWhenSelect {
            hideTable()
        }
        
        privatedidSelect("\(self.options[indexPath.row])", selectedIndex!)
    }
}

// Arrow

enum Position {
    case left
    case down
    case right
    case up
}

class Arrow: UIView {
    
    var position: Position = .down {
        didSet{
            switch position {
            case .left:
                self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
                break
                
            case .down:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
                break
                
            case .right:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                break
                
            case .up:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                break
            }
        }
    }
    
    init(origin: CGPoint, size: CGFloat) {
        super.init(frame: CGRect(x: origin.x, y: origin.y, width: size, height: size))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        // Get size
        let size = self.layer.frame.width
        
        // Create path
        let bezierPath = UIBezierPath()
        
        // Draw points
        let qSize = size/4
        
        bezierPath.move(to: CGPoint(x: 0, y: qSize))
        bezierPath.addLine(to: CGPoint(x: size, y: qSize))
        bezierPath.addLine(to: CGPoint(x: size/2, y: qSize*3))
        bezierPath.addLine(to: CGPoint(x: 0, y: qSize))
        bezierPath.close()
        
        // Mask to path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
}
