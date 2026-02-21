//
//  NavigationToolbar.swift
//  Talking Apron
//
//  Created by Naima Khan on 21/02/2026.
//

import SwiftUI

struct NavigationToolbar: View {
    @Binding var showMenuItems: Bool
    @Binding var showRecipePage: Bool
    @Binding var showSaved: Bool
    @Binding var showHome: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image("Grandma")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .padding(.leading, 20)
                
                Spacer()
                
                // menu button
                Button {
                    showMenuItems.toggle()
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
        .overlay {
            if showMenuItems {
                MenuItemView(
                    isPresented: $showMenuItems,
                    onHomeSelected: {
                        showMenuItems = false
                        showHome = true
                    },
                    onRecipeSelected: {
                        showMenuItems = false
                        showRecipePage = true
                    },
                    onSavedSelected: {
                        showMenuItems = false
                        showSaved = true
                    }
                )
                .transition(.opacity)
                .zIndex(100)
            }
        }
    }
}

#Preview {
    NavigationToolbar(
        showMenuItems: .constant(true),
        showRecipePage: .constant(false),
        showSaved: .constant(false),
        showHome: .constant(false)
    )
}
