#import "../../../lib.typ":*

=== #Title(
  title: [子结构判断],
  reflink: "https://leetcode.cn/problems/shu-de-zi-jie-gou-lcof/description/",
  level: 2,
)

#note(
  title: [
子结构判断
  ],

  description: [
给定两棵二叉树 tree1 和 tree2，判断 tree2 是否以 tree1 的某个节点为根的子树具有 相同的结构和节点值 。
注意，空树 不会是以 tree1 的某个节点为根的子树具有 相同的结构和节点值 。
  ],

  examples: (
    [
#image("img/example1.png", width: 50%)

输入：tree1 = [1,7,5], tree2 = [6,1]

输出：false

解释：tree2 与 tree1 的一个子树没有相同的结构和节点值。   


    ],[
#image("img/example2.png", width: 50%)

输入：tree1 = [3,6,7,1,8], tree2 = [6,1]

输出：true

解释：tree2 与 tree1 的一个子树拥有相同的结构和节点值。即 6 - > 1。      
    ]
  ),

  tips: [
0 <= 节点个数 <= 10000
  ],

  solutions: (
  ( name:[递归遍历],
    text:[
若树 B 是树 A 的子结构，则子结构的根节点可能为树 A 的任意一个节点。因此，判断树 B 是否是树 A 的子结构，需完成以下两步工作：
+ 先序遍历树 A 中的每个节点 node ；（对应函数 isSubStructure(A, B)）
+ 判断树 A 中以 node 为根节点的子树是否包含树 B 。（对应函数 recur(A, B)）
#align(center,{image("img/solution1.png", width: 80%)})

本文名词规定：树 A 的根节点记作 节点 A ，树 B 的根节点称为 节点 B 。

`recur(A, B) `函数：
+ 终止条件：
	+ 当节点 B 为空：说明树 B 已匹配完成（越过叶子节点），因此返回 `true` ；
	+ 当节点 A 为空：说明已经越过树 A 的叶节点，即匹配失败，返回 `false` ；
	+ 当节点 A 和 B 的值不同：说明匹配失败，返回 `false` ；
+ 返回值：
	+ 判断 A 和 B 的 左子节点 是否相等，即 `recur(A.left, B.left)` ；
	+ 判断 A 和 B 的 右子节点 是否相等，即 `recur(A.right, B.right)` ；

`isSubStructure(A, B) `函数：
+ 特例处理： 当 树 A 为空 或 树 B 为空 时，直接返回 `false` ；
+ 返回值： 若树 B 是树 A 的子结构，则必满足以下三种情况之一，因此用或 || 连接；
	+ 以 节点 A 为根节点的子树 包含树 B ，对应 `recur(A, B)`；
	+ 树 B 是 树 A 左子树 的子结构，对应 `isSubStructure(A.left, B)`；
	+ 树 B 是 树 A 右子树 的子结构，对应 `isSubStructure(A.right, B)`；
  ],code:[
```cpp
class Solution {
public:
    bool isSubStructure(TreeNode* A, TreeNode* B) {
        return (A != nullptr && B != nullptr) && (recur(A, B) || isSubStructure(A->left, B) || isSubStructure(A->right, B));
    }
private:
    bool recur(TreeNode* A, TreeNode* B) {
        if(B == nullptr) return true;
        if(A == nullptr || A->val != B->val) return false;
        return recur(A->left, B->left) && recur(A->right, B->right);
    }
};
```      
  ]),

  ),

  gain:none,
) 