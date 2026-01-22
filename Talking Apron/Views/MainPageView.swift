import SwiftUI

struct MainPageView: View {
    @State private var currentPersona: Persona = Persona.allPersonas.first!
    @State private var showMenuItems = false

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
                
                //Custom toolbar
                VStack {
                    HStack {
                        Image(currentPersona.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .padding(.leading, 20)
//                                                Text("Talking Apron")
//                                                    .font(.headline)
//                                                    .foregroundColor(.chocolate)
                        
                        Spacer()
                        
                        // menu button
                        Button {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showMenuItems.toggle()
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .font(.title)
                                .foregroundColor(.primary)
                        }
                        .padding(.trailing, 16)
                    }
                    .padding(.top, 8)
                    .frame(height: 60)
                    
                    Spacer()
                }
                if showMenuItems {
                   MenuItemView(
                       isPresented: $showMenuItems,
                       onHomeSelected: {
                           // Navigate to home
                       },
                       onRecipeSelected: {
                           // Navigate to recipe
                       },
                       onSavedSelected: {
                           // Navigate to saved
                       }
                   )
                   .transition(.opacity)
                   .zIndex(100)  // Ensure it appears on top
               }
                
            } //vstack
        } //nav
        .navigationBarHidden(true)
    } //body
}

#Preview {
    MainPageView()
}
