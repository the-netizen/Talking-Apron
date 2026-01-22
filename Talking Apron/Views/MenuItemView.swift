//
//  MenuItemView.swift
//  Talking Apron
//
//  Created by Naima Khan on 15/01/2026.
//

import SwiftUI

struct MenuItemView: View {
    @Binding var isPresented: Bool
    var onHomeSelected: () -> Void
    var onRecipeSelected: () -> Void
    var onSavedSelected: () -> Void
    
    var body: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        isPresented = false
                    }
                } //dissmiss menu items when clicked outside its box
            
            VStack {
                HStack {
                    Spacer()
                    
                    VStack(spacing: 25) {
                        
                        // Home button
                        MenuItemButton(
                            icon: "house.fill",
                            title: "Home",
                            backgroundColor: Color(.bg),
                            textColor: Color(.chocolate)
                        ) {
                            onHomeSelected()
                            isPresented = false
                        }
                        .padding(.top, 10)
                        
                        // Recipe button
                        MenuItemButton(
                            icon: "fork.knife",
                            title: "Recipe",
                            backgroundColor: Color(.strawberry),
                            textColor: .white
                        ) {
                            onRecipeSelected()
                            isPresented = false
                        }
                        
                        // Saved button
                        MenuItemButton(
                            icon: "bookmark.fill",
                            title: "Saved",
                            backgroundColor: Color(.chocolate),
                            textColor: .white
                        ) {
                            onSavedSelected()
                            isPresented = false
                        }
                        .padding(.bottom, 15)
                    }
                    .padding(20)
                    .background(Color(.caramel).opacity(0.8))
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .padding(.trailing, 16)  // Align with menu button
                    .padding(.top, 70)       // Position below toolbar
                }
                
                Spacer()
            }
        }
    }
}

// Custom menu button component
struct MenuItemButton: View {
    let icon: String
    let title: String
    let backgroundColor: Color
    let textColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(textColor)
                    .frame(width: 24)
                
                Text(title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(textColor)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .frame(width: 200)
            .background(backgroundColor)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color(.chocolate), lineWidth: 4)
            )
        }
    }
}

#Preview {
    MenuItemView(
        isPresented: .constant(true),
        onHomeSelected: {},
        onRecipeSelected: {},
        onSavedSelected: {}
    )
}
