//
//  leecode263_UglyNumber.swift
//  LeecodeTest
//
//  Created by wenyanjie on 17/3/7.
//
//

extension Solution {
    func isUgly(_ num: Int) -> Bool {
        
        if num <= 0
        {
            return false
        }
        
        var tmpNum = num
        while (tmpNum & 1) == 0
        {
            tmpNum = tmpNum >> 1
        }
        while (tmpNum % 3) == 0
        {
            tmpNum /= 3
        }
        while (tmpNum % 5) == 0
        {
            tmpNum /= 5
        }

        return (tmpNum == 1)
    }
}
