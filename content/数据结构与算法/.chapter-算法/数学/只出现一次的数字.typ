#import "../../../../lib.typ":*

=== #Title(
  title: [只出现一次的数字],
  reflink: "https://leetcode.cn/problems/single-number/description/",
  level: 1,
)<只出现一次的数字>

#note(
  title: [
只出现一次的数字
  ],

  description: [
给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。
  ],

  examples: ([
输入：nums = [2,2,1]

输出：1    
    ],[
输入：nums = [4,1,2,1,2]

输出：4      
    ],[
输入：nums = [1]

输出：1      
    ]
  ),

  tips: [
- $1 <= "nums.length" <= 3 * 10^4$
- $-3 * 10^4 <= "nums"[i] <= 3 * 10^4$
- 除了某个元素只出现一次以外，其余每个元素均出现两次。
  ],

  solutions: (
  ( name:[位运算],
    text:[
异或运算有个重要的性质，两个相同数字异或为 0 ，即对于任意整数 a 有 $a⊕a=0$ 。因此，若将 `nums` 中所有数字执行异或运算，留下的结果则为 出现一次的数字 x ，即：

$a⊕a⊕b⊕b⊕...⊕x$

$=0⊕0⊕...⊕x$

$=x$
​
 

  ],code:[
```cpp
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int res = 0;
        for (int i = 0; i < nums.size(); i++) {
            res ^= nums[i];
        }
        return res;
    }
};
```      
  ]),

  ),

  gain:none,
)
