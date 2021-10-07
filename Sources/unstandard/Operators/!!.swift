//  !!.swift (Unwrap or Error)
//  8/24/21

infix operator !! : NilCoalescingPrecedence

public func !!<Root, E : Error>(root: @autoclosure () throws -> Optional<Root>,
                                error: @autoclosure () -> E) throws -> Root {
    guard let root = try root() else { throw error() }
    return root
}
