//
//  BinaryTrans.swift
//  HexConverter
//
//  Created by lip on 17/1/12.
//  Copyright © 2017年 lip. All rights reserved.
//

import UIKit

class BinaryTrans: HexTransView {
    

    // 重写父类输入判断代理方法
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text ?? "0"
        
        switch string {
        case "2","3","4","5","6","7","8","9":
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
        
        guard let text = tf.text else{
            return
        }
        if text != "" {
            binaryRes = text
            octalRes = binaryTransCore(binary: text, targethex: 8)
            decimalRes = binaryTransCore(binary: text, targethex: 10)
            sixteenRes = binaryTransCore(binary: text, targethex: 16)
            tableView?.reloadData()
        }

    }

}
