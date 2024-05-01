import Foundation
import SwiftUI

protocol Navigator {
    var navigateObserver: ((Screen) -> Void)? { get set }
    var backObserver: (() -> Void)? { get set }
    
    func onNavigate(to callback: @escaping (Screen) -> Void)
    func navigate(to screen: Screen)
    
    func onBack(to callback: @escaping () -> Void)
    func back()
}

public final class AppNavigator: Navigator {
    var navigateObserver: ((Screen) -> Void)?
    var backObserver: (() -> Void)?
    
    func onNavigate(to callback: @escaping (Screen) -> Void) {
        navigateObserver = callback
    }
    
    func navigate(to screen: Screen) {
        navigateObserver?(screen)
    }
    
    func onBack(to callback: @escaping () -> Void) {
        backObserver = callback
    }
    
    func back() {
        backObserver?()
    }
}
