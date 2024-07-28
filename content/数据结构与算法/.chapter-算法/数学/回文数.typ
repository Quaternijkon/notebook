#import "../../../../lib.typ":*

=== #Title(
  title: [回文数],
  reflink: "https://leetcode.cn/problems/palindrome-number/description/",
  level: 1,
)<回文数>

#note(
  title: [
回文数
  ],

  description: [
给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。

回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

例如，121 是回文，而 123 不是。

*你能不将整数转为字符串来解决这个问题吗？*
  ],

  examples: ([
输入：x = 121

输出：true    
    ],[
输入：x = -121

输出：false

解释：从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。      
    ],[
输入：x = 10

输出：false

解释：从右向左读, 为 01 。因此它不是一个回文数。      
    ]
  ),

  tips: [
$-2^31 <= x <= 2^31 - 1$
  ],

  solutions: (
  ( name:[组],
    text:[
重新组成一个新数，判断是否和原数相等。
  ],code:[
```cpp
class Solution {
public:
    bool isPalindrome(int x) {
        if(x < 0) return false;
        int temp = x;
        long long res = 0;
        while(x){
            res = res * 10 + x % 10;
            x /= 10;
        }
        return res == temp;
    }
};
```      
  ]),( name:[拆],
    text:[
将数按头尾拆分，判断是否相等。
  ],code:[
```cpp
class Solution {
public:
    bool isPalindrome(int x) {
        if (x < 0) return false;
        int len = log10(x) + 1;
        int num = x;
        while (num) {
            int left = num / pow(10, len - 1);
            int right = num % 10;
            if (left != right) return false;
            num %= static_cast<int>(pow(10, len - 1));
            num /= 10;
            len -= 2;
        }
        return true;
    }
};
```      
  ]),( name:[只反转一半],
    text:[
为了避免数字反转可能导致的溢出问题，考虑只反转int数的一半。

对于数字 1221，如果执行 $1221 % 10$，我们将得到最后一位数字 1，要得到倒数第二位数字，我们可以先通过除以 10 把最后一位数字从 1221 中移除，$1221 / 10 = 122$，再求出上一步结果除以 10 的余数，$122 % 10 = 2$，就可以得到倒数第二位数字。如果我们把最后一位数字乘以 10，再加上倒数第二位数字，$1 * 10 + 2 = 12$，就得到了我们想要的反转后的数字。如果继续这个过程，我们将得到更多位数的反转数字。

现在的问题是，我们*如何知道反转数字的位数已经达到原始数字位数的一半*？

由于整个过程我们不断将原始数字除以 10，然后给反转后的数字乘上 10，所以，当原始数字小于或等于反转后的数字时，就意味着我们已经处理了一半位数的数字了。
  ],code:[
```cpp
class Solution {
public:
    bool isPalindrome(int x) {
        if (x < 0 || (x % 10 == 0 && x != 0)) {
            return false;
        }
        int revertedNumber = 0;
        while (x > revertedNumber) {
            revertedNumber = revertedNumber * 10 + x % 10;
            x /= 10;
        }

        // 当数字长度为奇数时，我们可以通过 revertedNumber/10 去除处于中位的数字。
        // 例如，当输入为 12321 时，在 while 循环的末尾我们可以得到 x = 12，revertedNumber = 123，
        // 由于处于中位的数字不影响回文（它总是与自己相等），所以我们可以简单地将其去除。
        return x == revertedNumber || x == revertedNumber / 10;
    }
};
```      
  ])

  ),

  gain:none,
)
