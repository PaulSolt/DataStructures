import Foundation

// TODO: Implement LinkedList<Item> with Node<Item> using generics
// 1. Store the count of nodes
// 2. Add a description for debug printing
// 3. Implement methods:
//      append(_ node: Node<Item>) O(1)
//      delete(_ node: Node<Item>) O(n)
// 4. Verify all unit tests pass

class Node<Item> : Equatable, CustomStringConvertible {
    var item: Item
    var next: Node<Item>?
    
    init(_ item: Item) {
        self.item = item
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs // PITFALL: Use === not == for pointer comparisons
    }
    
    var description: String {
        guard let next else { return "\(item)" }
        return "\(item) -> \(next)"
    }
}

class LinkedList<Item>: CustomStringConvertible {
    var head: Node<Item>?
    var tail: Node<Item>?
    var count: Int = 0
    
    func append(_ node: Node<Item>) {
        if head == nil {
            // initial state (base case)
            head = node
        } else {
            // appending on the tail
            tail?.next = node
            node.next = nil // PITFALL: Make sure to clear state when inserting
        }
        tail = node
        count += 1
    }
    
    func delete(_ node: Node<Item>) {
        var current = head
        var previous: Node<Item>? = nil
        
        // loop through until the node is found (or end of list)
        while let next = current?.next {
            previous = current
            
            // Check equality + delete + decrement + break out
            if node == next {
                // Delete the node
                current?.next = next.next
                count -= 1
                break
            }
            current = next
        }
        
        // Book keeping for head and tail
        if node == head {
            // delete head
            head = head?.next
            count -= 1
        }
        if node == tail {
            // If we removed the tail, update tail to the node before it
            tail = previous
        }
    }
    
    
    var description: String {
        "head: \(head?.item ?? "nil" as Any), tail: \(tail?.item ?? "nil" as Any)\n\thead -> \(head ?? "nil" as Any)" // TODO: Cleanup warnings with ?? and Any
    }
}
