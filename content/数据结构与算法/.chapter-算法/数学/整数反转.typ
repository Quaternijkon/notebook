#import "../../../../lib.typ":*

=== #Title(
  title: [整数反转],
  reflink: "https://leetcode.cn/problems/reverse-integer/description/",
  level: 2,
)<整数反转>

#note(
  title: [
整数反转
  ],

  description: [
给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。

如果反转后整数超过 32 位的有符号整数的范围 $[−2^31,  2^31 − 1]$ ，就返回 0。

假设环境不允许存储 64 位整数（有符号或无符号）。
  ],

  examples: ([
输入：x = 123

输出：321    
    ],[
输入：x = -123

输出：-321
    ],[
输入：x = 120

输出：21
    ],[
输入：x = 0

输出：0      
    ]
  ),

  tips: [
$−2^31 <= x <= 2^31 − 1$
  ],

  solutions: (
  ( name:[数学],
    text:[

  ],code:[
```cpp
class Solution {
public:
    int reverse(int x) {
        int res = 0;
        while (x != 0) {
            if (res < INT_MIN / 10 || res > INT_MAX / 10) {
                return 0;
            }
            res = res * 10 + x % 10;
            x /= 10;
        }
        return res;

    }
};
```      
  ]),

  ),

  gain:none,
)
