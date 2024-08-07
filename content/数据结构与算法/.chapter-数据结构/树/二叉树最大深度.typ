#import "../../../../lib.typ":*

=== #Title(
  title: [二叉树最大深度],
  reflink: "https://leetcode.cn/problems/maximum-depth-of-binary-tree/description/",
  level: 1,
)<二叉树最大深度>

#note(
  title: [
二叉树最大深度
  ],

  description: [
给定一个二叉树 root ，返回其最大深度。

二叉树的 最大深度 是指从根节点到最远叶子节点的最长路径上的节点数。
  ],

  examples: ([
输入：root = [3,9,20,null,null,15,7]

输出：3    
    ],[
输入：root = [1,null,2]

输出：2      
    ]
  ),

  tips: [
- 树中节点的数量在 $[0, 10^4]$ 区间内。
- $-100 <= "Node.val" <= 100$
  ],

  solutions: (
  (
  name:[后序遍历（DFS）: 递归],
  text:[
树的后序遍历 / 深度优先搜索往往利用 递归 或 栈 实现。

显然，树的深度 等于 左子树的深度 与 右子树的深度中的 最大值 +1。

1. 终止条件： 当 `root​` 为空，说明已越过叶节点，因此返回 深度 0 。
2. 递推工作： 本质上是对树做后序遍历。
  - 计算节点 `root​` 的 左子树的深度 ，即调用 `maxDepth(root.left)`。
  - 计算节点 `root​` 的 右子树的深度 ，即调用 `maxDepth(root.right)`。
3. 返回值： 返回 此树的深度 ，即 `max(maxDepth(root.left), maxDepth(root.right)) + 1`。
  ],
  code:[
```cpp    
class Solution {
public:
    int maxDepth(TreeNode* root) {
        if (root == nullptr) return 0;
        return max(maxDepth(root->left), maxDepth(root->right)) + 1;
    }
};
```
  ]
  ),(
  name:[层序遍历（BFS）],
  text:[
树的层序遍历 / 广度优先搜索往往利用 队列 实现。

每遍历一层，则计数器 +1 ，直到遍历完成，则可得到树的深度。

+ 特例处理： 当 `root​` 为空，直接返回 深度 0 。
+ 初始化： 队列 `queue` （加入根节点 `root` ），计数器 `res` = 0。
+ 循环遍历： 当 `queue` 为空时跳出。
  - 初始化一个空列表 `tmp` ，用于临时存储下一层节点。
  - 遍历队列： 遍历 `queue` 中的各节点 `node` ，并将其左子节点和右子节点加入 `tmp。`
  - 更新队列： 执行 `queue` = `tmp` ，将下一层节点赋值给 `queue。`
  - 统计层数： 执行 `res += 1` ，代表层数加 1。
+ 返回值： 返回 `res` 即可。
  ],
  code:[
```cpp
class Solution {
public:
    int maxDepth(TreeNode* root) {
        if (root == nullptr) return 0;
        vector<TreeNode*> que;
        que.push_back(root);
        int res = 0;
        while (!que.empty()) {
            vector<TreeNode*> tmp;
            for(TreeNode* node : que) {
                if (node->left != nullptr) tmp.push_back(node->left);
                if (node->right != nullptr) tmp.push_back(node->right);
            }
            que = tmp;
            res++;
        }
        return res;
    }
};
```    
  ]
  )

  ),

  gain:none,
)
