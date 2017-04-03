//
//  DecimalTransCore.swift
//  HexConverter
//
//  Created by lip on 17/1/14.
//  Copyright © 2017年 lip. All rights reserved.
//

import Foundation

//FIXME: - 由于先转二进制然后调用二进制算法算其它进制，导致十六进制小数始终只有4位（穿过去的二进制位16位），后续显示和后台计算可以分开

//MARK: - 10进制转换算法
func decimalTransCore(decimal:String,targethex:Int)->String?{
    
    // 分割小数部分和整数部分
    let array = decimal.components(separatedBy: ".")
    let integerPart = array[0]
    var pointPart:String?
    if array.count == 2 {
        pointPart = array[1]
    }
    
    // 转换为二进制
    let integerbinary = integerDecimalToBinary(dicimal: integerPart) ?? ""
    let doublebinary = doubleDecimalToBinary(decimal: pointPart) ?? ""
    let showdoublebinary = doubleDecimalToBinary(decimal: pointPart, show: true) ?? ""
    let binary = integerbinary + doublebinary
    let showbinary = integerbinary + showdoublebinary
    
    switch targethex {
    case 2:
        return showbinary
    case 8:
        return binaryTransCore(binary: binary, targethex: 8)
    case 10:
        return decimal
    case 16:
        return binaryTransCore(binary: binary, targethex: 16)
    default:
        return "--"
    }
    
}


/// 小数部分转二进制
///
/// - Parameters:
///   - decimal: 十进制小数部分 没有0和小数点
///   - show: 用于显示还是用于计算
/// - Returns: 转换结果
func doubleDecimalToBinary(decimal:String?,show:Bool=false)->String?{
    
    guard let decimal = decimal else {
        return nil
    }
    let doublepartstr = "0." + decimal
    var doublepart = (doublepartstr as NSString).doubleValue
    var result = "."
    let times = show ? 16 : 32
    
    for _ in 0..<times{
        
        doublepart *= 2
        let b = Int(doublepart)
        doublepart = doublepart - Double(b)
        result += b.description
        
    }
    
    return result
}

// MARK: - 整数部分转二进制
func integerDecimalToBinary(dicimal:String)->String?{
    
    guard let num = Int(dicimal) else{
        return nil
    }
    
    return String.init(num, radix: 2)
}
