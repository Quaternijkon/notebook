#import "../../../../lib.typ":*

=== #Title(
  title: [字符串匹配],
  reflink: "https://leetcode.cn/problems/find-the-index-of-the-first-occurrence-in-a-string/description/",
  level: 2,
)<字符串匹配>

#note(
  title: [
找出字符串中第一个匹配项的下标
  ],

  description: [
给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串的第一个匹配项的下标（下标从 0 开始）。如果 needle 不是 haystack 的一部分，则返回  -1 。
  ],

  examples: ([
输入：haystack = "sadbutsad", needle = "sad"

输出：0

解释："sad" 在下标 0 和 6 处匹配。

第一个匹配项的下标是 0 ，所以返回 0 。    
    ],[
输入：haystack = "leetcode", needle = "leeto"

输出：-1

解释："leeto" 没有在 "leetcode" 中出现，所以返回 -1 。      
    ]
  ),

  tips: [
- $1 <= "haystack.length, needle.length" <= 10^4$

- haystack 和 needle 仅由小写英文字符组成
  ],

  solutions: (
  ( name:[KMP算法],
    text:[
#figure(
  image("./img/kmp1.png")
)
#linebreak()
#figure(
  image("./img/kmp1.png")
)
#figure(
  image("./img/kmp1.png")
)
#linebreak()
#figure(
  image("./img/kmp1.png")
)
  ],code:[
```cpp
class Solution {
   public:
      // KMP
      int strStr(string haystack, string needle) {
          int n = haystack.size(), m = needle.size();
          if (m == 0) return 0;
          vector<int> next(m, 0);
          // 构建next数组
          for (int i = 1, j = 0; i < m; i++) {
              while (j > 0 && needle[i] != needle[j]) j = next[j - 1];
              if (needle[i] == needle[j]) j++;
              next[i] = j;
          }
          // 匹配
          for (int i = 0, j = 0; i < n; i++) {
              while (j > 0 && haystack[i] != needle[j]) j = next[j - 1];
              if (haystack[i] == needle[j]) j++;
              if (j == m) return i - m + 1;
          }
          return -1;
      }
};
```      
  ]),

  ),

  gain:none,
)
