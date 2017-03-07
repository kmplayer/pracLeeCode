//
//  leecode450_DeleteNodeinaBST.swift
//  HelloLeeCode
//
//  Created by wenyanjie on 17/3/6.
//  Copyright © 2017年 wenyanjie. All rights reserved.
//

/*
 思路：
 
 这个问题比较简单，可以用while循环 或者 递归 找到node 节点，思想跟二分法一样：
 如果node.val 小于 key, 那么在 node.left 分支找
 如果node.val 大于 key, 那么在 node.right 分支找
 如果node.val 等于 key, 返回该节点
 
 
 删除节点时，需要处理三种情况
 1,right 为空 
    用 left 分支
 2,left 为空 
    用 right 分支
 3,left 和 right 都不为空
    只看节点的右孩子即可
    分两种情况：
        (1)，右孩子没有左孩子，右孩子值赋值给删除节点，右孩子的右孩子赋值给右孩子
        (2)，有左孩子，遍历到最深的左孩子minNode，minNode的值赋值给删除节点，minNode的右孩子赋值给minNode
 */

extension Solution {
    
    // 非递归算法
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {

        if (root == nil)
        {
            return nil;
        }
        
        var tmpNode = root;
        var preNode: TreeNode? = nil;
        while ((tmpNode) != nil)
        {
            if (key < (tmpNode?.val)!)
            {
                preNode = tmpNode
                tmpNode = tmpNode?.left
            }
            else if (key > (tmpNode?.val)!)
            {
                preNode = tmpNode
                tmpNode = tmpNode?.right
            }
            else
            {
                if (tmpNode?.right == nil)
                {
                    if (preNode != nil)
                    {
                        if (preNode?.left?.val == tmpNode?.val)
                        {
                            preNode?.left = tmpNode?.left
                        }
                        else
                        {
                            preNode?.right = tmpNode?.left
                        }
                        
                        return root
                    }
                    else
                    {
                        return tmpNode?.left;
                    }
                }
                else if (tmpNode?.left == nil)
                {
                    if (preNode != nil)
                    {
                        if (preNode?.right?.val == tmpNode?.val)
                        {
                            preNode?.right = tmpNode?.right
                        }
                        else
                        {
                            preNode?.left = tmpNode?.right
                        }
                        
                        return root
                    }
                    else
                    {
                        return tmpNode?.right
                    }
                }
                else
                {
                    var minNode = tmpNode?.right
                    var preMinNode: TreeNode? = nil
                    while ((minNode?.left) != nil)
                    {
                        preMinNode = minNode
                        minNode = minNode?.left
                    }
                    
                    tmpNode?.val = (minNode?.val)!
                    if (preMinNode == nil) // root?.right直接就是叶子节点
                    {
                        tmpNode?.right = minNode?.right
                    }
                    else
                    {
                        preMinNode?.left = minNode?.right
                    }
                    
                    return root
                }
            }
        }

        return root;
    }
    
    
    // 递归算法
    func deleteNode2(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        
        guard let root = root else {
            return nil
        }
        
        if (key == root.val)
        {
            if (root.right == nil)
            {
                return root.left
            }
            else if (root.left == nil)
            {
                return root.right
            }
            else
            {
                var minNode = root.right
                var preMinNode: TreeNode? = nil
                while ((minNode?.left) != nil)
                {
                    preMinNode = minNode
                    minNode = minNode?.left
                }
                
                root.val = (minNode?.val)!
                if (preMinNode == nil) // root?.right直接就是叶子节点
                {
                    root.right = minNode?.right
                }
                else
                {
                    preMinNode?.left = minNode?.right
                }
            }
        }
        else if (key < root.val)
        {
            root.left = deleteNode(root.left, key)
        }
        else
        {
            root.right = deleteNode(root.right, key)
        }
        
        return root;
    }
}
