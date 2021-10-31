//
//  Substring+Initializers.swift
//
//
//  Created by Christopher Weems on 9/26/21.
//

import Foundation

extension Substring {
    public init?<SP>(_ string: SP?) where SP : StringProtocol {
        guard let string = string else { return nil }
        self.init(string)
    }
    
}
