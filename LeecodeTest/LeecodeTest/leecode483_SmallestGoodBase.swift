//
//  leecode483_SmallestGoodBase.swift
//  LeecodeTest
//
//  Created by wenyanjie on 17/3/16.
//
//

/*
 思路:Time:
 推导公式，得到 k^(m+1) = n*(k-1)+1 （k进制）
 取值范围： 2<=k<=(n-1)   1<=m<=log(n)(10^18 取值为62)
 m与k成反比，要求k最小，从大到小遍历m
 有值k使得等式成立，那么k就是结果
 */
import Foundation

extension Solution {
    func smallestGoodBase(_ n: String) -> String {
        let longNum = CUnsignedLongLong(n)
        var expNum = 62
        while (expNum > 0)
        {
            // 这里可以裁剪较大的expNum值
            if CUnsignedLongLong(1 << expNum) < longNum!
            {
                let guessRes: CUnsignedLongLong = myGuess(longNum!, expNum)
                if (guessRes != 0) {
                    return String(guessRes)
                }
            }
            expNum -= 1;
        }
        
        return String(longNum! - 1)
    }
    
    //猜测最大指数值为expNum时，二分法查找k是否有解,
    func myGuess(_ n: CUnsignedLongLong, _ expNum: Int) -> CUnsignedLongLong {
        let tn = Double(n)
        // 最小取值为二进制
        var l: CUnsignedLongLong = 2
        // 最大指数为expNum的条件下，n = 1 + mid + .. + mid^expNum  大于 mid^expNum,  得到 mid 小于 n ^(1/expNum)
        var r = CUnsignedLongLong(pow(tn, 1.0 / Double(expNum)))
        while l <= r
        {
            let mid: CUnsignedLongLong = l + (r - l) / 2
            var cur: CUnsignedLongLong = 1
            var sum: CUnsignedLongLong = 1
            // 计算1 + mid + ... + mid^expNum
            var countM = expNum
            while countM > 0
            {
                cur *= mid
                sum += cur
                // 这里大于n，肯定就不是了
                if (sum > n) {
                    break;
                }
                countM -= 1
            }
            
            if sum == n {
                return mid
            }else if sum < n {
                l = mid + 1
            }else {
                r = mid - 1
            }
        }
        
        return 0
    }
}
