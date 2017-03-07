//
//  leecode202_HappyNumber.swift
//  HelloLeeCode
//
//  Created by wenyanjie on 17/3/7.
//  Copyright © 2017年 wenyanjie. All rights reserved.
//

/*
 思路：
 1，快慢指针
    新建一个快指针 和 慢指针
    慢指针每次只求一次 下一个数；快指针 每次求两次 下一个数
    如果
    快指针的值 和 慢指针的值 相等，则返回 false
    快指针的值等于 1 , 则返回 true
 
 2,快乐数的最后计算结果一定等于 1；
    所有不快乐数的数位平方和计算，最後都会进入 4 → 16 → 37 → 58 → 89 → 145 → 42 → 20 → 4 的循环中
    可以得到一个结论：所有的数都会收敛到 1 或者 4
 */
extension Solution {
    func isHappy(_ n: Int) -> Bool {
        var fast: Int = n
        var slow: Int = n
        
        while true
        {
            slow = sum(slow)
            fast = sum(sum(fast))
            if (fast == 1)
            {
                return true
            }
            
            if (slow == fast)
            {
                return false
            }
        }
        
    }
    
    func isHappy2(_ n: Int) -> Bool {
        var result: Int = n
        
        while result != 4
        {
            result = sum(result)
            if (result == 1)
            {
                return true
            }
        }
        
        return false
    }
    
    func sum(_ n: Int) -> Int {
        var tn: Int = n
        var result: Int = 0;
        while tn > 0
        {
            let tmp: Int = tn % 10
            result += (tmp * tmp)
            tn /= 10
        }
        
        return result
    }
}
