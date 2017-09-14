//
//  SegmentedControl.swift
//  WorldTrotter
//
//  Created by Mark Engen on 9/13/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit
//we called it SegmentedControl and it inherits properties from UIControl
@IBDesignable class SegmentedControl: UIControl {
    fileprivate var labels = [UILabel]()
    var thumbView = UIView()
    
    var items:[String] = ["Item 1", "Item 2", "Item 3"] {
        didSet {
            setupLabels()
        }
    }

    var selectedIndex: Int = 0 {
        didSet {
            displayNewSelectedIndex()
        }
    }
    
    func setupView() {
        layer.cornerRadius = frame.height / 2
        layer.borderColor = UIColor(white: 1.0, alpha: 0.5).cgColor
        layer.borderWidth = 2
        
        backgroundColor = UIColor.clear
        
        setupLabels()
        insertSubview(thumbView, at: 0)
        
    }
    
    override init(_: (CGRect ))

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabels() {
        for label in labels {
            label.removeFromSuperview()
            
        }
        
        labels .removeAll(keepingCapacity: true)
        
        for index in 1...items.count {
            let label = UILabel(frame: CGRect.zero)
            label.text = items[index - 1]
            label.textAlignment = .center
            label.textColor = UIColor(white: 0.5, alpha: 1.0)
            self.addSubview(label)
            labels.append(label)
        }
    }
        
    func displayNewSelectedIndex() {
        let label = labels[selectedIndex]
        self.thumbView.frame = label.frame
    }
}
