#import "../../../../lib.typ":*

=== #Title(
  title: [两数之和],
  reflink: "https://leetcode.cn/problems/two-sum/description/",
  level: 1,
)<两数之和>

#note(
  title: [
两数之和
  ],

  description: [
给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

你可以按任意顺序返回答案。
  ],

  examples: ([
输入：nums = [2,7,11,15], target = 9

输出：[0,1]

解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。    
    ],[
输入：nums = [3,2,4], target = 6

输出：[1,2]      
    ],[
输入：nums = [3,3], target = 6

输出：[0,1]      
    ]
  ),

  tips: [
- $2 <= "nums.length" <= 10^4$
- $-10^9 <= "nums"[i] <= 10^9$
- $-10^9 <= "target" <= 10^9$
- 只会存在一个有效答案
  ],

  solutions: (
  ( name:[哈希表],
    text:[
使用哈希表（unordered_map）来记录每个元素的值及其对应的索引，以便在遍历数组时能够快速查找满足条件的配对元素。
  ],code:[
```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int, int> hashtable;
        for (int i = 0; i < nums.size(); i++) {
            auto it = hashtable.find(target - nums[i]);
            if (it != hashtable.end()) {
                return {it->second, i};
            }
            hashtable[nums[i]] = i;
        }
        return {};
        
    }
};
```      
  ]),

  ),

  gain:none,
)
