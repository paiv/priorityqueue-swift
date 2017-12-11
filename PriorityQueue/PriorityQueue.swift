
// PriorityQueue.swift
// author: Pavel paiv Ivashkov


struct PriorityQueue<T> where T:Comparable {

    struct ArrayHeap {
        private var items:[T] = []

        typealias Element = T
        
        var count: Int {
            return items.count
        }
        
        mutating func add(_ item: Element) {
            items.append(item)
            bubbleUp()
        }
        
        private mutating func bubbleUp() {
            var q = items.count - 1
            
            while q > 0 {
                let p = (q - 1) / 2
                
                guard items[p] >= items[q] else {
                    break
                }
                
                items.swapAt(p, q)
                q = p
            }
        }
        
        mutating func removeTop() -> Element? {
            guard items.count > 0 else {
                return nil
            }
            
            guard items.count > 1 else {
                return items.removeLast()
            }
            
            let top = items.first
            
            items[0] = items.removeLast()
            bubbleDown()
            
            return top
        }
        
        private mutating func bubbleDown(_ index: Int = 0) {
            var p = index
            
            while true {
                var q = p
                
                var i = p * 2 + 1

                if i < items.count && items[q] > items[i] {
                    q = i
                }
                
                i += 1

                if i < items.count && items[q] > items[i] {
                    q = i
                }

                guard q != p else {
                    return
                }
                
                items.swapAt(p, q)
                p = q
            }
        }
    }

    typealias Element = ArrayHeap.Element
    
    var heap = ArrayHeap()

    mutating func add(_ item: Element) {
        heap.add(item)
    }
    
    mutating func pop() -> Element? {
        return heap.removeTop()
    }
    
    mutating func clear() {
        heap = ArrayHeap()
    }
    
    var count: Int {
        return heap.count
    }
}


extension PriorityQueue : Sequence, IteratorProtocol {
    
    public mutating func next() -> Element? {
        return pop()
    }
}
