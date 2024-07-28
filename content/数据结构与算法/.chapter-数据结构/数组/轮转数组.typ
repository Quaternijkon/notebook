#import "../../../../lib.typ":*

=== #Title(
  title: [轮转数组],
  reflink: "https://leetcode.cn/problems/rotate-array/description/",
  level: 2,
)<轮转数组>

#note(
  title: [
轮转数组
  ],

  description: [
给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。
  ],

  examples: ([
输入: nums = [1,2,3,4,5,6,7], k = 3

输出: [5,6,7,1,2,3,4]

解释:

- 向右轮转 1 步: [7,1,2,3,4,5,6]
- 向右轮转 2 步: [6,7,1,2,3,4,5]
- 向右轮转 3 步: [5,6,7,1,2,3,4]    
    ],[
输入：nums = [-1,-100,3,99], k = 2

输出：[3,99,-1,-100]

解释: 

- 向右轮转 1 步: [99,-1,-100,3]
- 向右轮转 2 步: [3,99,-1,-100]   

    ]
  ),

  tips: [
- $1 <= "nums.length" <= 10^5$
- $-2^31 <= "nums"[i] <= 2^31 - 1$
- $0 <= k <= 10^5$
  ],

  solutions: (
  ( name:[富有线性代数的美],
    text:[
我们需要将 ab 变成 ba ，可以首先将ab翻转得到$b^(-1)a^(-1)$，然后将$b^(-1)a^(-1)$翻转得到ba。

- $("ab")^(-1) = b^(-1)a^(-1)$
- $(b^(-1))^(-1) = b$
- $(a^(-1))^(-1) = a$
  ],code:[
```cpp
class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        reverse(nums.begin(), nums.end());
        reverse(nums.begin(), nums.begin() + k % nums.size());
        reverse(nums.begin() + k % nums.size(), nums.end());
    }
};
```      
  ]),

  ),

  gain:none,
)
