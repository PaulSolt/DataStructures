import Foundation

// Discuss Linked List (single)
// Stub everything
// Implement one part at a time

class Node<Item>: CustomStringConvertible, Equatable {
    var item: Item
    var next: Node?
    
    init(_ value: Item) {
        self.item = value
    }
   
    // Recursive description with a base case
    var description: String {
        guard let next else { return "\(item)" }
        return "\(item) -> \(next)"
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        // Can be expended to check item and next pointers (===)
        return lhs === rhs // PITFALL: Use === not ==
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
            // Append to tail and adjust tail
            tail?.next = node
            node.next = nil // PITFALL: Clear previous next to avoid a cycle
        }
        tail = node // Always adding to tail
        count += 1
    }
    
    // O(n)
    // In a singly linked list you need to have a reference to the node before
    // the node to delete.
    // Adjust the head and tail if we removed that node
    func delete(_ node: Node<Item>) {
        var current = head
        var previous: Node<Item>? = nil

        // Loop through until the node is found
        while let next = current?.next {
            previous = current
            if node == next {
                // Delete the node
                current?.next = next.next
                count -= 1
                break
            }
            current = next
        }
        
        if node == head {
            // delete head
            head = head?.next
            count -= 1
        }
        if node == tail {
            // If we removed tail, we need to update tail
            tail = previous
        }
    }

    var description: String {
//        "head: \(head?.item), tail: \(tail?.item)\n\thead -> \(head)"
        "head: \(head?.item ?? "nil" as Any), tail: \(tail?.item ?? "nil" as Any)\n\thead -> \(head ?? "nil" as Any)"
    }
}
