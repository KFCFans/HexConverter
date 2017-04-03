//
//  OctTrans.swift
//  HexConverter
//
//  Created by lip on 17/1/12.
//  Copyright © 2017年 lip. All rights reserved.
//

import UIKit

class OctTrans: HexTransView {

    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text ?? "0"
        
        switch string {
        case "8","9":
            return false
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
            octalRes = text
            binaryRes = octTransCore(oct: text, targethex: 2)
            decimalRes = octTransCore(oct: text, targethex: 10)
            sixteenRes = octTransCore(oct: text, targethex: 16)
            tableView?.reloadData()
        }
    }

}
