import Foundation

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
        
        if node == head {
            head = head?.next
        }
        if node == tail {
            tail = node?.prev
        }
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
