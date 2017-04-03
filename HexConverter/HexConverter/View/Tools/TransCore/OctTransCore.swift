//
//  OctTransCore.swift
//  HexConverter
//
//  Created by lip on 17/1/16.
//  Copyright © 2017年 lip. All rights reserved.
//

import Foundation

func octTransKit(value:Character)->String?{
    
    var result:String?
    switch value {
    case "0":
        result = "000"
        break
    case "1":
        result = "001"
        break
    case "2":
        result = "010"
        break
    case "3":
        result = "011"
        break
    case "4":
        result = "100"
        break
    case "5":
        result = "101"
        break
    case "6":
        result = "110"
        break
    case "7":
        result = "111"
        break
    case ".":
        result = "."
        break
    default:
        result = nil
    }
    return result
}

// MARK: - 八进制转二进制
func octToBinary(oct:String)->String{
    
    var result:String = ""
    for c in oct.characters{
        
        guard let temp = octTransKit(value: c) else{
            continue
        }
        
        result.append(temp)
    
    }
    
    return result
}

// MARK: - 八进制转换
func octTransCore(oct:String,targethex:Int)->String{
    
    let binary = deleteHeadTailZero(str: octToBinary(oct: oct))
    
    switch targethex {
    case 2:
        return binary
    case 10:
        return binaryTransCore(binary: binary, targethex: 10)
    case 16:
        return binaryTransCore(binary: binary, targethex: 16)
    default:
        return "--"
    }
    
}
