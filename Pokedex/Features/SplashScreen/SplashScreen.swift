import Foundation
import SwiftUI

struct SplashScreen: View {
    let viewModel = SplashScreenViewModel()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                GifImage(name: "animation")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.width * 0.25)
                
                Image("Pokedex")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width * 0.8)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .ignoresSafeArea()
            .padding(.top)
            .onAppear{
                viewModel.navigateToHomeScreen()
            }
        }
    }
}

#Preview {
    NavigationStack {
        SplashScreen()
    }
}

#Preview {
    NavigationStack {
        SplashScreen()
            .preferredColorScheme(.dark)
    }
}

