import SwiftUI

struct MainView: View {
    @State private var currentPersona: Persona = Persona.allPersonas.first!
    @State private var showPersonaWheel = false
    @State private var showMenuItems = false
    @State private var showRecipePage = false
    @State private var showSaved = false
    @State private var showHome = false
    

    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg")
                    .ignoresSafeArea()

                VStack(spacing: 50) {
                    Spacer()

                    Text("Tap to start!")
                        .font(.headline)
                        .foregroundColor(.chocolate)

                    Image(currentPersona.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280)
                        .accessibilityLabel(Text(currentPersona.name))
                        .id(currentPersona.id) //current persona
                        .transition(.scale.combined(with: .opacity))
                        .onLongPressGesture(minimumDuration: 0.5) {
                                showPersonaWheel = true
                            }

                    Text(currentPersona.greeting)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.chocolate)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 100)

                    Spacer()
                } // vstack
                
                //Navigation toolbar
                NavigationToolbar(
                    showMenuItems: $showMenuItems,
                    showRecipePage: $showRecipePage,
                    showSaved: $showSaved,
                    showHome: $showHome
                )
                
                if showPersonaWheel {
                    PersonaWheel(
                        selectedPersona: $currentPersona,
                        showingWheel: $showPersonaWheel
                    )
                    .zIndex(200)  // on top
                }
            } //vstack
            .navigationDestination(isPresented: $showRecipePage) {
                RecipeView()
            }
            .navigationDestination(isPresented: $showSaved) {
                SavedView()
            }
        } //nav
        .navigationBarHidden(true)
    } //body
}

#Preview {
    MainView()
}
