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

// Doubly Linked List
class Node<Item>: CustomStringConvertible, Equatable {
    var item: Item
    var next: Node?
    weak var prev: Node? // PITFALL: Prevent retain cycles using weak
    
    init(_ value: Item) {
        self.item = value
    }
   
    // Recursive description with a base case
    var description: String {
        guard let next else { return "\(item)" }
        return "\(item) -> \(next)"
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        // Modify based on requirements
        return lhs === rhs // PITFALL: Stackframe crash: Use === not == for pointers
    }
}

class LinkedList<Item> : CustomStringConvertible {
    var head: Node<Item>?
    var tail: Node<Item>?
    var count: Int = 0
   
    func append(_ node: Node<Item>) {
        if head == nil {
            // First node in list
            head = node
        } else {
            // Append to tail
            tail?.next = node
           
            // Update node
            node.prev = tail
            node.next = nil // PITFALL: Can create a cycle if delete/append the previous node
        }
        tail = node
        count += 1
    }
    
    // Assume node always exists
    func delete(_ node: Node<Item>) {
        // Remove the node
        node.prev?.next = node.next  // INSIGHT: To delete we need a Doubly Linked List
        node.next?.prev = node.prev
        
        // If needed, update head/tail pointers
        if node == head { head = head?.next }   // PITFALL: Can lead to unexpected state
        if node == tail { tail = tail?.prev }
        
        count -= 1
    }
    
    var description: String {
//        "head: \(head?.item) tail: \(tail?.item)\n\t\(head)"
        "head: \(head?.item ?? "nil" as Any) tail: \(tail?.item ?? "nil" as Any)\n\t\(head ?? "nil" as Any)"
    }
}
