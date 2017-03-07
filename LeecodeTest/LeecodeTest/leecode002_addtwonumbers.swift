//
//  leecode002_addtwonumbers.swift
//  HelloLeeCode
//
//  Created by wenyanjie on 17/3/3.
//  Copyright © 2017年 wenyanjie. All rights reserved.
//
//  Time:O(N) Space:O(N)


extension Solution {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil
        {
            return l1 ?? l2
        }
        var p1 = l1
        var p2 = l2
        let result: ListNode? = ListNode(0)
        var current = result
        var extra = 0
        while p1 != nil || p2 != nil || extra != 0
        {
            var tot = (p1.flatMap { $0.val } ?? 0) + (p2.flatMap { $0.val } ?? 0) + extra
            extra = tot / 10
            tot = tot % 10
            let sum: ListNode? = ListNode(tot)
            current!.next = sum
            current = sum
            p1 = p1.flatMap { $0.next }
            p2 = p2.flatMap { $0.next }
        }
        return result!.next
    }
}
