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

class LinkedList<Item> : CustomStringConvertible {
  var head: Node<Item>?
  var tail: Node<Item>?
  var count: Int = 0

  func append(_ node: Node<Item>?) {
    if head == nil {
      head = node
    } else {
      tail?.next = node
      node?.prev = tail
      node?.next = nil
    }
    tail = node
    count += 1
  }

  func delete(_ node: Node<Item>?) {
    node?.prev?.next = node?.next
    node?.next?.prev = node?.prev

    if head == node { head = head?.next }
    if head == tail { tail = tail?.prev }
    count -= 1
  }

  var description: String {
    "head: \(head?.item ?? "nil" as Any), tail: \(tail?.item ?? "nil" as Any)\n\thead -> \(head ?? "nil" as Any)"
  }

}

class Node<Item> : Equatable, CustomStringConvertible {
  var next: Node<Item>?
  var prev: Node<Item>?
  var item: Item

  init(_ item: Item) {
    self.item = item
  }

  static func == (lhs: Node, rhs: Node) -> Bool {
    return lhs === rhs
  }

  var description: String {
    guard let next else { return "\(item)" }
    return "\(item) -> \(next)"
  }
}












// Text-based pass/fail for CoderPad
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


