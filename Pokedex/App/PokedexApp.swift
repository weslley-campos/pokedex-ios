import SwiftUI

@main
struct PokedexApp: App {
    @State var path: NavigationPath = NavigationPath()
    
    @Inject
    var navigator: Navigator
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                navigator.onNavigate(to: { screen in
                    path.append(screen)
                })
                
                navigator.onBack(to: {
                    path.removeLast()
                })
                
                return SplashScreen()
                    .navigationDestination(for: Screen.self) { screen in
                        switch screen {
                        case .Home:
                            HomeScreen()
                                .navigationBarBackButtonHidden()
                        }
                    }
            }
        }
    }
}
