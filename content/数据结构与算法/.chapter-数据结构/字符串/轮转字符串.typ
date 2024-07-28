#import "../../../../lib.typ":*

=== #Title(
  title: [轮转字符串],
  reflink: "https://leetcode.cn/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof/description/",
  level: 2,
)<轮转字符串>

#note(
  title: [
动态口令
  ],

  description: [
某公司门禁密码使用动态口令技术。初始密码为字符串 password，密码更新均遵循以下步骤：

- 设定一个正整数目标值 target
- 将 password 前 target 个字符按原顺序移动至字符串末尾

请返回更新后的密码字符串。
  ],

  examples: ([
输入: password = "s3cur1tyC0d3", target = 4

输出: "r1tyC0d3s3cu"    
    ],[
输入: password = "lrloseumgh", target = 6

输出: "umghlrlose"      
    ]
  ),

  tips: [
$1 <= "target" < "password.length" <= 10000$
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
    string dynamicPassword(string password, int target) {
        reverse(password.begin(),password.end());
        reverse(password.end()-target,password.end());
        reverse(password.begin(),password.end()-target);
        return password;
    }
};
```      
  ]),

  ),

  gain:none,
)
