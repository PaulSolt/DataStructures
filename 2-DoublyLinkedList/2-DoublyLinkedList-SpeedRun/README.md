# Doubly Linked List Speed Run

2024-05-15

Speed Run: How fast can you implement the LinkedList without notes?

Task: Implement Doubly `LinkedList<Item>` with `Node<Item>` using generics

1. Store the count of nodes
2. Implement Linked List with methods

	```swift
	var count: Int
	func append(_ node: Node<Item>) // O(1)
	func delete(_ node: Node<Item>) // O(n)
	```

3. Verify all unit tests pass
4. Add a description for debug printing

[Doubly Linked List Speed Run Notes](2-DoublyLinkedList-SpeedRun.pdf)

My best time is 6 minutes.

## Starter Code for CoderPad

```swift
// Implement Doubly Linked List and pass all unit tests

// LinkedList<Item>
//  append()
//  delete()
//  count
// Node<Item>
//  next
//  prev
//  item


// Tips:
// 1. Be brief (less typing)
// 2. Add CustomStringConvertible if needed (at end)
// 3. Equatable implementation depends on questions you ask (unique values, etc.)
// 4. Implement one part at a time (focus your attention)
// 5. Use _ for parameter names to save time typing, choose brief variable names (prev is acceptable for previous)
// 6. Print optional values using `?? "nil" as Any`
// let x: Int? = 5
// print("x: \(x ?? nil as Any)"



// TODO: Implement your LinkedList here



// TESTS: Text-based pass/fail for CoderPad

let list = LinkedList<Int>()
let seven = Node(7)
list.append(seven) // 7

list.append(Node(3))
print("\nInsert 3: \(list)") // 7, 3

list.append(Node(5))
print("\nInsert 5: \(list)") // 7, 3, 5

list.delete(seven)
print("\nDelete 7: \(list)") // 3, 5

print(list.head?.item == 3 ? "pass" : "fail")
print(list.tail?.item == 5 ? "pass" : "fail")

list.append(seven)
print("\nInsert 7: \(list)") // 3, 5, 7

print(list.count == 3 ? "pass" : "fail")
print(list.head?.item == 3 ? "pass" : "fail")
print(list.head?.next?.item == 5 ? "pass" : "fail")
print(list.tail?.item == 7 ? "pass" : "fail")



```