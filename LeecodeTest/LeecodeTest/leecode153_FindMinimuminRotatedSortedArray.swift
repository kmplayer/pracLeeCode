//
//  leecode153_FindMinimuminRotatedSortedArray.swift
//  LeecodeTest
//
//  Created by wenyanjie on 17/3/17.
//
//

/*
 思路:Time: O(logN),最坏O(N)
 二分排除法
 mid比右边大，排除mid本身和mid左边的部分
 mid比右边小，排除mid右边的部分
 最后返回mid
 */
extension Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right
        {
            if (left == right) {
                return nums[left]
            }
            
            let mid = left + (right - left) / 2
            
            if nums[mid] > nums[right] {
                left = mid + 1
            }
            else {
                right = mid
            }
        }
        
        return nums[left]
    }
}


