import SwiftUI

struct MainPageView: View {
    @State private var currentPersona: Persona = Persona.allPersonas.first!

    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg")
                    .ignoresSafeArea()

                VStack(spacing: 50) {
                    Spacer()

                    Text("Tap to start!")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    Image(currentPersona.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280)
                        .accessibilityLabel(Text(currentPersona.name))
                        .id(currentPersona.id) //current persona
                        .transition(.scale.combined(with: .opacity))

                    Text(currentPersona.greeting)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 100)

                    Spacer()
                } // vstack
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(currentPersona.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .aspectRatio(contentMode: .fit)
                            .buttonStyle(.plain)
                        
                    }
//                    .content.sharedBackgroundVisibility(.hidden)
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            //menu items
                            Button("Home") {

                            }
                            Button("Recipe") {
                            }

                            Button("Saved") {
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .font(.title2)
                                .foregroundStyle(.primary)
                        }
                        .menuStyle(.borderlessButton)
                    }
                } // toolbar
                .toolbarBackground(.hidden, for: .navigationBar)
            } //zstack
        } //nav
    } //body
}

#Preview {
    MainPageView()
}
