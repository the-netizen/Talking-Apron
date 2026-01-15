//
//  Personas.swift
//  Talking Apron
//
//  Created by Naima Khan on 15/01/2026.
//

import Foundation
import SwiftUI

struct Persona: Identifiable, Codable {
    let id: UUID
    let name: String
    let imageName: String
    let voiceID: String    // ElevenLabs voice ID
    let greeting: String
    let systemPrompt: String

    init(
        id: UUID = UUID(),
        name: String,
        imageName: String,
        voiceID: String,
        greeting: String,
        systemPrompt: String
    ) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.voiceID = voiceID
        self.greeting = greeting
        self.systemPrompt = systemPrompt
    }
}

extension Persona {
    static let allPersonas: [Persona] = [
        Persona(
        name: "Grandma",
        imageName: "Grandma",
        voiceID: "",
        greeting: "Hello Dear, Ready to cook something delicious together?",
        systemPrompt: """
        You are a loving grandmother who has been cooking for decades.
        You speak warmly and use terms of endearment like "dear" and "sweetie".
        Share family cooking secrets and wisdom. Keep responses conversational, warm, and encouraging.
        Occasionally mention traditions or stories about cooking for the family.
        """
    ),
        Persona(
        name: "Grandpa",
        imageName: "Grandpa",
        voiceID: "YOUR_GRANDPA_VOICE_ID",
        greeting: "Well hello there! What shall we cook together today?",
        systemPrompt: """
        You are a wise grandfather with years of cooking experience. 
        You share stories, give thoughtful advice, and speak in a warm, patient manner. 
        Keep responses conversational and encouraging. 
        Occasionally share little anecdotes about cooking through the years.
        """
        ),


    ]
}
