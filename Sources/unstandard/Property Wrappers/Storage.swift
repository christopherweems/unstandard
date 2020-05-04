//
//  Storage.swift
//  
//
//  Created by Christopher Weems on 12/4/19.
//
//  ^SHRT: UserDefaults Wrapper (https://location.codes/shrt/userdefaultswrapper/)
//  --> https://swiftsenpai.com/swift/create-the-perfect-userdefaults-wrapper-using-property-wrapper/
//

import Foundation

@propertyWrapper
public struct Storage<T: Codable> {
    private let key: String
    private let defaultValue: T
        
    public var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
                return defaultValue
            }
            
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

@propertyWrapper
public struct EncryptedStringStorage {
    private let key: String
    
    public init(key: String) {
        self.key = key
    }
    
    public var wrappedValue: String {
        get {
            UserDefaults.standard.string(forKey: key) ?? ""
        }
        set {
            let encrypted = encrypt(value: newValue)
            UserDefaults.standard.set(encrypted, forKey: key)
        }
    }
    
    private func encrypt(value: String) -> String {
        fatalError()
    }
}
