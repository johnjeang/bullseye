//
//  Shapes.swift
//  bullseye
//
//  Created by John Jeang on 4/21/21.
//

import SwiftUI

struct Shapes: View {
  @State private var wideShapes = true
  
  var body: some View {
    VStack{
      
      if !wideShapes {
        Circle()
        //.fill(Color.blue)
          //.inset(by: 10.0)  //keeps outline border on inside only
          //.stroke(Color.blue, lineWidth: 20.0)
          // strokeBorder essentially does the same thing as inset on stroke
          .strokeBorder(Color.blue, lineWidth: 20.0)
          .frame(width: 200.0, height: 100.0)
          .transition(.scale)
      }
      Capsule()
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100.0)
      Ellipse()
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100.0)
      Button(action:{
              withAnimation {
                wideShapes.toggle()}
      }, label: {
        Text("Animate!")
      })
      
      
      

    }
    .background(Color.green)
    

    
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
