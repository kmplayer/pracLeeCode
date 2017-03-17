//
//  leecode313_SuperUglyNumber.swift
//  LeecodeTest
//
//  Created by wenyanjie on 17/3/9.
//
//

/*
 思路:Time:O(N^2) Space:O(N)
 下一个uglynum必然是已经找到的uglynum中(num_index * prime_index)的最小值
 保存prime_index的下标值，哪个等于最小值（也就是下一个uglynum），
 对应的index后移一位
 */

extension Solution {
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        
        var superUglyArray: [Int] = [1]
        var indexArray = [Int](repeating: 0, count: primes.count)
        
        while superUglyArray.count != n {
            var minNum = 0
            for index in 0..<primes.count
            {
                let nextUglyNum = superUglyArray[indexArray[index]] * primes[index]
                if index == 0 {
                    minNum = nextUglyNum
                }else {
                    if minNum > nextUglyNum {
                        minNum = nextUglyNum
                    }
                }
            }
            
            for index in 0..<primes.count
            {
                let nextUglyNum = superUglyArray[indexArray[index]] * primes[index]
                if minNum == nextUglyNum {
                    indexArray[index] += 1
                }
            }
            
            superUglyArray.append(minNum)
        }
        
        return superUglyArray[n - 1]
    }
}
