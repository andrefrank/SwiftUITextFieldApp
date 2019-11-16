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
    @State var searchText:String = ""
    
    var body: some View {
        VStack {
            SwiftUISearchBar(onCommit: { (search) in
                ///Perform search
                print(self.searchText)
                self.searchText = search
            }, onChange: { (search) in
                ///Validate search
               self.searchText = search
            }, onCancel: {
                /// User cancels search
                self.searchText = ""
            })
            HStack {
                { () -> Text in
                    Text(labels[0])
                }()
               
                SwiftUITextField(onCommitHandler: {
                /// The commitHandler will called when user tabs on other views or by pressing the 'return button'
                    print(self.textInput)
                }) { text in
                    /// the onChangeHandler will be called when the user enters a new character
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


