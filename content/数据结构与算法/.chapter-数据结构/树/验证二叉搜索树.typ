#import "../../../../lib.typ":*

=== #Title(
  title: [验证二叉搜索树],
  reflink: "https://leetcode.cn/problems/validate-binary-search-tree/description/",
  level: 2,
)<验证二叉搜索树>

#note(
  title: [
验证二叉搜索树
  ],

  description: [
给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。

有效 二叉搜索树定义如下：

- 节点的左子树只包含 小于 当前节点的数。
- 节点的右子树只包含 大于 当前节点的数。
- 所有左子树和右子树自身必须也是二叉搜索树。
  ],

  examples: ([
#figure(
  image("./img/tree1.jpg", width: 20%)
)    
输入：root = [2,1,3]

输出：true    
    ],[
#figure(
  image("./img/tree2.jpg", width: 20%)
)          
输入：root = [5,1,4,null,null,3,6]

输出：false

解释：根节点的值是 5 ，但是右子节点的值是 4 。      
    ]
  ),

  tips: [
- 树中节点数目范围在$[1, 10^4]$ 内
- $-2^31 <= "Node.val" <= 2^31 - 1$
  ],

  solutions: (
  ( name:[递归],
    text:[
要解决这道题首先我们要了解二叉搜索树有什么性质可以给我们利用，由题目给出的信息我们可以知道：如果该二叉树的左子树不为空，则左子树上所有节点的值均小于它的根节点的值； 若它的右子树不空，则右子树上所有节点的值均大于它的根节点的值；它的左右子树也为二叉搜索树。

这启示我们设计一个递归函数 `helper(root, lower, upper)` 来递归判断，函数表示考虑以 `root` 为根的子树，判断子树中所有节点的值是否都在 $(l,r)$ 的范围内（注意是开区间）。如果 `root` 节点的值 `val` 不在 $(l,r)$ 的范围内说明不满足条件直接返回，否则我们要继续递归调用检查它的左右子树是否满足，如果都满足才说明这是一棵二叉搜索树。

那么根据二叉搜索树的性质，在递归调用左子树时，我们需要把上界 `upper` 改为 `root.val`，即调用 `helper(root.left, lower, root.val)`，因为左子树里所有节点的值均小于它的根节点的值。同理递归调用右子树时，我们需要把下界 `lower` 改为 `root.val`，即调用 `helper(root.right, root.val, upper)`。

函数递归调用的入口为 `helper(root, -inf, +inf)`， `inf` 表示一个无穷大的值。
  ],code:[
```cpp
class Solution {
public:
    bool helper(TreeNode* root, long long lower, long long upper) {
        if (root == nullptr) {
            return true;
        }
        if (root -> val <= lower || root -> val >= upper) {
            return false;
        }
        return helper(root -> left, lower, root -> val) && helper(root -> right, root -> val, upper);
    }
    bool isValidBST(TreeNode* root) {
        return helper(root, LONG_MIN, LONG_MAX);
    }
};
```      
  ]),(
  name:[中序遍历],
  text:[
基于方法一中提及的性质，我们可以进一步知道二叉搜索树「中序遍历」得到的值构成的序列一定是升序的，这启示我们在中序遍历的时候实时检查当前节点的值是否大于前一个中序遍历到的节点的值即可。如果均大于说明这个序列是升序的，整棵树是二叉搜索树，否则不是，下面的代码我们使用栈来模拟中序遍历的过程。 
  ],
  code:[
```cpp
class Solution {
public:
    bool isValidBST(TreeNode* root) {
        stack<TreeNode*> stack;
        long long inorder = (long long)INT_MIN - 1;

        while (!stack.empty() || root != nullptr) {
            while (root != nullptr) {
                stack.push(root);
                root = root -> left;
            }
            root = stack.top();
            stack.pop();
            // 如果中序遍历得到的节点的值小于等于前一个 inorder，说明不是二叉搜索树
            if (root -> val <= inorder) {
                return false;
            }
            inorder = root -> val;
            root = root -> right;
        }
        return true;
    }
};
```    
  ]
  )

  ),

  gain:[
    以下代码是*错误*的,因为其只考虑了搜索二叉树的局部特征，没有考虑搜索二叉树的整体特性，例如某节点在其父节点的左子树中，其父节点在根节点的右子树下，而某节点值比根节点要小，从整体情况上看其不会出现在根节点的右子树下。
```cpp
class Solution {
public:
    bool isValidBST(TreeNode* root) {
        if(root == nullptr) {
            return true;
        }
        return isValidBST(root->left) && isValidBST(root->right) && (root->left==nullptr||root->left->val < root->val) && (root->right==nullptr||root->right->val > root->val);
    }
};
```
  ],
)
