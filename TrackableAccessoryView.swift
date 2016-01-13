//
//  ATrickyView.swift
//  CustomMessengerWorkout
//
//  Created by David on 2016/1/13.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

class ATrickyView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var isObserverAdded = false
    var pointer: UnsafeMutablePointer<Void> = UnsafeMutablePointer<Void>()
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.mainScreen().bounds
        self.frame.size.height = 50
        self.backgroundColor = UIColor.greenColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        
        if isObserverAdded {
            self.superview?.removeObserver(self, forKeyPath: "center", context: pointer)
            self.superview?.removeObserver(self, forKeyPath: "frame", context: pointer)
        }
        
        newSuperview?.addObserver(self, forKeyPath: "center", options: NSKeyValueObservingOptions.init(rawValue: 0), context: pointer)
        newSuperview?.addObserver(self, forKeyPath: "frame", options: NSKeyValueObservingOptions.init(rawValue: 0), context: pointer)
        isObserverAdded = true
        
        print(newSuperview)
        super.willMoveToSuperview(newSuperview)
    }
    
    deinit {
        if isObserverAdded {
            self.superview?.removeObserver(self, forKeyPath: "frame", context: pointer)
            self.superview?.removeObserver(self, forKeyPath: "center", context: pointer)
            print("deinit")
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        print("something")
    }
    
    
}