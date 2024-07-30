#import "../../../../lib.typ":*

=== #Title(
  title: [移动零],
  reflink: "https://leetcode.cn/problems/move-zeroes/description/",
  level: 1,
)<移动零>

#note(
  title: [
移动零
  ],

  description: [
给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

请注意 ，必须在不复制数组的情况下原地对数组进行操作。
  ],

  examples: ([
输入: nums = [0,1,0,3,12]

输出: [1,3,12,0,0]    
    ],[
输入: nums = [0]

输出: [0]      
    ]
  ),

  tips: [
$1 <= "nums.length" <= 10^4$

$-2^31 <= "nums"[i] <= 2^31 - 1$
  ],

  solutions: (
  ( name:[双指针],
    text:[
我们使用两个指针 `left` 和 `right` 来遍历数组：

- `right` 指针用于遍历数组的每个元素。
- `left` 指针用于记录非零元素的位置。

*算法步骤:*

1. 初始化两个指针 `left` 和 `right`，都指向数组的起始位置。
2. 遍历数组，直到 `right` 指针到达数组的末尾：
   - 如果 `nums[right]` 不是零，就将 `nums[left]` 和 `nums[right]` 交换，并将 `left` 指针右移一位。
   - 不管 `nums[right]` 是否为零，`right` 指针都右移一位。
3. 继续这个过程，直到 `right` 指针遍历完数组。
  ],code:[
```cpp
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int n = nums.size();
        int left = 0, right = 0;
        while (right < n) {
            if (nums[right] != 0) {
                swap(nums[left], nums[right]);
                left++;
            }
            right++;
        }

    }
};
```      
  ]),

  ),

  gain:none,
)
