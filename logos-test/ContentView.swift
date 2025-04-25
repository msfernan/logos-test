//
//  ContentView.swift
//  logos-test
//
//  Created by Mark Fernandez on 2/23/25.
//

import SwiftUI

struct ContentView: View {
    
    let bibleVerses = [
        
        "For I know the plans I have for you, declares the Lord, plans to prosper you and not harm you, plans to give you hope and a future. - Jeremiah 29:11",
        "I can do all things through Christ who strengthens me. - Philippians 4:13",
        "If God is for us, who can be against us? - Romans 8:31",
        "Go, I am with you always. - Matthew 28:20",
        "Therefore I tell you, whatever you ask for in prayer, believe that you will receive it and it shall be yours. - Mark 11:24 ",
        "Ask and you shall receive, seek and you shall find, knock and it will be opened for you. For everyone who asks receives and he who seeks finds to him that knocks it is openend. - Matthew 7:7-8",
        "A thousand may fall at your side, ten thousand at your right hand but it shall not come near you. - Psalm 91:7",
        "Trust in the Lord with all your heart and lean not on your own understanding. - Proverbs 3:5",
        "In pastures green he leadeth me. - Psalm 23:2",
        "And Jesus said to him, 'If you can? Everything is possible for one who believes.' - Mark 9:23",
        "So do not fear, for I am with you; do not be dismayed, for I am your God. I will strengthen you and help you; I will uphold you with my righteous right hand. - Isaiah 41:10",
        "I will make of you a great nation and I will bless you; I will make your name great, so that you will be a blessing. - Genesis 12:2",
        "I will bless those who bless you, I will curse those who curse you. All families of the Earth will find blessing in you. - Genesis 12:3",
        "You intended to harm me, but God intended it for good to accomplish what is being done, the saving of many lives. - Genesis 50:20",
        "Blessed are you O Lord my God for you have shown mercy toward two only children. - Tobit 8:17",
        "The Lord is my shepherd. I shall not want. - Psalm 23:1",
        "I will not leave you as orphans; I will come to you. - John 14:18",
        "God sets the lonely in families, he leads out the prisoners with singing; but the rebellious live in a sun-scorched land. - Psalm 68:6",
        "The Lord is close to the brokenhearted and saves those who are crushed in spirit. - Psalm 34:18",
        "By you, I can outrun a troop. By my God I can leap over a wall. - Psalm 18:29",
        "For who is God except the Lord? And who is a rock except our God. - Psalm 18:31"
    ]
    
    let images = ["green-branch-white-social-template",
                  "beach",
                  "moon-rising",
                  "pink-mountain"]
    
    @State private var randomVerse = "For I know the plans I have for you, declares the Lord, plans to prosper you and not harm you, plans to give you hope and a future. - Jeremiah 29:11"
    @State private var randomImage = "green-branch-white-social-template"
    @State private var xOffset: CGFloat = 0

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
                })
        )
    }
}

#Preview {
    ContentView()
}
