#import "../../../../lib.typ":*

=== #Title(
  title: [字母迷宫],
  reflink: "https://leetcode.cn/problems/ju-zhen-zhong-de-lu-jing-lcof/description/",
  level: 2,
)<字母迷宫>

#note(
  title: [
字母迷宫
  ],

  description: [
#align(center,{image("img/solution1.png")})
字母迷宫游戏初始界面记作 $m × n$ 二维字符串数组 grid，请判断玩家是否能在 grid 中找到目标单词 target。
注意：寻找单词时 必须 按照字母顺序，通过水平或垂直方向相邻的单元格内的字母构成，同时，同一个单元格内的字母 不允许被重复使用 。
  ],

  examples: ([
输入：grid = [
  ["A","B","C","E"],
  ["S","F","C","S"],
  ["A","D","E","E"]
  ], target = "ABCCED"

输出：true    
    ],[
输入：grid = [
  ["A","B","C","E"],
  ["S","F","C","S"],
  ["A","D","E","E"]
  ], target = "ABCB"

输出：false      
    ]
  ),

  tips: [
m == grid.length

n = grid[i].length

1 <= m, n <= 6

1 <= target.length <= 15

grid 和 target 仅由大小写英文字母组成
  ],

  solutions: (
  ( name:[深度优先搜索+剪枝],
    text:[
本问题是典型的回溯问题，可使用 深度优先搜索（DFS）+ 剪枝 解决。
- 深度优先搜索： 可以理解为暴力法遍历矩阵中所有字符串可能性。DFS 通过递归，先朝一个方向搜到底，再回溯至上个节点，沿另一个方向搜索，以此类推。
- 剪枝： 在搜索中，遇到 这条路不可能和目标字符串匹配成功 的情况（例如：此矩阵元素和目标字符不同、此元素已被访问），则应立即返回，称之为 可行性剪枝 。
下图中的 word 对应本题的 target 。
#align(center,{image("img/solution2.png")})
1. 递归参数： 当前元素在矩阵 grid 中的行列索引 i 和 j ，当前目标字符在 target 中的索引 k 。
2. 终止条件：
	1. 返回 false ： (1) 行或列索引越界 或 (2) 当前矩阵元素与目标字符不同 或 (3) 当前矩阵元素已访问过 （ (3) 可合并至 (2) ） 。
	2. 返回 true ： k = len(target) - 1 ，即字符串 target 已全部匹配。
3. 递推工作：
	1. 标记当前矩阵元素： 将 `grid[i][j]` 修改为 空字符 '' ，代表此元素已访问过，防止之后搜索时重复访问。
	2. 搜索下一单元格： 朝当前元素的 上、下、左、右 四个方向开启下层递归，使用 或 连接 （代表只需找到一条可行路径就直接返回，不再做后续 DFS ），并记录结果至 res 。
	3. 还原当前矩阵元素： 将 `grid[i][j]` 元素还原至初始值，即 `target[k]` 。
4. 返回值： 返回布尔量 res ，代表是否搜索到目标字符串。

  ],code:[
```cpp
class Solution {
public:
    bool wordPuzzle(vector<vector<char>>& grid, string target) {
        rows = grid.size();
        cols = grid[0].size();
        for(int i = 0; i < rows; i++) {
            for(int j = 0; j < cols; j++) {
                if(dfs(grid, target, i, j, 0)) return true;
            }
        }
        return false;
    }
private:
    int rows, cols;
    bool dfs(vector<vector<char>>& grid, string target, int i, int j, int k) {
        if(i >= rows || i < 0 || j >= cols || j < 0 || grid[i][j] != target[k]) return false;
        if(k == target.size() - 1) return true;
        grid[i][j] = '\0';
        bool res = dfs(grid, target, i + 1, j, k + 1) || dfs(grid, target, i - 1, j, k + 1) || 
                      dfs(grid, target, i, j + 1, k + 1) || dfs(grid, target, i , j - 1, k + 1);
        grid[i][j] = target[k];
        return res;
    }
};
```      
  ]),

  ),

  gain:none,
)