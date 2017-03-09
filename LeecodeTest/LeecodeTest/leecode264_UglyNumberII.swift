//
//  leecode264_UglyNumberII.swift
//  LeecodeTest
//
//  Created by wenyanjie on 17/3/8.
//

/*
 思路:Time:O(N) Space:O(N)
    下一个uglynum必然是已经找到的uglynum中(ugly2*2, ugly3*3， ugly5*5)的最小值
    保存ugly2，ugly3，ugly5的下标值，哪个等于最小值（也就是下一个uglynum），
    对应的index后移一位
 */

extension Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        
        if n <= 0 { return 0 }
        
        var index2: Int = 0
        var index3: Int = 0
        var index5: Int = 0
        var uglyArray: [Int] = [1]
        
        while uglyArray.count != n {
            let minNum2 = uglyArray[index2] * 2
            let minNum3 = uglyArray[index3] * 3
            let minNum5 = uglyArray[index5] * 5
            let minNum = min(minNum2, min(minNum3, minNum5))
            if minNum == minNum2 { index2 += 1 }
            if minNum == minNum3 { index3 += 1 }
            if minNum == minNum5 { index5 += 1 }
            uglyArray.append(minNum)
        }
        
        return uglyArray[n - 1]
    }
}
