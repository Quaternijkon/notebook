#import "../../../lib.typ":*

=== #Title(
  title: [岛屿数量],
  reflink: "https://leetcode.cn/problems/number-of-islands/description/",
  level: 2,
)<岛屿数量>

#note(
  title: [
岛屿数量
  ],

  description: [
给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。
岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。
此外，你可以假设该网格的四条边均被水包围。
  ],

  examples: ([
输入：grid = [

["1","1","1","1","0"],

["1","1","0","1","0"],

["1","1","0","0","0"],

["0","0","0","0","0"]

]
输出：1    

    ],[
输入：grid = [

["1","1","0","0","0"],

["1","1","0","0","0"],

["0","0","1","0","0"],

["0","0","0","1","1"]

]

输出：3      

    ]
  ),

  tips: [
m == grid.length

n == grid[i].length

1 <= m, n <= 300

grid[i][j] 的值为 '0' 或 '1'
  ],

  solutions: (
  ( name:[深度优先搜索],
    text:[
我们可以将二维网格看成一个无向图，竖直或水平相邻的 1 之间有边相连。

为了求出岛屿的数量，我们可以扫描整个二维网格。如果一个位置为 1，则以其为起始节点开始进行深度优先搜索。在深度优先搜索的过程中，每个搜索到的 1 都会被重新标记为 0。

最终岛屿的数量就是我们进行深度优先搜索的次数。
  ],code:[
```cpp
class Solution {
private:
    const char LAND='1';
    const char SEA='0';
    const vector<pair<int,int>> DIRECTIONS={{1,0},{-1,0},{0,1},{0,-1}};

    void dfs(vector<vector<char>>& grid,int r, int c){
        int m=grid.size();
        int n=grid[0].size();
        grid[r][c]=SEA;
        for(auto direction:DIRECTIONS){
            int row=r+direction.first;
            int col=c+direction.second;
            if(row<0||row>=m||col<0||col>=n||grid[row][col]==SEA)
                continue;
            dfs(grid,row,col);
        }
    }

public:
    int numIslands(vector<vector<char>>& grid) {
        int m=grid.size();
        if(m==0) return 0;
        int n=grid[0].size();
        int cnt=0;
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                if(grid[i][j]==LAND){
                    cnt++;
                    dfs(grid, i, j);
                }
            }
        }
        return cnt;
    }
};
```      
  ]),(
  name:[广度优先搜索],
    text:[
同样地，我们也可以使用广度优先搜索代替深度优先搜索。

为了求出岛屿的数量，我们可以扫描整个二维网格。如果一个位置为 1，则将其加入队列，开始进行广度优先搜索。在广度优先搜索的过程中，每个搜索到的 1 都会被重新标记为 0。直到队列为空，搜索结束。

最终岛屿的数量就是我们进行广度优先搜索的次数。      
    ],
    code:[
```cpp
class Solution {
private:
    const char LAND='1';
    const char SEA='0';
    const char VISITED='2';
    const vector<pair<int,int>> DIRECTIONS={{1,0},{-1,0},{0,1},{0,-1}};

public:
    int numIslands(vector<vector<char>>& grid) {
        int m=grid.size();
        if(m==0) return 0;
        int n=grid[0].size();
        int cnt=0;
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                if(grid[i][j]==LAND){
                    cnt++;
                    grid[i][j]=VISITED;
                    queue<pair<int,int>> que;
                    que.push({i,j});
                    while(!que.empty()){
                        auto point=que.front();
                        que.pop();
                        int row=point.first;
                        int col=point.second;
                        for(auto direction:DIRECTIONS){
                            int r=row+direction.first;
                            int c=col+direction.second;
                            if(r<0||r>=m||c<0||c>=n||grid[r][c]!=LAND)
                                continue;
                            que.push({r,c});
                            grid[r][c]=VISITED;
                        }

                    }
                }
            }
        }
        return cnt;        
    }
};
```
    ],
  ),(
  name:[并查集],
    text:[同样地，我们也可以使用并查集代替搜索。

为了求出岛屿的数量，我们可以扫描整个二维网格。如果一个位置为 1，则将其与相邻四个方向上的 1 在并查集中进行合并。

最终岛屿的数量就是并查集中连通分量的数目。],
    code:[
```cpp
class UnionFind {
public:
    UnionFind(vector<vector<char>>& grid) {
        count = 0;
        int m = grid.size();
        int n = grid[0].size();
        for (int i = 0; i < m; ++i) {
            for (int j = 0; j < n; ++j) {
                if (grid[i][j] == '1') {
                    parent.push_back(i * n + j);
                    ++count;
                }
                else {
                    parent.push_back(-1);
                }
                rank.push_back(0);
            }
        }
    }

    int find(int i) {
        if (parent[i] != i) {
            parent[i] = find(parent[i]);
        }
        return parent[i];
    }

    void unite(int x, int y) {
        int rootx = find(x);
        int rooty = find(y);
        if (rootx != rooty) {
            if (rank[rootx] < rank[rooty]) {
                swap(rootx, rooty);
            }
            parent[rooty] = rootx;
            if (rank[rootx] == rank[rooty]) rank[rootx] += 1;
            --count;
        }
    }

    int getCount() const {
        return count;
    }

private:
    vector<int> parent;
    vector<int> rank;
    int count;
};

class Solution {
public:
    int numIslands(vector<vector<char>>& grid) {
        int nr = grid.size();
        if (!nr) return 0;
        int nc = grid[0].size();

        UnionFind uf(grid);
        int num_islands = 0;
        for (int r = 0; r < nr; ++r) {
            for (int c = 0; c < nc; ++c) {
                if (grid[r][c] == '1') {
                    grid[r][c] = '0';
                    if (r - 1 >= 0 && grid[r-1][c] == '1') uf.unite(r * nc + c, (r-1) * nc + c);
                    if (r + 1 < nr && grid[r+1][c] == '1') uf.unite(r * nc + c, (r+1) * nc + c);
                    if (c - 1 >= 0 && grid[r][c-1] == '1') uf.unite(r * nc + c, r * nc + c - 1);
                    if (c + 1 < nc && grid[r][c+1] == '1') uf.unite(r * nc + c, r * nc + c + 1);
                }
            }
        }

        return uf.getCount();
    }
};
```      
    ]
  )

  ),

  gain:none,
)