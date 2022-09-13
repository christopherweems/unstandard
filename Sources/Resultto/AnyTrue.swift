//  AnyTrue.swift
//  10/11/20

@resultBuilder
public struct AnyTrue {
    public static func buildBlock(_ elements: Optional<Bool?>...) -> Bool {
        elements.lazy.contains(where: { $0 == true })
    }
    
}
