//
//  leecode074_Searcha2DMatrix.swift
//  LeecodeTest
//
//  Created by wenyanjie on 17/3/16.
//
//

/*
 思路:Time:O(log(row * col)
 二分查找，二维数组转化为一维数组处理
 */
extension Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if (matrix.count == 0) {
            return false
        }
        
        let colNum = matrix[0].count
        let rowNum = matrix.count
        var l = 0
        var r = colNum * rowNum - 1
        while (l <= r)
        {
            let mid = l + (r - l) / 2
            let i = mid / colNum
            let j = mid % colNum
            if (matrix[i][j] == target) {
                return true
            }else if (matrix[i][j] < target) {
                l = mid + 1
            }else {
                r = mid - 1
            }
        }
        
        return false
    }
}
