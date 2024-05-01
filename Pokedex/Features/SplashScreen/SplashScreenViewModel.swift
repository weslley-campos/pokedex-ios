import Foundation
import SwiftUI

class SplashScreenViewModel {
    let navigator: Navigator
    
    init(navigator: Navigator = inject()) {
        self.navigator = navigator
    }
    
    func navigateToHomeScreen() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.navigator.navigate(to: Screen.Home)
        }
    }
}
