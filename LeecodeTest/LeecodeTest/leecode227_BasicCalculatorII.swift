//
//  leecode227_BasicCalculatorII.swift
//  HelloLeeCode
//
//  Created by wenyanjie on 17/3/3.
//  Copyright © 2017年 wenyanjie. All rights reserved.
//  Time:O(N) Space:O(N)
//  Method:

/*
class Solution2 {
    func lengthOfLongestSubstring(s: String) -> Int {
        var result = 0
        
        var charPosDic : [Character : Int] = [:]  // 记录每个字符最后出现的位置
        var validOffset = 0                       // 记录 LUCS 的 validOffset
        
        for (offset, char) in s.characters.enumerate() {
            
            // 使用 validOffset 对 PLUCS 进行裁剪以确保其有效
            if let preShownIndex = charPosDic[char]{
                validOffset = max(preShownIndex.successor(), validOffset)
            }
            
            // 更新当前结果
            result = max(result, validOffset.distanceTo(offset.successor()))
            
            // 更新字符最后出现的位置
            charPosDic[char] = offset
        }
        
        return result;
    }
}
 */

extension Solution {
    func calculate(_ s: String) -> Int {
        
//        var tokens:[Character] = []
//        for character in (s.characters) {
//            if (character != " ")
//                tokens.append(character)
//        }
//        
//        var sum: Int = 0
//        if s.c == 1
//        {
//            return Int(tokens[0])!
//        }
//        
//        for i in 0...(tokens.count - 1)
//        {
//            if (Int(tokens[i]) == nil)
//            {
//                switch tokens[i] {
//                case "+":
//                    sum = Int(stringStack[stringStack.count - 2])! + Int(stringStack[stringStack.count - 1])!
//                    break;
//                case "-":
//                    sum = Int(stringStack[stringStack.count - 2])! - Int(stringStack[stringStack.count - 1])!
//                    break;
//                case "*":
//                    sum = Int(stringStack[stringStack.count - 2])! * Int(stringStack[stringStack.count - 1])!
//                    break;
//                case "/":
//                    sum = Int(stringStack[stringStack.count - 2])! / Int(stringStack[stringStack.count - 1])!
//                    break;
//                default:
//                    break;
//                }
//                stringStack.remove(at: stringStack.count - 1)
//                stringStack.remove(at: stringStack.count - 1)
//                stringStack.append("\(sum)")
//            } else {
//                stringStack.append(tokens[i]);
//            }
//        }
        return 0;
    }
}
