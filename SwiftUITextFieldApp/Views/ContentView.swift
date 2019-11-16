//
//  SwiftUITextField.swift
//  WrappedTextField
//
//  Created by Andre Frank on 15.11.19.
//  Copyright © 2019 Afapps+. All rights reserved.
//

import SwiftUI


let labels = ["Name:", "Email:"]

struct ContentView: View {
    @State var textInput: String = ""
    
    var body: some View {
        VStack {
            SwiftUISearchBar()
            HStack {
                { () -> Text in
                    Text(labels[0])
                }()
                SwiftUITextField(onCommitHandler: {
                    print(self.textInput)
                }) { text in
                    self.textInput = text
                    print(self.textInput)
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)).background(Color.red)
            }.padding(10)
            
            HStack {
                { () -> Text in
                    Text(labels[1])
                }()
                SwiftUITextField(onCommitHandler: {
                    print(self.textInput)
                }) { text in
                    self.textInput = text
                    print(self.textInput)
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)).background(Color.red)
                }.padding(10)
        }
    }
    
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}


