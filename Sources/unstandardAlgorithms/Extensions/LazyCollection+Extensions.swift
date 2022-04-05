//
//  LazyCollection+Extensions.swift
//  
//
//  Created by Christopher Weems on 2/22/22.
//

extension LazyCollection {
    public func prefix(through lastElementCondition: @escaping (Element) -> Bool) -> LazyPrefixWhileSequence<Base> {
        var shouldContinue = true
        
        return self.prefix(while: {
            if lastElementCondition($0) {
                shouldContinue = false
                return true
            }
            
            return shouldContinue
        })
    }
    
}
