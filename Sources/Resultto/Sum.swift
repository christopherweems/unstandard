//  Sum.swift
//  8/5/22

@resultBuilder
public struct Sum<Value: AdditiveArithmetic> {
    public static func buildBlock(_ components: Value...) -> Value {
        components.reduce(.zero, +)
    }
    
    public static func buildEither(first component: Value) -> Value {
        component
    }
    
    public static func buildEither(second component: Value) -> Value {
        component
    }
    
    public static func buildOptional(_ component: Value?) -> Value {
        component ?? .zero
    }
    
}
