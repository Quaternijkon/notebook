#import "../../../../lib.typ":*

=== #Title(
  title: [逆序对],
  reflink: "https://leetcode.cn/problems/shu-zu-zhong-de-ni-xu-dui-lcof/description/",
  level: 2,
)<逆序对>

#note(
  title: [
交易逆序对的总数
  ],

  description: [
在股票交易中，如果前一天的股价高于后一天的股价，则可以认为存在一个「交易逆序对」。请设计一个程序，输入一段时间内的股票交易记录 record，返回其中存在的「交易逆序对」总数。
  ],

  examples: ([
输入：record = [9, 7, 5, 4, 6]

输出：8

解释：交易中的逆序对为 (9, 7), (9, 5), (9, 4), (9, 6), (7, 5), (7, 4), (7, 6), (5, 4)。    
    ],
  ),

  tips: [
$0 <= "record.length" <= 50000$
  ],

  solutions: (
  ( name:[分治],
    text:[
「归并排序」与「逆序对」是息息相关的。归并排序体现了 “分而治之” 的算法思想，具体为：

- 分： 不断将数组从中点位置划分开（即二分法），将整个数组的排序问题转化为子数组的排序问题；
- 治： 划分到子数组长度为 1 时，开始向上合并，不断将 较短排序数组 合并为 较长排序数组，直至合并至原数组时完成排序；


合并阶段 本质上是 合并两个排序数组 的过程，而每当遇到 左子数组当前元素 > 右子数组当前元素 时，意味着 「左子数组当前元素 至 末尾元素」 与 「右子数组当前元素」 构成了若干 「逆序对」 。

因此，考虑在归并排序的合并阶段统计「逆序对」数量，完成归并排序时，也随之完成所有逆序对的统计。

`merge_sort() `归并排序与逆序对统计：

1. 终止条件： 当 $l!=r$ 时，代表子数组长度为 1 ，此时终止划分；
2. 递归划分： 计算数组中点 m ，递归划分左子数组 merge_sort(l, m) 和右子数组 merge_sort(m + 1, r) ；
3. 合并与逆序对统计：
	1. 暂存数组 record 闭区间 $[l,r]$ 内的元素至辅助数组 tmp ；
	2. 循环合并： 设置双指针 i , j 分别指向左 / 右子数组的首元素；
		- 当 i = m + 1 时： 代表左子数组已合并完，因此添加右子数组当前元素 `tmp[j]` ，并执行j = j + 1 ；
		- 否则，当 j=r+1 时： 代表右子数组已合并完，因此添加左子数组当前元素 `tmp[i]` ，并执行 i=i+1 ；
		- 否则，当 $"tmp"[i] != "tmp"[j]$ 时： 添加左子数组当前元素 `tmp[i]` ，并执行 i=i+1；
		- 否则（即 $"tmp"[i] > "tmp"[j]$）时： 添加右子数组当前元素 `tmp[j]` ，并执行 j=j+1 ；此时构成 m−i+1 个「逆序对」，统计添加至 res ；
4. 返回值： 返回直至目前的逆序对总数 res ；

`reversePairs() `主函数：
1. 初始化： 辅助数组 tmp ，用于合并阶段暂存元素；
2. 返回值： 执行归并排序 merge_sort() ，并返回逆序对总数即可；

为简化代码，可将“当 j=r+1 时”与“当 $"tmp"[i] != "tmp"[j]$时”两判断项合并。
  ],code:[
```cpp
class Solution {
public:
    int reversePairs(vector<int>& record) {
        vector<int> tmp(record.size());
        return mergeSort(0, record.size() - 1, record, tmp);
    }
private:
    int mergeSort(int l, int r, vector<int>& record, vector<int>& tmp) {
        // 终止条件
        if (l >= r) return 0;
        // 递归划分
        int m = (l + r) / 2;
        int res = mergeSort(l, m, record, tmp) + mergeSort(m + 1, r, record, tmp);
        // 合并阶段
        int i = l, j = m + 1;
        for (int k = l; k <= r; k++)
            tmp[k] = record[k];
        for (int k = l; k <= r; k++) {
            if (i == m + 1)
                record[k] = tmp[j++];
            else if (j == r + 1 || tmp[i] <= tmp[j])
                record[k] = tmp[i++];
            else {
                record[k] = tmp[j++];
                res += m - i + 1; // 统计逆序对
            }
        }
        return res;
    }
};
```      
  ]),

  ),

  gain:none,
)