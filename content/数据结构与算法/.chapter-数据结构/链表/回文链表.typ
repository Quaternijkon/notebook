#import "../../../../lib.typ":*

=== #Title(
  title: [回文链表],
  reflink: "https://leetcode.cn/problems/palindrome-linked-list/description/",
  level: 1,
)<回文链表>

#note(
  title: [
回文链表
  ],

  description: [
给你一个单链表的头节点 head ，请你判断该链表是否为回文链表。如果是，返回 true ；否则，返回 false 。
  ],

  examples: ([
输入：head = [1,2,2,1]

输出：true    
    ],[
输入：head = [1,2]

输出：false      
    ]
  ),

  tips: [
链表中节点数目在范围[1, 105] 内

0 <= Node.val <= 9
  ],

  solutions: (
  ( name:[反转一半链表],
    text:[
1. **特殊情况处理**：
   - 如果链表为空或者只有一个节点，则直接返回 `true`，因为空链表和单节点链表都是回文的。

2. **找到链表的中间节点**：
   - 使用快慢指针法。快指针 `fast` 每次移动两步，慢指针 `slow` 每次移动一步。当快指针到达链表末尾时，慢指针正好到达链表中间。

3. **翻转链表的后半部分**：
   - 从中间节点的下一个节点开始，将后半部分链表翻转。我们使用三个指针 `pre`、`cur` 和 `next` 依次指向前一个节点、当前节点和下一个节点，逐步翻转节点的 `next` 指针。

4. **比较两部分链表**：
   - 将前半部分和翻转后的后半部分逐一比较，如果所有节点值都相等，则链表是回文的。
  ],code:[
```cpp
class Solution {
public:
    bool isPalindrome(ListNode* head) {
        if (!head || !head->next) {
            return true;
        }
        ListNode* slow = head;
        ListNode* fast = head;
        while (fast->next && fast->next->next) {
            slow = slow->next;
            fast = fast->next->next;
        }
        ListNode* pre = nullptr;
        ListNode* cur = slow->next;
        ListNode* next = nullptr;
        while (cur) {
            next = cur->next;
            cur->next = pre;
            pre = cur;
            cur = next;
        }
        slow->next = pre;
        slow = slow->next;
        while (slow) {
            if (head->val != slow->val) {
                return false;
            }
            head = head->next;
            slow = slow->next;
        }
        return true;

    }
};
```      
  ]),

  ),

  gain:none,
)
