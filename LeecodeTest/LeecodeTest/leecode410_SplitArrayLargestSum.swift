//
//  leecode410_SplitArrayLargestSum.swift
//  LeecodeTest
//
//  Created by wenyanjie on 17/3/9.
//
//

extension Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        var maxArray = 0
        var sumArray = 0
        for num in nums {
            if num > maxArray {
                maxArray = num
            }
            sumArray += num
        }
        
        var left = maxArray
        var right = sumArray
        var result = 0
        while left <= right {
            let mid: Int = (left + right) / 2
            if guessM(mid, nums, m) {
                right = mid - 1
                result = mid
            }else {
                left = mid + 1
            }
        }
        
        return result
    }
    
    // 猜测最大值为testResult,如果猜测值过大，返回true
    func guessM(_ testResult: Int, _ nums: [Int], _ m: Int) -> Bool {
        var sum = 0
        var count = 0
        for num in nums
        {
            if num > testResult { return false }
            sum += num
            if (sum > testResult)
            {
                count += 1
                sum = num
            }
        }
        
        return (count < m)
    }
}

