//
//  TestViewController.swift
//  HexConverter
//
//  Created by lip on 17/1/11.
//  Copyright © 2017年 lip. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    let bryview = BinaryTrans()
    let octview = OctTrans()
    let decview = DecimalTrans()
    let stnview = SixteenTrans()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}

// MARK: - 设置 UI
extension TestViewController{
    
    fileprivate func setupUI(){
        
        

        view.backgroundColor = #colorLiteral(red: 0.9374967217, green: 0.9318452477, blue: 0.9531703591, alpha: 1)
        let hexArr = ["二进制","八进制","十进制","十六进制"]
        let segmentedControl = UISegmentedControl(items: hexArr)
        
        
        // 设置分段选择控件的默认选中
        segmentedControl.selectedSegmentIndex = 0
        
        view.addSubview(segmentedControl)
        
        // 添加分段选择控件监听
        segmentedControl.addTarget(self, action: #selector(segmentedValueChange), for: .valueChanged)
        
        // 添加4个进制转换视图
        view.addSubview(octview)
        view.addSubview(decview)
        view.addSubview(stnview)
        view.addSubview(bryview)
        
        
        // 4个进制转换view的自动布局
        batchAutoLayout(v: bryview, view: view, segmentedControl: segmentedControl)
        batchAutoLayout(v: octview, view: view, segmentedControl: segmentedControl)
        batchAutoLayout(v: decview, view: view, segmentedControl: segmentedControl)
        batchAutoLayout(v: stnview, view: view, segmentedControl: segmentedControl)
        
        // 分段选择控件的自动布局
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.addConstraint(NSLayoutConstraint(item: segmentedControl,
                                                          attribute: .height,
                                                          relatedBy: .equal,
                                                          toItem: nil,
                                                          attribute: .notAnAttribute,
                                                          multiplier: 1.0,
                                                          constant: 30))
        
        view.addConstraint(NSLayoutConstraint(item: segmentedControl,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: self.view,
                                              attribute: .left,
                                              multiplier: 1.0,
                                              constant: 10))
        
        view.addConstraint(NSLayoutConstraint(item: segmentedControl,
                                              attribute: .right,
                                              relatedBy: .equal,
                                              toItem: self.view,
                                              attribute: .right,
                                              multiplier: 1.0,
                                              constant: -10))
        
        view.addConstraint(NSLayoutConstraint(item: segmentedControl,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: self.view,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: 44))
        
        

    }
    
    func batchAutoLayout(v:UIView,view:UIView,segmentedControl:UISegmentedControl){
        
        v.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: v,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: segmentedControl,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: 12))
        
        view.addConstraint(NSLayoutConstraint(item: v,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: self.view,
                                              attribute: .left,
                                              multiplier: 1.0,
                                              constant: 0))
        view.addConstraint(NSLayoutConstraint(item: v,
                                              attribute: .right,
                                              relatedBy: .equal,
                                              toItem: self.view,
                                              attribute: .right,
                                              multiplier: 1.0,
                                              constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: v,
                                              attribute: .bottom,
                                              relatedBy: .greaterThanOrEqual,
                                              toItem: self.view,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: 0))
     
        // 二进制页面为默认
        bryview.textField?.becomeFirstResponder()

    }
}

// MARK: - 监听方法
extension TestViewController{
    
    @objc fileprivate func segmentedValueChange(segment:UISegmentedControl){
        
        let index = segment.selectedSegmentIndex
        let option = segment.titleForSegment(at: index)
        guard let switchOption = option else {
            return
        }
        switch switchOption {
        case "二进制":
            view.bringSubview(toFront: bryview)
            bryview.textField?.becomeFirstResponder()
            break
        case "八进制":
            view.bringSubview(toFront: octview)
            octview.textField?.becomeFirstResponder()
            break
        case "十进制":
            view.bringSubview(toFront: decview)
            decview.textField?.becomeFirstResponder()
            break
        case "十六进制":
            view.bringSubview(toFront: stnview)
            stnview.textField?.becomeFirstResponder()
            break
        default:
            view.bringSubview(toFront: bryview)
            break
        }
    }
}
