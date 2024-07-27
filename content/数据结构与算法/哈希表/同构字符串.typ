#import "../../../lib.typ":*

=== #Title(
  title: [同构字符串],
  reflink: "https://leetcode.cn/problems/isomorphic-strings/description/",
  level: 1,
)<同构字符串>

#note(
  title: [
同构字符串
  ],

  description: [
给定两个字符串 s 和 t ，判断它们是否是同构的。

如果 s 中的字符可以按某种映射关系替换得到 t ，那么这两个字符串是同构的。

每个出现的字符都应当映射到另一个字符，同时不改变字符的顺序。不同字符不能映射到同一个字符上，相同字符只能映射到同一个字符上，字符可以映射到自己本身。
  ],

  examples: ([
输入：s = "egg", t = "add"

输出：true    
    ],[
输入：s = "foo", t = "bar"

输出：false      
    ],[
输入：s = "paper", t = "title"

输出：true
       
    ]
  ),

  tips: [
1 <= s.length <= $5 * 10^4$

t.length == s.length

s 和 t 由任意有效的 ASCII 字符组成
  ],

  solutions: (
  ( name:[散列表],
    text:[
使用两个映射表分别记录字符串 `s` 和 `t` 中每个字符的第一次出现位置，然后检查两个字符串对应位置的字符是否具有相同的第一次出现位置，以判断是否同构。
  ],code:[
```cpp
class Solution {
public:
    bool isIsomorphic(string s, string t) {
        int n=s.size();
        unordered_map<char,int> smap;
        unordered_map<char,int> tmap;
        
        for(int i=0;i<n;++i)
            if(smap[s[i]]==0) smap[s[i]]=i+1;
        for(int i=0;i<n;++i)
            if(tmap[t[i]]==0) tmap[t[i]]=i+1;
        for(int i=0;i<n;++i)
            if(smap[s[i]]!=tmap[t[i]]) return false;
        return true;
    }
};
```      
  ]),

  ),

  gain:none,
)