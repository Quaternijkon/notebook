#import "../../../lib.typ":*

=== #Title(
  title: [最长回文子串],
  reflink: "https://leetcode.cn/problems/longest-palindromic-substring/description/",
  level: 2,
)<最长回文子串>

#note(
  title: [
最长回文子串
  ],

  description: [
给你一个字符串s，找到s中最长的回文子串。
  ],

  examples: ([
输入：s = "babad"

输出："bab"

解释："aba" 同样是符合题意的答案。    
    ],[
输入：s = "cbbd"

输出："bb"      
    ]
  ),

  tips: [
1 <= s.length <= 1000

s 仅由数字和英文字母组成
  ],

  solutions: (
  ( name:[动态规划],
    text:[
对于一个子串而言，如果它是回文串，并且长度大于 2，那么将它首尾的两个字母去除之后，它仍然是个回文串。例如对于字符串 “ababa”，如果我们已经知道 “bab” 是回文串，那么 “ababa” 一定是回文串，这是因为它的首尾两个字母都是 “a”。

根据这样的思路，我们就可以用动态规划的方法解决本题。我们用 `P(i,j)` 表示字符串 s 的第 i 到 j 个字母组成的串（下文表示成 `s[i:j]`）是否为回文串：

$ cases(
P(i,j)="true" " 如果子串 "S_i…S_j"是回文串",
P(i,j)="false""  其它情况"
) $
  
这里的「其它情况」包含两种可能性：

- `s[i,j]` 本身不是一个回文串；
- $i>j$，此时 `s[i,j]` 本身不合法。

那么我们就可以写出动态规划的状态转移方程：

$ P(i,j)=P(i+1,j−1)∧(S_i==S_j) $

也就是说，只有 `s[i+1:j−1]` 是回文串，并且 s 的第 i 和 j 个字母相同时，`s[i:j]` 才会是回文串。

上文的所有讨论是建立在子串长度大于 2 的前提之上的，我们还需要考虑动态规划中的边界条件，即子串的长度为 1 或 2。对于长度为 1 的子串，它显然是个回文串；对于长度为 2 的子串，只要它的两个字母相同，它就是一个回文串。因此我们就可以写出动态规划的边界条件：
$ cases(
P(i,i)="true",
P(i,i+1)=(S_i==S_{i+1})
) $

 
根据这个思路，我们就可以完成动态规划了，最终的答案即为所有 `P(i,j)=true` 中 `j−i+1`（即子串长度）的最大值。#YellowText[注意：在状态转移方程中，我们是从长度较短的字符串向长度较长的字符串进行转移的，因此一定要注意动态规划的循环顺序。]
  ],code:[
```cpp
#include <iostream>
#include <string>
#include <vector>

using namespace std;

class Solution {
public:
    string longestPalindrome(string s) {
        int n = s.size();
        if (n < 2) {
            return s;
        }

        int maxLen = 1;
        int begin = 0;
        // dp[i][j] 表示 s[i..j] 是否是回文串
        vector<vector<int>> dp(n, vector<int>(n));
        // 初始化：所有长度为 1 的子串都是回文串
        for (int i = 0; i < n; i++) {
            dp[i][i] = true;
        }
        // 递推开始
        // 先枚举子串长度
        for (int L = 2; L <= n; L++) {
            // 枚举左边界，左边界的上限设置可以宽松一些
            for (int i = 0; i < n; i++) {
                // 由 L 和 i 可以确定右边界，即 j - i + 1 = L 得
                int j = L + i - 1;
                // 如果右边界越界，就可以退出当前循环
                if (j >= n) {
                    break;
                }

                if (s[i] != s[j]) {
                    dp[i][j] = false;
                } else {
                    if (j - i < 3) {
                        dp[i][j] = true;
                    } else {
                        dp[i][j] = dp[i + 1][j - 1];
                    }
                }

                // 只要 dp[i][L] == true 成立，就表示子串 s[i..L] 是回文，此时记录回文长度和起始位置
                if (dp[i][j] && j - i + 1 > maxLen) {
                    maxLen = j - i + 1;
                    begin = i;
                }
            }
        }
        return s.substr(begin, maxLen);
    }
};
```      
  ]),
    ( name:[中心扩展算法],
    text:[
我们仔细观察一下方法一中的状态转移方程：

$ cases(
P(i,j)="true",
P(i,i+1)=(S_i==S_{i+1}),
P(i,j)=P(i+1,j−1)∧(S_i==S_j)
) $

找出其中的状态转移链：

$ P(i,j)←P(i+1,j−1)←P(i+2,j−2)←⋯←"某一边界情况" $
可以发现，#BlueText[所有的状态在转移的时候的可能性都是唯一的]。也就是说，我们可以从每一种边界情况开始「扩展」，也可以得出所有的状态对应的答案。

边界情况即为子串长度为 1 或 2 的情况。我们枚举每一种边界情况，并从对应的子串开始不断地向两边扩展。如果两边的字母相同，我们就可以继续扩展，例如从 `P(i+1,j−1)` 扩展到 `P(i,j)`；如果两边的字母不同，我们就可以停止扩展，因为在这之后的子串都不能是回文串了。

聪明的读者此时应该可以发现，「边界情况」对应的子串实际上就是我们「扩展」出的回文串的「回文中心」。方法二的本质即为：我们枚举所有的「回文中心」并尝试「扩展」，直到无法扩展为止，此时的回文串长度即为此「回文中心」下的最长回文串长度。我们对所有的长度求出最大值，即可得到最终的答案。
  ],code:[
```cpp
class Solution {
public:
    pair<int, int> expandAroundCenter(const string& s, int left, int right) {
        while (left >= 0 && right < s.size() && s[left] == s[right]) {
            --left;
            ++right;
        }
        return {left + 1, right - 1};
    }

    string longestPalindrome(string s) {
        int start = 0, end = 0;
        for (int i = 0; i < s.size(); ++i) {
            auto [left1, right1] = expandAroundCenter(s, i, i);
            auto [left2, right2] = expandAroundCenter(s, i, i + 1);
            if (right1 - left1 > end - start) {
                start = left1;
                end = right1;
            }
            if (right2 - left2 > end - start) {
                start = left2;
                end = right2;
            }
        }
        return s.substr(start, end - start + 1);
    }
};
```      
  ]),
    ( name:[Manacher 算法],
    text:[
略
  ],code:[
```cpp
class Solution {
public:
    int expand(const string& s, int left, int right) {
        while (left >= 0 && right < s.size() && s[left] == s[right]) {
            --left;
            ++right;
        }
        return (right - left - 2) / 2;
    }

    string longestPalindrome(string s) {
        int start = 0, end = -1;
        string t = "#";
        for (char c: s) {
            t += c;
            t += '#';
        }
        t += '#';
        s = t;

        vector<int> arm_len;
        int right = -1, j = -1;
        for (int i = 0; i < s.size(); ++i) {
            int cur_arm_len;
            if (right >= i) {
                int i_sym = j * 2 - i;
                int min_arm_len = min(arm_len[i_sym], right - i);
                cur_arm_len = expand(s, i - min_arm_len, i + min_arm_len);
            } else {
                cur_arm_len = expand(s, i, i);
            }
            arm_len.push_back(cur_arm_len);
            if (i + cur_arm_len > right) {
                j = i;
                right = i + cur_arm_len;
            }
            if (cur_arm_len * 2 + 1 > end - start) {
                start = i - cur_arm_len;
                end = i + cur_arm_len;
            }
        }

        string ans;
        for (int i = start; i <= end; ++i) {
            if (s[i] != '#') {
                ans += s[i];
            }
        }
        return ans;
    }
};
```      
  ])

  ),

  gain:none,
)