import Foundation
import Swinject

/// Extension of `Assembler` to include a shared instance.
///
/// This extension adds a static `shared` instance to the `Assembler` class,
/// which can be used as a singleton for the rest of your project.
///
/// The relevance of this `shared` instance extends to the `Inject` property wrapper too.
/// The `Inject` wrapper resolves dependencies using this `shared` instance of `Assembler`.
///
/// **Usage**:
/// Add yours Assemblies here to allow `Inject` handle it:
///
/// ```
/// extension Assembler {
///     static let shared: Assembler = {
///         return Assembler([ServiceAssembly()], container: Container())
///     }()
/// }
/// ```
extension Assembler {
    static let shared: Assembler = {
        return Assembler([], container: Container())
    }()
}
