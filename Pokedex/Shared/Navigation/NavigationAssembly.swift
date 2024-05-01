import Foundation
import Swinject

class NavigationAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Navigator.self, factory: { _ in
            return AppNavigator()
        })
        .inObjectScope(.container)
    }
}
