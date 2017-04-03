//
//  DecimalTrans.swift
//  HexConverter
//
//  Created by lip on 17/1/12.
//  Copyright © 2017年 lip. All rights reserved.
//

import UIKit

class DecimalTrans: HexTransView {


    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = textField.text ?? "0"
        switch string {
        case ".":
            if text.contains(".") {
                return false
            }
            return true
        default:
            return true
        }
    }
    
    
    // 重写父类监听方法
    override func textFieldValueChange(tf: UITextField) {
        super.textFieldValueChange(tf: tf)
        
        let text = tf.text ?? "--"
        if text != "" {
            decimalRes = text
            binaryRes = decimalTransCore(decimal: text, targethex: 2) ?? "--"
            octalRes = decimalTransCore(decimal: text, targethex: 8) ?? "--"
            sixteenRes = decimalTransCore(decimal: text, targethex: 16) ?? "--"
            tableView?.reloadData()
        }
    }
}


