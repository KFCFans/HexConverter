//
//  SixteenInputView.swift
//  HexConverter
//
//  Created by lip on 17/1/14.
//  Copyright © 2017年 lip. All rights reserved.
//

import UIKit

@objc protocol SixteenInputViewDelegate:NSObjectProtocol{
    
    func sixteenInputViewDidTouchKeyBoard(inputview:SixteenInputView,target:Int)
    
}

class SixteenInputView: UIView {

    weak var delegate:SixteenInputViewDelegate?
    
    class func sixteenInputView()->SixteenInputView{
        
        let nib = UINib(nibName: "SixteenInputView", bundle: nil)
        
        let view = nib.instantiate(withOwner: nil, options: nil)[0] as! SixteenInputView
        
        return view
        
    }
    

    
    /**
     Target
     0～15 对应数字输入 0～F
     16 小数点
     17 清空
     18 回退
    */
    @IBAction func didTouchKeyBoard(_ sender: UIButton) {
        delegate?.sixteenInputViewDidTouchKeyBoard(inputview: self, target: sender.tag)
    }
}
