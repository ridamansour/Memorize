//
//  ContentView.swift
//  Memorize
//
//  Created by Rida Mansour on 7/12/22.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var viewModel: emojiMemoryGame
    
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                ForEach(viewModel.cards) {card in
                    CardView(card: card).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                        viewModel.choose(card)
                    }
                }
            }.foregroundColor(emojiMemoryGame.newColor(emojiMemoryGame())())
            Spacer()
            VStack {
                Button("new game") {
                }
                Label("Trys= \(viewModel.FlipCount())", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
            }
        }.padding(.horizontal)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp && card.isMached == false {
                shape.stroke(lineWidth: 3)
                shape.foregroundColor(.yellow)
                Text(card.content).font(.largeTitle)
                
            } else if card.isMached {
                shape.stroke(lineWidth: 3)
                shape.foregroundColor(.green)
                Text(card.content).font(.largeTitle)
                
            } else {
                shape.fill()
            }
        }.padding(/*@START_MENU_TOKEN@*/.all, 3.0/*@END_MENU_TOKEN@*/)
    }
}



/*
 ContentView is basicly the iphone or the ipad that has the construction of views, as swiftUI is mostly functions and methods, the type of a view is construted from many lego like views.*/
/*
 var body :some View... we are declaring a body variable of a block (Some View)... it can be one type if we are returning only one type of a view, but some view is mostly any type of veiw blocks (Controls), we can turn many blocks into one by using layouts.
 */
/*
 Btw an important note the type of variable text is isn't the same as text("smth").padding(), when we add .smth to any variable it changes its type, and swift is very flexable as it automaticly returns stuff so no need to declare the type of returnwe have when its in the view family
 */

/*
 argument labels are to specify what is the argument is
 */

/*
 .strock() is to remove filling from any SHAPE but also keeping an outline in it
 we can choose the line width by putting the lable (LineWidth: 3) inside of it
 */
/*
 Add modifier is like wix in the Attributes Inspector
 */







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = emojiMemoryGame()
        ContentView(viewModel: game)
    }
}
