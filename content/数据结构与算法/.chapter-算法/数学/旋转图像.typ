#import "../../../../lib.typ":*

=== #Title(
  title: [旋转图像],
  reflink: "https://leetcode.cn/problems/rotate-image/description/",
  level: 1,
)<旋转图像>

#note(
  title: [
旋转图像
  ],

  description: [
给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。

你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。
  ],

  examples: ([
#figure(
  image("./img/mat1.jpg", width: 50%)
)

输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]

输出：[[7,4,1],[8,5,2],[9,6,3]]
    ],[
#figure(
  image("./img/mat2.jpg", width: 50%)
)      
输入：matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]

输出：[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
    ]
  ),

  tips: [
- $n == "matrix.length" == "matrix"[i]."length"$
- $1 <= n <= 20$
- $-1000 <= "matrix"[i][j] <= 1000$
  ],

  solutions: (
  ( name:[用翻转代替旋转],
    text:[

  ],code:[
```cpp
class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {
        int n = matrix.size();
        // 水平翻转
        for (int i = 0; i < n / 2; i++) {
            for (int j = 0; j < n; j++) {
                swap(matrix[i][j], matrix[n - i - 1][j]);
            }
        }
        // 主对角线翻转
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < i; j++) {
                swap(matrix[i][j], matrix[j][i]);
            }
        }

    }
};
```      
  ]),

  ),

  gain:none,
)
