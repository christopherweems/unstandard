//
//  ??!.swift
//  
//
//  Created by Christopher Weems on 2/18/22.
//

infix operator ??! : AssignmentPrecedence

/// allows use of `??` where it is unknown to the type checker that fallback `some _` case is of same type
public func ??!<P, O>(lhs: P?, rhs: O) -> P {
    precondition(rhs is P)
    return lhs ?? (rhs as! P)
}
