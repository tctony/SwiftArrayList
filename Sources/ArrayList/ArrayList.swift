/// An class wrapper of swift Array

public class ArrayList<T> : Sequence {

    public final var elements: Array<T>

    public init(_ elements: Array<T>) {
        self.elements = elements
    }

    public convenience init() {
        self.init([])
    }

    public convenience init(_ elements: T...) {
        self.init(elements)
    }

    public convenience init(_ list: ArrayList<T>) {
        self.init(list.elements)
    }

    public subscript(index: Int) -> T {
        get {
            return elements[index]
        }
        set {
            elements[index] = newValue
        }
    }

    // does return value needs wrap?
    public subscript(subRange: Range<Int>) -> ArraySlice<T> {
        get {
            return elements[subRange]
        }
        set {
            elements[subRange] = newValue
        }
    }

    @inlinable public func append(newElement: T) {
        elements.append(newElement)
    }

    @inlinable public func insert(newElement: T, atIndex index: Int) {
        elements.insert(newElement, at: index)
    }

    @inlinable
    @discardableResult
    public func removeAtIndex(index: Int) -> T {
        return elements.remove(at: index)
    }

    @inlinable
    @discardableResult
    public func removeLast() -> T {
        return elements.removeLast()
    }

    @inlinable public func removeAll(keepingCapacity: Bool = false) {
        elements.removeAll(keepingCapacity: keepingCapacity)
    }

    @inlinable public func reserveCapacity(minimumCapacity: Int) {
        elements.reserveCapacity(minimumCapacity)
    }

    @inlinable public var count: Int {
        get {
            return elements.count
        }
    }

    @inlinable public var isEmpty: Bool {
        get {
            return elements.isEmpty
        }
    }

    @inlinable public var capacity: Int {
        get {
            return elements.capacity
        }
    }

    @inlinable public func sort(by areInIncreasingOrder: (T, T) -> Bool) {
        elements.sort(by: areInIncreasingOrder)
    }

    @inlinable public func reverse() {
        elements.reverse()
    }

    @inlinable
    @discardableResult
    public func filterInPlace(includeElement: (T) -> Bool,
                              inPlace: Bool = true) -> ArrayList<T> {
        if inPlace {
            self.elements = self.elements.filter(includeElement)
            return self
        } else {
            return ArrayList(self.elements.filter(includeElement))
        }
    }

    // MARK: -

    public __consuming func makeIterator() -> Array<T>.Iterator {
        return elements.makeIterator()
    }

    // MARK: -
}

@inlinable
func += <T>(lhs: inout ArrayList<T>, rhs: T) {
    lhs.elements += [rhs]
}

@inlinable
func += <T>(lhs: inout ArrayList<T>, rhs: Array<T>) {
    lhs.elements += rhs
}

@inlinable 
func += <T>(lhs: inout ArrayList<T>, rhs: ArrayList<T>) {
    lhs.elements += rhs.elements
}
