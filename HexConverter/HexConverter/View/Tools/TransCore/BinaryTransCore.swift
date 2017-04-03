//
//  BinaryTransCore.swift
//  HexConverter
//
//  Created by lip on 17/1/14.
//  Copyright © 2017年 lip. All rights reserved.
//

import Foundation


// MARK: - 进制转化主函数
func binaryTransCore(binary:String,targethex:Int)->String{
    
    
    // 分割小数部分和整数部分
    let array = binary.components(separatedBy: ".")
    let intergerPart = array[0]
    var pointPart:String?
    if array.count == 2 {
        pointPart = array[1]
    }
    
    // 进制选择
    switch targethex {
    case 8:
        return binaryTrans(intbinary: intergerPart, doublebinary: pointPart, divisor: 3)
    case 16:
        return binaryTrans(intbinary: intergerPart, doublebinary: pointPart, divisor: 4)
    case 10:
        return binaryToDecimal(intbinary: intergerPart, doublebinary: pointPart)
    default:
        return "ERROR"
    }
    
}

// MARK: - 二进制转 8/16 进制
func binaryTrans(intbinary:String,doublebinary:String?,divisor:Int)->String{
    
    // 分别转换整数和小数部分
    let intergerRes = intergerTrans(binary: intbinary, divisor: divisor)
    let decimalRes = decimalTrans(binary: doublebinary, divisor: divisor)
    
    // 合并
    let result = intergerRes + (decimalRes ?? "")
    
    return result
    
}

// MARK: - 8/16 求整数部分
func intergerTrans(binary:String,divisor:Int)->String{
    
    
    // 结果进制
    var result:String = ""
    
    var count = 0
    var multiplier = 1
    var temp = 0
    
    for c in binary.characters.enumerated().reversed() {
        
        let n = Int(c.element.description)
        guard let num = n else{
            continue
        }
        
        temp += multiplier * num
        multiplier *= 2
        count += 1
        
        if count == divisor || c.offset == 0 {
            result.insert(Character.init(sixteencharChanger(num: temp)), at: result.startIndex)
            count = 0
            multiplier = 1
            temp = 0
        }
    }
    return result
}

// MARK: - 8/16 小数部分
func decimalTrans(binary:String?,divisor:Int)->String?{
    
    guard let binary = binary else{
        return nil
    }
    
    // 结果进制
    var result:String = "."
    
    var count = 0
    var multiplier = divisor == 3 ? 4 : 8
    var temp = 0
    
    for c in binary.characters.enumerated() {
        
        let n = Int(c.element.description)
        guard let num = n else{
            continue
        }
        
        temp += multiplier * num
        multiplier = multiplier / 2
        count += 1
        
        if count == divisor || c.offset == binary.characters.count - 1 {
            result.append(sixteencharChanger(num: temp))
            count = 0
            multiplier = divisor == 3 ? 4 : 8
            temp = 0
        }
    }
    return result
    
}

//MRAK: - 二进制转十进制
func binaryToDecimal(intbinary:String,doublebinary:String?)->String{
    
    let intres = integerBinaryToDecimal(binary: intbinary)
    
    let doubleres = doubleBinaryToDecimal(binary: doublebinary)
    
    let result = doubleres == nil ? intres : intres + doubleres!
    
    return result
}


// MARK: - 二进制整数部分转十进制
func integerBinaryToDecimal(binary:String)->String{
    
    var result = 0
    var multiplier = 1
    for c in binary.characters.reversed() {
        
        let n = Int(c.description)
        guard let num = n else{
            continue
        }
        
        result += num * multiplier
        multiplier *= 2
        
        
    }
    
    return "\(result)"
}

// MARK: - 二进制小数部分转十进制
func doubleBinaryToDecimal(binary:String?)->String?{
    
    guard let binary = binary else{
        return nil
    }
    
    var result:Double = 0
    var multiplier = 0.5
    for c in binary.characters {
        
        let n = Int(c.description)
        guard let num = n else{
            continue
        }
        
        result += Double(num) * multiplier
        multiplier /= 2
        
        
    }
    
    let res = "\(result)"
    let index = res.index(after: res.startIndex)
    return res.substring(from: index)
    
}
