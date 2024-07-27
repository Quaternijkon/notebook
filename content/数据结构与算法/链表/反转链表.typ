#import "../../../lib.typ":*

=== #Title(
  title: [反转链表],
  reflink: "https://leetcode.cn/problems/reverse-linked-list/description/",
  level: 1,
)<反转链表>

#note(
  title: [
    反转链表
  ],

  description: [
    给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
  ],

  examples: ([
输入：head = [1,2,3,4,5]

输出：[5,4,3,2,1]    
    ],[
输入：head = [1,2]

输出：[2,1]      
    ],[
输入：head = []

输出：[]      
    ]
  ),

  tips: [
链表中节点的数目范围是 [0, 5000]

-5000 <= Node.val <= 5000
  ],

  solutions: (
  (name:[迭代],
    text:[
考虑遍历链表，并在访问各节点时修改 `next` 引用指向，算法流程见注释。
  ],code:[
```cpp
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode *cur = head, *pre = nullptr;
        while(cur != nullptr) {
            ListNode* tmp = cur->next; // 暂存后继节点 cur.next
            cur->next = pre;           // 修改 next 引用指向
            pre = cur;                 // pre 暂存 cur
            cur = tmp;                 // cur 访问下一节点
        }
        return pre;
    }
};
```      
  ]),(
name:[递归],
text:[
考虑使用递归法遍历链表，当越过尾节点后终止递归，在回溯时修改各节点的 `next` 引用指向。

`recur(cur, pre)` 递归函数：
+ 终止条件：当 `cur` 为空，则返回尾节点 `pre` （即反转链表的头节点）；
+ 递归后继节点，记录返回值（即反转链表的头节点）为 `res` ；
+ 修改当前节点 `cur` 引用指向前驱节点 `pre` ；
+ 返回反转链表的头节点 `res` ；

`reverseList(head)` 函数：

调用并返回 `recur(head, null)` 。传入 `null` 是因为反转链表后， `head` 节点指向 `null` ；
],code:[
```cpp
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        return recur(head, nullptr);           // 调用递归并返回
    }
private:
    ListNode* recur(ListNode* cur, ListNode* pre) {
        if (cur == nullptr) return pre;        // 终止条件
        ListNode* res = recur(cur->next, cur); // 递归后继节点
        cur->next = pre;                       // 修改节点引用指向
        return res;                            // 返回反转链表的头节点
    }
};
```
]
  ),

  ),

  gain:none,
)
