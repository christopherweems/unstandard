//
//  Identified.swift
//  
//
//  Created by Christopher Weems on 11/15/21.
//

public struct Identified<Item, ID>: Identifiable where ID : Hashable {
    public let item: Item
    private let _id: KeyPath<Item, ID>
    
    public var id: ID { item[keyPath: _id] }
    
    public init(item: Item, id: KeyPath<Item, ID>) {
        self.item = item
        self._id = id
        
    }
    
    public init?(item: Item?, id: KeyPath<Item, ID>) {
        guard let item = item else { return nil }
        
        self.item = item
        self._id = id
        
    }
    
}
