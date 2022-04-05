//
//  String+AffixOperations.swift
//
//
//  Created by Christopher Weems on 9/27/21.
//

extension String {
    @discardableResult
    public mutating func replaceSuffix(_ suffix: String, with newSuffix: String) -> Bool {
        guard hasSuffix(suffix) else { return false }
        self.removeLast(suffix.count)
        self.append(newSuffix)
        return true
    }
    
    public func replacingSuffix(_ suffix: String, with replacement: String) -> String? {
        var result = self
        let didReplace = result.replaceSuffix(suffix, with: replacement)
        return didReplace ? result : nil
    }
    
}
