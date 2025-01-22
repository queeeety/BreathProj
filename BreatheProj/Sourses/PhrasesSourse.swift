//
//  Resourses.swift
//  BreatheProj
//
//  Created by Tymofii Bezverkhyi on 21.01.2025.
//
//  in this file and not in JSON to simplify the localization process

import Foundation

let phrasesStage: [BreathStage: [String]] = [
    .inhale: [
        String(
            localized: "Breathe in the calm, let it fill you.",
            comment: "inhale motivation"),
        String(
            localized: "Feel the energy flowing into you.",
            comment: "inhale motivation"),
        String(
            localized: "You're drawing in strength with every breath.",
            comment: "inhale motivation"),
        String(
            localized: "Inhale confidence, exhale doubt.",
            comment: "inhale motivation"),
        String(
            localized: "Take in the power of this moment.",
            comment: "inhale motivation"),
    ],
    .hold: [
        String(
            localized: "You're stronger than you think!",
            comment: "hold motivation"),
        String(
            localized: "Each breath is a step toward balance.",
            comment: "hold motivation"),
        String(
            localized: "Focus on the rhythm; you're in control.",
            comment: "hold motivation"),
        String(
            localized: "You're doing amazing—keep going!",
            comment: "hold motivation"),
        String(
            localized: "Your breath is your power—own it.",
            comment: "hold motivation"),
    ],

    .exhale: [
        String(
            localized: "Release what no longer serves you.",
            comment: "exhale motivation"),
        String(
            localized: "Let go of the stress, breathe out peace.",
            comment: "exhale motivation"),
        String(
            localized: "Exhale tension, embrace relaxation.",
            comment: "exhale motivation"),
        String(
            localized: "Feel lighter with every breath out.",
            comment: "exhale motivation"),
        String(
            localized: "Let the negativity fade away.",
            comment: "exhale motivation"),
    ],
]

let phrasesType: [BreathPurpose: [String]] = [
    .calm: [
        String(localized: "Stay grounded, you’re safe here.", comment: "calm motivation"),
        String(
            localized: "The world slows down with your breath.", comment: "calm motivation"),
        String(localized: "Find peace in the stillness.", comment: "calm motivation"),
        String(localized: "This is your moment—embrace it.", comment: "calm motivation"),
        String(
            localized: "Every breath brings you closer to calm.", comment: "calm motivation"),
    ],
    .energy: [
        String(localized: "Feel the energy building inside you.", comment: "energy motivation"),
        String(localized: "Rise higher with every breath.", comment: "energy motivation"),
        String(localized: "You’re unstoppable—just breathe.", comment: "energy motivation"),
        String(localized: "With every inhale, you grow stronger.", comment: "energy motivation"),
        String(localized: "This breath fuels your dreams.", comment: "energy motivation"),
    ],
]

let endMotivationPhrases: [String] = [
    String(
        localized: "You’ve done great—carry this energy forward.", comment: "end motivation"),
    String(localized: "Feel proud of yourself—you’ve earned it.", comment: "end motivation"),
    String(localized: "Take this peace with you into the day.", comment: "end motivation"),
    String(localized: "Your journey is unfolding beautifully.", comment: "end motivation"),
    String(localized: "You’re ready to face anything ahead.", comment: "end motivation"),
]

