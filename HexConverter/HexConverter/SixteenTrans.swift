//
//  SixteenTrans.swift
//  HexConverter
//
//  Created by lip on 17/1/12.
//  Copyright © 2017年 lip. All rights reserved.
//

import UIKit

class SixteenTrans: HexTransView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupKeyBoard()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupKeyBoard(){
        
        let v = SixteenInputView.sixteenInputView()
        
        v.delegate = self

        textField?.inputView = v
    }
    
}


// MARK: - 实现代理方法（代理传值）
extension HexTransView:SixteenInputViewDelegate{
    
    func sixteenInputViewDidTouchKeyBoard(inputview: SixteenInputView, target: Int) {
        
        if target < 17 {
            let char = sixteencharChanger(num: target)
            textField?.text?.append(char)
        }
        else if target == 17{
            textField?.text = nil
        }
        else if target == 18{
            textField?.deleteBackward()
        }
        

        // 自定义键盘后原来对键盘的监听失效，故只能写在这里
        let text = textField?.text ?? "--"
        if text != "" {
            sixteenRes = text
            print(sixteenRes)
            binaryRes = sixteenTransCore(stn: text, targethex: 2) ?? "--"
            octalRes = sixteenTransCore(stn: text, targethex: 8) ?? "--"
            decimalRes = sixteenTransCore(stn: text, targethex: 10) ?? "--"
            tableView?.reloadData()
        }
        
    }

}
