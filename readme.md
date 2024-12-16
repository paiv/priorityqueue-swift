PriorityQueue
==

Install
--
Add package dependency:

```sh
swift package add-dependency 'https://github.com/paiv/swift-priority-queue.git' --from '1.0.0'
swift package add-target-dependency PriorityQueue <target-name>
```


Usage
--
```swift
import PriorityQueue

var queue = PriorityQueue([7, 9, 3, 11, 5])
queue.insert(42)
queue.pop()
```
