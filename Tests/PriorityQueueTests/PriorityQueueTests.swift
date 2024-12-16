import XCTest
@testable import PriorityQueue


class PriorityQueueTests: XCTestCase {

    var iqueue: PriorityQueue<Int>!

    override func setUp() {
        super.setUp()
        iqueue = PriorityQueue()
    }

    func testTopElementWhenSingle() {
        iqueue.insert(42)

        XCTAssertEqual(iqueue.count, 1)
        XCTAssertEqual(iqueue.pop(), 42)
        XCTAssertEqual(iqueue.count, 0)
    }

    func testTopElementWhenEmpty() {
        XCTAssertEqual(iqueue.count, 0)
        XCTAssertNil(iqueue.pop())
        XCTAssertEqual(iqueue.count, 0)
    }

    func testTopElementWhenDuplicate() {
        iqueue.insert(42)
        iqueue.insert(18)
        iqueue.insert(42)

        XCTAssertEqual(iqueue.count, 3)
        XCTAssertEqual(iqueue.pop(), 18)
        XCTAssertEqual(iqueue.pop(), 42)
        XCTAssertEqual(iqueue.pop(), 42)
        XCTAssertEqual(iqueue.count, 0)
    }

    func testRandomCheck() {
        continueAfterFailure = false

        for n in 1..<100 {
            var items:[Int] = []

            for _ in 0..<n {
                let x = Int.random(in: 0..<100) - 50
                items.append(x)
                iqueue.insert(x)
            }

            XCTAssertEqual(iqueue.count, n)

            for x in items.sorted() {
                XCTAssertEqual(iqueue.pop(), x, "\(items)")
            }

            XCTAssertEqual(iqueue.count, 0)
        }
    }

    func testSequence() {
        iqueue.insert(3)
        iqueue.insert(5)
        iqueue.insert(1)
        iqueue.insert(4)
        XCTAssertEqual(iqueue.count, 4)

        var items: [Int] = []
        for x in iqueue {
            items.append(x)
        }

        XCTAssertEqual(items, [1, 3, 4, 5])
        XCTAssertEqual(iqueue.count, 4)
    }

    func testClear() {
        iqueue.insert(42)

        iqueue.clear()
        XCTAssertEqual(iqueue.count, 0)
    }
}
