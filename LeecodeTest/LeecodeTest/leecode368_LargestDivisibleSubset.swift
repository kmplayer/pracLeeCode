//
//  leecode368_LargestDivisibleSubset.swift
//  LeecodeTest
//
//  Created by wenyanjie on 17/3/16.
//
//

/*
 思路:Time:O(N^2)
 动态规划
 先排序，保证后面的值较大
 */

extension Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        let numCount = nums.count
        if (numCount <= 1) {
            return nums
        }
        
        let sortNums = nums.sorted(by: <)
        var res = [[Int]]()
        var len = [Int]()
        var maxIndex: (len: Int, index: Int) = (1, 0)
        for i in 0..<numCount
        {
            len.append(1)
            res.append([sortNums[i]])
            for j in 0..<i
            {
                // len[i] = max (len[i], len[j] + 1) if(sortNums[i] % sortNums[j]) (j =0...i-1)
                if (sortNums[i] % sortNums[j] == 0) && len[i] < len[j] + 1{
                    len[i] = len[j] + 1
                    res[i].append(sortNums[j])
                }
            }
            
            // 将最大值，调整到最后一位
            res[i].append(sortNums[i])
            res[i].remove(at: 0)
            
            // 记录最大长度的位置
            if (maxIndex.len < res[i].count) {
                maxIndex = (res[i].count, i)
            }
        }
        
        return res[maxIndex.index]
    }
}
