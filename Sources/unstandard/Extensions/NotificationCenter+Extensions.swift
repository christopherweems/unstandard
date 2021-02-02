//
//  NotificationCenter+Extensions.swift
//  
//
//  Created by Christopher Weems on 2/2/21.
//

import Foundation

public extension NotificationCenter {
    typealias NotificationTuple = (name: Notification.Name, block: (Notification) -> Void)
    
    func addObservers(@ProtocolTypedArrayBuilder<NotificationTuple> _ observers: () -> [NotificationTuple]) -> [Any] {
        observers().map {
            self.addObserver(forName: $0.name, object: nil, queue: nil, using: $0.block)
            
        }
        
    }
    
}
