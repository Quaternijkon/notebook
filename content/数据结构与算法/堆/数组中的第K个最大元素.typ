#import "../../../lib.typ":*

=== #Title(
  title: [数组中的第K个最大元素],
  reflink: "https://leetcode.cn/problems/kth-largest-element-in-an-array/description/",
  level: 2,
)

#note(
  title: [
数组中的第K个最大元素
  ],

  description: [
给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。

请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
  ],

  examples: ([
输入: [3,2,1,5,6,4], k = 2

输出: 5    
    ],[
输入: [3,2,3,1,2,4,5,5,6], k = 4

输出: 4      
    ]
  ),

  tips: [
1 <= k <= nums.length <= $10^5$

$-10^4$ <= nums[i] <= $10^4$
  ],

  solutions: (
  ( name:[基于快速排序的选择方法],
    text:[
我们可以用快速排序来解决这个问题，先对原数组排序，再返回倒数第 k 个位置，这样平均时间复杂度是 O(nlogn)，但其实我们可以做的更快。

首先我们来回顾一下快速排序，这是一个典型的分治算法。我们对数组 `a[l⋯r]` 做快速排序的过程是（参考《算法导论》）：

- 分解： 将数组 `a[l⋯r]` 「划分」成两个子数组 `a[l⋯q−1]`、`a[q+1⋯r]`，使得 `a[l⋯q−1]` 中的每个元素小于等于 `a[q]`，且 `a[q]` 小于等于 `a[q+1⋯r]` 中的每个元素。其中，计算下标 q 也是「划分」过程的一部分。
- 解决： 通过递归调用快速排序，对子数组 `a[l⋯q−1]` 和 `a[q+1⋯r]` 进行排序。
- 合并： 因为子数组都是原址排序的，所以不需要进行合并操作，`a[l⋯r]` 已经有序。
- 上文中提到的 「划分」 过程是：从子数组 `a[l⋯r]` 中选择任意一个元素 x 作为主元，调整子数组的元素使得左边的元素都小于等于它，右边的元素都大于等于它， x 的最终位置就是 q。
由此可以发现每次经过「划分」操作后，我们一定可以确定一个元素的最终位置，即 x 的最终位置为 q，并且保证 `a[l⋯q−1]` 中的每个元素小于等于 `a[q]`，且 `a[q]` 小于等于 `a[q+1⋯r]` 中的每个元素。所以只要某次划分的 q 为倒数第 k 个下标的时候，我们就已经找到了答案。 我们只关心这一点，至于 `a[l⋯q−1]` 和 `a[q+1⋯r]` 是否是有序的，我们不关心。

因此我们可以改进快速排序算法来解决这个问题：在分解的过程当中，我们会对子数组进行划分，如果划分得到的 q 正好就是我们需要的下标，就直接返回 `a[q]`；否则，如果 q 比目标下标小，就递归右子区间，否则递归左子区间。这样就可以把原来递归两个区间变成只递归一个区间，提高了时间效率。
  ],code:[
```cpp
class Solution {
public:
    int quickselect(vector<int> &nums, int l, int r, int k) {
        if (l == r)
            return nums[k];
        int partition = nums[l], i = l - 1, j = r + 1;
        while (i < j) {
            do i++; while (nums[i] < partition);
            do j--; while (nums[j] > partition);
            if (i < j)
                swap(nums[i], nums[j]);
        }
        if (k <= j)return quickselect(nums, l, j, k);
        else return quickselect(nums, j + 1, r, k);
    }

    int findKthLargest(vector<int> &nums, int k) {
        int n = nums.size();
        return quickselect(nums, 0, n - 1, n - k);
    }
};
```      
  ]),  ( name:[基于堆排序的选择方法],
    text:[
我们也可以使用堆排序来解决这个问题——建立一个大根堆，做 k−1 次删除操作后堆顶元素就是我们要找的答案。
  ],code:[
```cpp
class Solution {
public:
    void maxHeapify(vector<int>& a, int i, int heapSize) {
        int l = i * 2 + 1, r = i * 2 + 2, largest = i;
        if (l < heapSize && a[l] > a[largest]) {
            largest = l;
        } 
        if (r < heapSize && a[r] > a[largest]) {
            largest = r;
        }
        if (largest != i) {
            swap(a[i], a[largest]);
            maxHeapify(a, largest, heapSize);
        }
    }

    void buildMaxHeap(vector<int>& a, int heapSize) {
        for (int i = heapSize / 2; i >= 0; --i) {
            maxHeapify(a, i, heapSize);
        } 
    }

    int findKthLargest(vector<int>& nums, int k) {
        int heapSize = nums.size();
        buildMaxHeap(nums, heapSize);
        for (int i = nums.size() - 1; i >= nums.size() - k + 1; --i) {
            swap(nums[0], nums[i]);
            --heapSize;
            maxHeapify(nums, 0, heapSize);
        }
        return nums[0];
    }
};
```      
  ])

  ),

  gain:none,
)