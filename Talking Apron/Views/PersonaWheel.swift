import SwiftUI

struct PersonaWheel: View {
    @Binding var selectedPersona: Persona
    @Binding var showingWheel: Bool
    
    @State private var dragLocation: CGPoint = .zero
    @State private var hoveredPersona: Persona?
    
    let personas = Persona.allPersonas
    
    var body: some View {
        ZStack {
            Color.chocolate.opacity(0.5)
                .ignoresSafeArea()
            
            ZStack {
                // Background circle
                Circle()
                    .fill(Color(.mintChefs))
                    .frame(width: 350, height: 350)
                    .overlay(
                        Circle()
                            .stroke(Color(.chocolate), lineWidth: 4)
                    )
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                // Divider lines
                ForEach(0..<personas.count, id: \.self) { index in
                    Rectangle()
                        .fill(Color(.systemBackground))
                        .frame(width: 2, height: 175)
                        .offset(y: -85.5)
                        .rotationEffect(.degrees(Double(index) * 60 + 30))
                }
                
                // Center circle
                Circle()
                    .fill(Color(.systemBackground).opacity(0.8))
                    .frame(width: 100, height: 100)
                    .overlay(
                        Circle()
                            .stroke(Color(.chocolate), lineWidth: 3)
                    )
                
                // Persona images arranged in circle
                ForEach(Array(personas.enumerated()), id: \.element.id) { index, persona in
                    PersonaWheelItem(
                        persona: persona,
                        isHovered: hoveredPersona?.id == persona.id,
                        isSelected: selectedPersona.id == persona.id
                    )
                    .offset(circularOffset(for: index, total: personas.count, radius: 115))
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        dragLocation = value.location
                        hoveredPersona = getPersonaAtLocation(value.location)
                    }
                    .onEnded { value in
                        if let hovered = hoveredPersona {
                            selectedPersona = hovered
                        }
                        showingWheel = false
                        hoveredPersona = nil
                    }
            )
        }
    }
    
    // to place personas in a circular position
    private func circularOffset(for index: Int, total: Int, radius: CGFloat) -> CGSize {
        let angle = (2 * Double.pi / Double(total)) * Double(index) - Double.pi / 2
        let x = cos(angle) * radius // H position
        let y = sin(angle) * radius // V position
        return CGSize(width: x, height: y)
    }
    
    // Detect which persona is being hovered
    private func getPersonaAtLocation(_ location: CGPoint) -> Persona? {
        let center = CGPoint(x: 175, y: 175) // Half of 350
        let radius: CGFloat = 110
        
        // Find the closest persona by calculating distance to each one
        var closestPersona: Persona?
        var shortestDistance: CGFloat = CGFloat.greatestFiniteMagnitude
        
        for (index, persona) in personas.enumerated() {
            // calc this persona's position
            let angle = (2 * Double.pi / Double(personas.count)) * Double(index) - Double.pi / 2
            let personaX = center.x + cos(angle) * radius // H pos
            let personaY = center.y + sin(angle) * radius // V pos
            
            // calc distance from touch to this persona
            let distance = sqrt(pow(location.x - personaX, 2) + pow(location.y - personaY, 2))
            
            // If this is the closest persona
            if distance < shortestDistance && distance < 70 { // 70 points for generous touch area
                shortestDistance = distance
                closestPersona = persona
            }
        }
        
        return closestPersona
    }
}

struct PersonaWheelItem: View {
    let persona: Persona
    let isHovered: Bool
    let isSelected: Bool
    
    var body: some View {
            Image(persona.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: isHovered ? 110 : 100, height: isHovered ? 110 : 100)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                .scaleEffect(isHovered ? 1.1 : 1.0)
    }
}

#Preview {
    PersonaWheel(
        selectedPersona: .constant(Persona.allPersonas[0]),
        showingWheel: .constant(true)
    )
}
