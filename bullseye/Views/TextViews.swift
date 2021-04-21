//
//  TextViews.swift
//  bullseye
//
//  Created by John Jeang on 4/21/21.
//

import SwiftUI

struct InstructionView: View {
  var text: String
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .kerning(2.0)
      .bold()
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
  }
}

struct BigNumberView: View{
  var text: String
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
  }
}



struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionView(text: "Instructions")
      BigNumberView(text: "99")
    }
  }
}
