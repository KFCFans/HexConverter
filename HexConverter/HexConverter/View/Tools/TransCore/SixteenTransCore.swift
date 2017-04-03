//
//  SixteenTransCore.swift
//  HexConverter
//
//  Created by lip on 17/1/25.
//  Copyright © 2017年 lip. All rights reserved.
//

import Foundation

func sixteenTransKit(value:Character)->String?{
    
    var result:String?
    switch value {
    case "0":
        result = "0000"
        break
    case "1":
        result = "0001"
        break
    case "2":
        result = "0010"
        break
    case "3":
        result = "0011"
        break
    case "4":
        result = "0100"
        break
    case "5":
        result = "0101"
        break
    case "6":
        result = "0110"
        break
    case "7":
        result = "0111"
        break
    case "8":
        result = "1000"
        break
    case "9":
        result = "1001"
        break
    case "A":
        result = "1010"
        break
    case "B":
        result = "1011"
        break
    case "C":
        result = "1100"
        break
    case "D":
        result = "1101"
        break
    case "E":
        result = "1110"
        break
    case "F":
        result = "1111"
        break
    case ".":
        result = "."
        break

    default:
        return nil
    }
    
    return result
    
}

//MARK: - 16进制转二进制
func stnToBinary(stn:String?)->String?{
    
    guard let stn = stn else{
        return nil
    }
    var result:String = ""
    for c in stn.characters{
        result.append(sixteenTransKit(value: c) ?? "")
    }
    
    // 去除首尾的0
    return deleteHeadTailZero(str: result)
}

//MARK: - 16进制转换算法
func sixteenTransCore(stn:String,targethex:Int)->String?{
    
    guard let binary = stnToBinary(stn: stn) else{
        return nil
    }
    
    
    
    switch targethex {
    case 2:
        return binary
    case 8:
        return binaryTransCore(binary: binary, targethex: 8)
    case 10:
        return binaryTransCore(binary: binary, targethex: 10)
    case 16:
        return stn
    default:
        return nil
    }
    
}
