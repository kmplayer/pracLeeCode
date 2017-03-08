//
//  leecode227_BasicCalculatorII.swift
//  HelloLeeCode
//
//  Created by wenyanjie on 17/3/3.
//  Copyright © 2017年 wenyanjie. All rights reserved.
//  Time:O(N) Space:O(N)
//

/*
 思路1:Time:O(N) Space:O(1)
    preSign "+" 和 “-” 解除tmpSum，tmpSum可以赋值给sum
    否则 tmpSum *或/ 当前值
 
 
 思路2:Time:O(N) Space:O(N)
    两个数组分别保存符号和数字
    “+”和“-”直接赋值给sum
    “*”和“/”临时保存到tmpSum
 */
extension Solution {
    func calculate(_ s: String) -> Int {
        
        var currentNum = 0
        var preSign = "+"
        var sum = 0
        var tmpSum: Int = 0
        var index: Int = 0
        let sLen = s.characters.count
        for c in s.characters
        {
            index += 1
            let strC = String(c)
            if Int(strC) != nil
            {
                currentNum = currentNum * 10 + Int(strC)!
            }

            if strC == "+" || strC == "-" || strC == "*" ||
                strC == "/" || index == sLen
            {
                switch preSign {
                case "+":
                    sum += tmpSum
                    tmpSum = currentNum
                    preSign = strC
                    break;
                case "-":
                    sum += tmpSum
                    tmpSum = -currentNum
                    preSign = strC
                    break;
                case "*":
                    tmpSum *= currentNum
                    preSign = strC
                    break;
                case "/":
                    tmpSum /= currentNum
                    preSign = strC
                    break;
                default:
                    break;
                }
                
                currentNum = 0
                
                if (index == sLen)
                {
                    sum += tmpSum
                }
            }
        }
        
        return sum;
    }
    
    func calculate2(_ s: String) -> Int {
        
        var numArray: [String] = []
        var opeArray: [String] = []
        var numStr = ""
        for c in s.characters
        {
            let strC = String(c)
            if Int(strC) != nil
            {
                numStr += strC
            }
            else
            {
                if numStr != ""
                {
                    numArray.append(numStr)
                    numStr = ""
                }
                if (strC != " ")
                {
                    opeArray.append(strC)
                }
            }
        }
        if numStr != ""
        {
            numArray.append(numStr)
        }
        
        if numArray.count == 1
        {
            return Int(numArray[0])!
        }
        
        var index: Int = 0
        var preOpe: String = ""
        
        var sum: Int = 0
        var tmpSum: Int = 0
        
        if opeArray[0] == "+" || opeArray[0] == "-"
        {
            sum = Int(numArray[0])!
        }
        else
        {
            tmpSum = Int(numArray[0])!
        }
        
        for opeStr in opeArray
        {
            switch opeStr {
            case "+":
                sum += tmpSum
                sum += Int(numArray[index+1])!
                tmpSum = 0
                preOpe = opeStr
                break;
            case "-":
                sum += tmpSum
                sum -= Int(numArray[index+1])!
                tmpSum = 0
                preOpe = opeStr
                break;
            case "*":
                if preOpe == "+"
                {
                    sum -= Int(numArray[index])! // 减去多加的值
                    tmpSum = (Int(numArray[index])! * Int(numArray[index+1])!)
                }
                else if preOpe == "-"
                {
                    sum += Int(numArray[index])!
                    tmpSum = (-Int(numArray[index])! * Int(numArray[index+1])!)
                }
                else
                {
                    tmpSum *= Int(numArray[index+1])!
                }
                preOpe = opeStr
                break;
            case "/":
                if preOpe == "+"
                {
                    sum -= Int(numArray[index])!
                    tmpSum = (Int(numArray[index])! / Int(numArray[index+1])!)
                }
                else if preOpe == "-"
                {
                    sum += Int(numArray[index])!
                    tmpSum = (-Int(numArray[index])! / Int(numArray[index+1])!)
                }
                else
                {
                    tmpSum /= Int(numArray[index+1])!
                }
                preOpe = opeStr
                break;
            default:
                break;
            }
            
            index += 1
        }
        
        sum += tmpSum

        return sum;
    }
}
