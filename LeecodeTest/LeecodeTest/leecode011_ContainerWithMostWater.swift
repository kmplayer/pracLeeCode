//
//  leecode011_ContainerWithMostWater.swift
//  LeecodeTest
//
//  Created by wenyanjie on 17/3/10.
//
//

extension Solution {
    func maxArea(_ height: [Int]) -> Int {
        var i = 0
        var j = height.count - 1
        var result = 0
        while (i != j)
        {
            let tmpResult = min(height[i], height[j]) * (j - i)
            result = max(result, tmpResult)
            
            if (height[j] > height[i]) {
                i += 1
            }else {
                j -= 1
            }
        }
        
        return result
    }
}
