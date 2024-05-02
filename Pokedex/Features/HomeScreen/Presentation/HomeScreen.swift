import SwiftUI

struct HomeScreen: View {
    var navigator: Navigator = inject()
    
    var body: some View {
        HStack{
            PokemonCard(number: "#001", image:"pikachu", name:"Pikachu")
            PokemonCard(number: "#001", image:"pikachu", name:"Pikachu")
            PokemonCard(number: "#001", image:"pikachu", name:"Pikachu")
        }
        .padding()
    }
}

struct PokemonCard: View {
    let number: String
    let image: String
    let name: String
    
    var body: some View {
        VStack {
            ZStack {
                Text(number)
                    .font(.poppinsOverline)
                    .foregroundStyle(Color.cardText)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 4)
                    .padding(.trailing, 8)
            }
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 75)
            Text(name)
                .font(.poppinsCaption)
                .foregroundStyle(Color.cardText)
                .padding(4)
        }
        .background()
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color.cardBorder, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.2), radius: 5)
    }
}

#Preview {
    HomeScreen()
}
