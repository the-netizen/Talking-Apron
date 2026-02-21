//
//  SavedView.swift
//  Talking Apron
//
//  Created by Naima Khan on 21/02/2026.
//

import SwiftUI

struct SavedView: View {
    @State private var showMenuItems = false
    @State private var showRecipePage = false
    @State private var showSaved = false
    @State private var showHome = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Bookmarked Recipes")
                    .font(.largeTitle)
                    .foregroundColor(.chocolate)
                Spacer()
            }
            
            //Navigation toolbar
            NavigationToolbar(
                showMenuItems: $showMenuItems,
                showRecipePage: $showRecipePage,
                showSaved: $showSaved,
                showHome: $showHome
            )
        }
        .navigationBarHidden(true)
        .onChange(of: showHome) { _, newValue in
            if newValue {
                dismiss()
            }
        }
        .navigationDestination(isPresented: $showRecipePage) {
            RecipeView()
        }
    }
}

#Preview {
    SavedView()
}
