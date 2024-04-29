import Foundation
import Swinject

/// A property wrapper for resolving dependencies using Swinject.
/// `Inject` is a utility that makes use of Swinject's dependency injection to provide
/// the required dependencies.
///
/// Type-safety is ensured through the use of Swift Generics.
///
/// You should use `Inject` to inject the dependencies needed for each class to
/// do its work. This makes the relationships between classes explicit and makes
/// your code easier to maintain and test.
///
/// **Usage**
///
///  Use the `@Inject` property wrapper to inject a dependency into a property.
///
/// ```
/// class MyClass {
///     let service: Service
///     init(service: Service = inject()) {
///        self.service = service
///     }
/// }
/// ```
///
/// If you have multiple instances of the same type, you can distinguish them by name when injecting.
///
/// ```
/// class MyClass {
///     let serviceOne: Service
///     let serviceTwo: Service
///     init(
///         serviceOne: Service = inject("ServiceOne"),
///         serviceTwo: Service = inject("ServiceTwo"),
///     ) {
///        self.serviceOne = serviceOne
///        self.serviceTwo = serviceTwo
///     }
/// }
/// ```
/// - Warning:
///     If the requested type cannot be resolved, the `Inject` initializer will call `fatalError`, crashing the app.
@propertyWrapper
struct Inject<T> {
    var wrappedValue: T
    
    init() {
        guard let resolution = Assembler.shared.resolver.resolve(T.self) else {
            fatalError("Couldn't resolve \(T.self)")
        }
        wrappedValue = resolution
    }
    
    init(name: String) {
        guard let resolution = Assembler.shared.resolver.resolve(T.self, name: name) else {
            fatalError("Couldn't resolve \(T.self)")
        }
        wrappedValue = resolution
    }
}

/// Inject a dependency of a particular type.
/// - Returns: An instance of the requested type.
/// - Warning:
///     If the requested type cannot be resolved, this function will call `fatalError`, crashing the app.
func inject<T>() -> T {
    @Inject var dependency: T
    return dependency
}

/// Inject a dependency of a particular type with a specific name.
/// - Parameters:
///     - name: The name of the instance to inject.
/// - Returns: An instance of the requested type with the requested name.
/// - Warning:
///     If the requested type cannot be resolved, this function will call `fatalError`, crashing the app.
func inject<T>(name: String) -> T {
    @Inject(name: name) var dependency: T
    return dependency
}
