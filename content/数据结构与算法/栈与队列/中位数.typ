#import "../../../lib.typ":*

=== #Title(
  title: [中位数],
  reflink: "https://leetcode.cn/problems/shu-ju-liu-zhong-de-zhong-wei-shu-lcof/description/",
  level: 3,
)

#note(
  title: [
数据流中的中位数
  ],

  description: [
中位数 是有序整数列表中的中间值。如果列表的大小是偶数，则没有中间值，中位数是两个中间值的平均值。

例如，

- [2,3,4] 的中位数是 3
- [2,3] 的中位数是 $(2 + 3) / 2$ = 2.5

设计一个支持以下两种操作的数据结构：

- `void addNum(int num)` - 从数据流中添加一个整数到数据结构中。
- `double findMedian()` - 返回目前所有元素的中位数。
  ],

  examples: ([
输入：["MedianFinder","addNum","addNum","findMedian","addNum","findMedian"]

[[],[1],[2],[],[3],[]]

输出：[null,null,null,1.50000,null,2.00000]    
    ],[
输入：["MedianFinder","addNum","addNum","findMedian","addNum","findMedian"]

[[],[1],[2],[],[3],[]]

输出：[null,null,null,1.50000,null,2.00000]      
    ]
  ),

  tips: [
最多会对 `addNum`、`findMedian` 进行 50000 次调用。
  ],

  solutions: (
  ( name:[堆],
    text:[
#figure(
  image("img/中位数-堆.png"),
  caption: [堆]
)

`addNum(num)` 函数：

- 当 $m=n$（即 N 为 偶数）：需向 A 添加一个元素。实现方法：将新元素 `num` 插入至 B ，再将 B 堆顶元素插入至 A ；
- 当 $m!=n$（即 N 为 奇数）：需向 B 添加一个元素。实现方法：将新元素 `num` 插入至 A ，再将 A 堆顶元素插入至 B ；

`findMedian()` 函数：

- 当 $m=n$（ N 为 偶数）：则中位数为 ( A 的堆顶元素 + B 的堆顶元素 )/2。
- 当 $m!=n$（ N 为 奇数）：则中位数为 A 的堆顶元素。
  ],code:[
```cpp
class MedianFinder {
public:
    priority_queue<int, vector<int>, greater<int>> A; // 小顶堆，保存较大的一半
    priority_queue<int, vector<int>, less<int>> B; // 大顶堆，保存较小的一半
    MedianFinder() { }
    void addNum(int num) {
        if(A.size() != B.size()) {
            A.push(num);
            B.push(A.top());
            A.pop();
        } else {
            B.push(num);
            A.push(B.top());
            B.pop();
        }
    }
    double findMedian() {
        return A.size() != B.size() ? A.top() : (A.top() + B.top()) / 2.0;
    }
};
```      
  ]),

  ),

  gain:none,
)