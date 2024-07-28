#import "../../../../lib.typ":*

=== #Title(
  title: [买卖股票的最佳时机 II],
  reflink: "https://leetcode.cn/problems/best-time-to-buy-and-sell-stock-ii/description/",
  level: 2
)<买卖股票的最佳时机II>

#note(
  title: [
买卖股票的最佳时机 II
  ],

  description: [
给你一个整数数组 `prices`，其中 `prices[i]` 表示某支股票第 `i` 天的价格。

在每一天，你可以决定是否购买和/或出售股票。你在任何时候 *最多* 只能持有 *一股* 股票。你也可以先购买，然后在 *同一天* 出售。

返回你能获得的 *最大* 利润。
  ],

  examples: ([
输入：prices = [7,1,5,3,6,4]

输出：7

解释：在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4。
随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6 - 3 = 3。
最大总利润为 4 + 3 = 7 。    
    ],[
输入：prices = [1,2,3,4,5]

输出：4

解释：在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4。
最大总利润为 4 。      
    ],[
输入：prices = [7,6,4,3,1]

输出：0

解释：在这种情况下, 交易无法获得正利润，所以不参与交易可以获得最大利润，最大利润为 0。      
    ]
  ),

  tips: [
1 <= prices.length <= $3 * 10^4$
0 <= prices[i] <= $10^4$
  ],

  solutions: (
  ( name:[动态规划],
    text:[
这是一个经典的动态规划问题，可以通过动态规划的方法来求解。我们定义一个二维数组 `dp`，其中：

- `dp[i][0]` 表示在第 `i` 天不持有股票的最大利润。
- `dp[i][1]` 表示在第 `i` 天持有股票的最大利润。

*状态转移方程*

- `dp[i][0]` 可以通过以下两种情况得到：
  1. 前一天也不持有股票，`dp[i-1][0]`
  2. 前一天持有股票，并在今天卖出了，`dp[i-1][1] + prices[i]`
  所以，`dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])`

- `dp[i][1]` 可以通过以下两种情况得到：
  1. 前一天也持有股票，`dp[i-1][1]`
  2. 前一天不持有股票，并在今天买入了，`dp[i-1][0] - prices[i]`
  所以，`dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i])`

*初始条件*

- `dp[0][0] = 0`：第一天不持有股票，利润为0
- `dp[0][1] = -prices[0]`：第一天持有股票，利润为负的股票价格

*最终结果*

我们需要返回在最后一天不持有股票的最大利润，即 `dp[n-1][0]`。
  ],code:[
```cpp
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int n = prices.size();
        if (n == 0) return 0;
        int dp[n][2];
        dp[0][0] = 0;
        dp[0][1] = -prices[0];
        for (int i = 1; i < n; i++) {
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i]);
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] - prices[i]);
        }
        return dp[n-1][0];
    }
};
```      
  ]),(
  name:[贪心算法],
  text:[
*对于单独交易日*:设今天价格 $p_1$、明天价格 $p_2$，则今天买入、明天卖出可赚取金额 $p_2−p_1$（负值代表亏损）。

*对于连续上涨交易日*:设此上涨交易日股票价格分别为 $p_1$, $p_2$, ..., $p_n$，则第一天买最后一天卖收益最大，即 $p_n−p_1$；等价于每天都买卖，即 $p_n−p_1=(p_2−p_1)+(p_3−p_2)+...+(p_n−p_(n-1))$。

*对于连续下降交易日*:则不买卖收益最大，即不会亏钱。

*算法流程*

遍历整个股票交易日价格列表 price，并执行贪心策略：所有上涨交易日都买卖（赚到所有利润），所有下降交易日都不买卖（永不亏钱）。

+ 设 `tmp` 为第 $i-1$ 日买入与第 $i$ 日卖出赚取的利润，即 `tmp = prices[i] - prices[i - 1]`；
+ 当该天利润为正 $"tmp" > 0$，则将利润加入总利润 `profit` ；当利润为 0 或为负，则直接跳过；
+ 遍历完成后，返回总利润 `profit`。

#figure(
  image("./img/solution1.png")
)

  ],
  code:[
```cpp
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int profit = 0;
        for (int i = 1; i < prices.size(); i++) {
            int tmp = prices[i] - prices[i - 1];
            if (tmp > 0) profit += tmp;
        }
        return profit;
    }
};
```    
  ]
  )

  ),

  gain:none,
)
