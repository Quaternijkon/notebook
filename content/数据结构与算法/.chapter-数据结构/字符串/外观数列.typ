#import "../../../../lib.typ":*

=== #Title(
  title: [外观数列],
  reflink: "https://leetcode.cn/problems/count-and-say/description/",
  level: 2,
)<外观数列>

#note(
  title: [
外观数列
  ],

  description: [
「外观数列」是一个数位字符串序列，由递归公式定义：

countAndSay(1) = "1"

countAndSay(n) 是 countAndSay(n-1) 的行程长度编码。
 

行程长度编码（RLE）是一种字符串压缩方法，其工作原理是通过将连续相同字符（重复两次或更多次）替换为字符重复次数（运行长度）和字符的串联。例如，要压缩字符串 "3322251" ，我们将 "33" 用 "23" 替换，将 "222" 用 "32" 替换，将 "5" 用 "15" 替换并将 "1" 用 "11" 替换。因此压缩后字符串变为 "23321511"。

给定一个整数 n ，返回 外观数列 的第 n 个元素。
  ],

  examples: ([
输入：n = 4

输出："1211"

解释：

countAndSay(1) = "1"

countAndSay(2) = "1" 的行程长度编码 = "11"

countAndSay(3) = "11" 的行程长度编码 = "21"

countAndSay(4) = "21" 的行程长度编码 = "1211"    
    ],[
输入：n = 1

输出："1"

解释：

这是基本情况。      
    ]
  ),

  tips: [
- $1 <= n <= 30$
  ],

  solutions: (
  ( name:[遍历生成],
    text:[
1. 初始化字符串 `ans` 为 "1"。
2. 从2到n依次生成每一项报数序列：
   - 对当前的 `ans` 字符串，计算其报数结果。具体步骤如下：
     - 初始化一个空字符串 `cur`，用于存放当前项的报数结果。
     - 遍历 `ans` 字符串，使用双指针来计数连续相同的字符数量。
     - 当字符不相同时，将计数结果和字符追加到 `cur` 中。
   - 将 `cur` 更新为新的 `ans`。
3. 最终返回 `ans`。
  ],code:[
```cpp
class Solution {
public:
    string countAndSay(int n) {
        string ans = "1"; // 初始值为 "1"
        for (int i = 2; i <= n; i++) { // 从第2项开始生成，直到第n项
            string cur = ""; // 用于存放当前项的报数结果
            for (int j = 0; j < ans.size(); j++) { // 遍历当前的 ans 字符串
                int cnt = 1; // 计数器，统计相同字符的数量
                // 统计相同字符的数量
                while (j + 1 < ans.size() && ans[j] == ans[j + 1]) {
                    j++;
                    cnt++;
                }
                // 将计数结果和字符追加到 cur 中
                cur += to_string(cnt) + ans[j];
            }
            ans = cur; // 更新 ans 为当前项的报数结果
        }
        return ans; // 返回第n项的报数结果
    }
};
```      
  ]),

  ),

  gain:none,
)
