import struct Foundation.Data
import class Foundation.JSONEncoder

extension Data {
    //@inlinable
    public init?(base64URLEncoded base64URLString: String, options: Data.Base64DecodingOptions = []) {
        var base64String = base64URLString
        base64String = base64String.replacingOccurrences(of: "-", with: "+")
        base64String = base64String.replacingOccurrences(of: "_", with: "/")
        self.init(base64Encoded: base64String, options: options)
    }
    
    @_disfavoredOverload
    public init?(base64URLEncoded base64URLString: some StringProtocol, options: Data.Base64DecodingOptions = []) {
        var base64String = String(base64URLString)
        base64String = base64String.replacingOccurrences(of: "-", with: "+")
        base64String = base64String.replacingOccurrences(of: "_", with: "/")
        self.init(base64Encoded: base64String, options: options)
    }
    
}

extension Data {
    //@inlinable
    public func base64URLEncodedString(options: Base64EncodingOptions = []) -> String {
        var encodedString = self.base64EncodedString(options: options)
        encodedString = encodedString.replacingOccurrences(of: "+", with: "-")
        encodedString = encodedString.replacingOccurrences(of: "/", with: "_")
        return encodedString
    }
    
}


// MARK: -

public func print<V: Encodable>(base64URLEncoded value: V, encoder: JSONEncoder = JSONEncoder()) {
    do {
        let v = try encoder.encode(value)
        print(v.base64URLEncodedString())
        
    } catch {
        print("Could not encode value")
    }
    
}
