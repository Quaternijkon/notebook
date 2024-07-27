#import "../../../lib.typ":*

=== #Title(
  title: [找字符串拼接的最大值],
  reflink: "https://leetcode.cn/problems/ba-shu-zu-pai-cheng-zui-xiao-de-shu-lcof/description/",
  level: 2,
)<找字符串拼接的最大值>

#note(
  title: [
破解闯关密码
  ],

  description: [
闯关游戏需要破解一组密码，闯关组给出的有关密码的线索是：

- 一个拥有密码所有元素的非负整数数组 password
- 密码是 password 中所有元素拼接后得到的最小的一个数
请编写一个程序返回这个密码。
  ],

  examples: ([
输入: password = [15, 8, 7]

输出: "1578"    
    ],[
输入: password = [0, 3, 30, 34, 5, 9]

输出: "03033459"     
    ]
  ),

  tips: [
0 < password.length <= 100

输出结果可能非常大，所以你需要返回一个字符串而不是整数

拼接起来的数字可能会有前导 0，最后结果不需要去掉前导 0
  ],

  solutions: (
  ( name:[快速排序],
    text:[
此题求拼接起来的最小数字，本质上是一个排序问题。设数组 password 中任意两数字的字符串为 x 和 y ，则规定 排序判断规则 为：

- 若拼接字符串 $x+y > y+x$ ，则 x “大于” y ；
- 反之，若 $x+y < y+x$ ，则 x “小于” y ；

x “小于” y 代表：排序完成后，数组中 x 应在 y 左边；“大于” 则反之。

根据以上规则，套用任何排序方法对 password 执行排序即可。

#align(center)[
  #image("img/solution1.png")
  ]
1. 初始化： 字符串列表 strs ，保存各数字的字符串格式；
2. 列表排序： 应用以上 “排序判断规则” ，对 strs 执行排序；
3. 返回值： 拼接 strs 中的所有字符串，并返回。

需修改快速排序函数中的排序判断规则。字符串大小（字典序）对比的实现方法：
- 在 Python 和 C++ 中可直接用 `<` , `>`；
- 在 Java 中使用函数 A.compareTo(B)；
],code:[
```cpp
class Solution {
public:
    string crackPassword(vector<int>& password) {
        vector<string> strs;
        for(int i = 0; i < password.size(); i++)
            strs.push_back(to_string(password[i]));
        quickSort(strs, 0, strs.size() - 1);
        string res;
        for(string s : strs)
            res.append(s);
        return res;
    }
private:
    void quickSort(vector<string>& strs, int l, int r) {
        if(l >= r) return;
        int i = l, j = r;
        while(i < j) {
            while(strs[j] + strs[l] >= strs[l] + strs[j] && i < j) j--;
            while(strs[i] + strs[l] <= strs[l] + strs[i] && i < j) i++;
            swap(strs[i], strs[j]);
        }
        swap(strs[i], strs[l]);
        quickSort(strs, l, i - 1);
        quickSort(strs, i + 1, r);
    }
};
```      
  ]),(
  name:[内置函数],
  text:[
需定义排序规则：
- Python 定义在函数 `sort_rule(x, y)` 中；
- Java 定义为 `(x, y) -> (x + y).compareTo(y + x)` ；
- C++ 定义为`(string& x, string& y){ return x + y < y + x; }` ；
  ],
  code:[
```cpp
class Solution {
public:
    string crackPassword(vector<int>& password) {
        vector<string> strs;
        string res;
        for(int i = 0; i < password.size(); i++)
            strs.push_back(to_string(password[i]));
        sort(strs.begin(), strs.end(), [](string& x, string& y){ return x + y < y + x; });
        for(int i = 0; i < strs.size(); i++)
            res.append(strs[i]);
        return res;
    }
};
```
  ]
  )

  ),

  gain:none,
)