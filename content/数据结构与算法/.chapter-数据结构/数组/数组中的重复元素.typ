#import "../../../../lib.typ":*

// ===  数组中的重复元素 #Link("https://leetcode.cn/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/description/")

=== #Title(
  title: [数组中的重复元素],
  reflink: "https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/description/",
  level: 1,
)<数组中的重复元素>

#note(
  title: [寻找文件副本],
  description: [设备中存有 n 个文件，文件 id 记于数组 documents。若文件 id 相同，则定义为该文件存在副本。请返回任一存在副本的文件 id。],
  examples: (
    [
      输入：documents = [2, 5, 3, 0, 5, 0]
      
      输出：0 或 5
    ],
  ),
  tips: [0 ≤ documents[i] ≤ n-1

2 <= n <= 100000],

  solutions: (
    (name:[遍历],
      text:[
遍历中，第一次遇到数字 x 时，将其交换至索引 x 处；而当第二次遇到数字 x 时，一定有 documents[x]=x ，此时即可得到一组重复数字。
    ],code:
    [
```cpp
class Solution {
public:
    int findRepeatDocument(vector<int>& documents) {
        int i = 0;
        while(i < documents.size()) {
            if(documents[i] == i) {
                i++;
                continue;
            }
            if(documents[documents[i]] == documents[i])
                return documents[i];
            swap(documents[i],documents[documents[i]]);
        }
        return -1;
    }
};
```      
    ]

    ),
  ),

  gain:none,
)



// #BlueText("数组中的重复元素")