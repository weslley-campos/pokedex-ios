import Foundation
import Swinject

@propertyWrapper
struct Resolve<T> {
    var wrappedValue: T
    
    init(_ resolver: Resolver) {
        guard let resolution = resolver.resolve(T.self) else {
            fatalError("Couldn't resolve \(T.self)")
        }
        wrappedValue = resolution
    }
}
