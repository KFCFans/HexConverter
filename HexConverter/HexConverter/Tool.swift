//
//  Tool.swift
//  HexConverter
//
//  Created by lip on 17/1/14.
//  Copyright © 2017年 lip. All rights reserved.
//

import Foundation

// 将数字转换为十六进制字母
func sixteencharChanger(num:Int)->String{
    
    switch num {
    case 10:
        return "A"
    case 11:
        return "B"
    case 12:
        return "C"
    case 13:
        return "D"
    case 14:
        return "E"
    case 15:
        return "F"
    case 16:
        return "."
    default:
        return "\(num)"
    }
    
}

// MARK: - 删除前后的 0
func deleteHeadTailZero(str:String)->String{
    
    var result = str
    
    for c in str.characters{
        
        let n = Int(c.description) ?? 0
        
        if n == 0{
            let index = result.index(after: result.startIndex)
            result = result.substring(from: index)
            continue
        }
        else{
            break
        }
        
        
    }
    
    for c in result.characters.reversed() {
        
        let n = Int(c.description) ?? 0
        
        if n == 0{
            let index = result.index(before: result.endIndex)
            result = result.substring(to: index)
            continue
        }else{
            break
        }
        
        
        
    }
    
    
    return result
    
}
