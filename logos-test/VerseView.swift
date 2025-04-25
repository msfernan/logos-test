//
//  VerseView.swift
//  logos-test
//
//  Created by Mark Fernandez on 4/24/25.
//

import SwiftUI

struct VerseView: View {
    let bibleVerses : [String]
    let images  : [String]
    
    @State private var randomVerse : String = "No verse available"
    @State private var randomImage : String = "green-branch-white-social-template"
    @State private var xOffset: CGFloat = 0
    
    init(bibleVerses: [String], images: [String]) {
        self.bibleVerses = bibleVerses
        self.images = images
        _randomVerse = State(initialValue: bibleVerses.first ?? "No verse available")
        _randomImage = State(initialValue: images.first ?? "green-branch-white-social-template")
    }

    func getBibleVerse() {
        var prevRandomVerse = randomVerse
        while (randomVerse == prevRandomVerse) {
            randomVerse = bibleVerses.randomElement() ?? "No verse available"
        }
        prevRandomVerse = randomVerse
    }
    
    func getBackgroundImage() {
        var prevRandomImage = randomImage
        while (randomImage == prevRandomImage) {
            randomImage = images.randomElement() ?? "green-branch-white-social-template"
        }
        prevRandomImage = randomImage
    }
    
    func changeAppScreen() {
        withAnimation(Animation
            .easeInOut(duration: 2.0)) {
                getBibleVerse()
                getBackgroundImage()
            }
    }
    
    var body: some View {
        
        ZStack{
            Image(randomImage)
            .resizable()
            .ignoresSafeArea()
            VStack {
                Text(randomVerse)
                    .font(.custom("Georgia", size: 18))
                    .padding()
                    .multilineTextAlignment(.center)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                
                Button(action: changeAppScreen)
                {
                    Text("Get Random Verse")
                }
                .padding()
            }
            .onAppear() {
                // do nothing
            }
        }
        .offset(x : xOffset)
        .gesture(
            DragGesture()
                .onChanged ({ value in
                    xOffset = value.translation.width
                }).onEnded({ value in
                    onDragEnded(value)
                })
        )
    }
}

private extension VerseView {
    func onDragEnded(_ value : _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        if (abs(width) < 300) {
            xOffset = 0
        }
    }
}
