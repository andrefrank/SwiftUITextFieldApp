//
//  SwiftUISearchBar.swift
//  SwiftUITextFieldApp
//
//  Created by Andre Frank on 16.11.19.
//  Copyright © 2019 Afapps+. All rights reserved.
//

import SwiftUI
import UIKit

struct SwiftUISearchBar:UIViewRepresentable{
    var shouldSearch=false
    
    var searchText:String=""
    
    let onCommit:((String)->Void)?
    let onCancel:(()->Void)?
    let onChange:((String)->Void)?
    
    init(onCommit: @escaping (String)->Void , onChange:@escaping (String)->Void, onCancel:@escaping ()->Void){
        
        self.onCommit = onCommit
        self.onChange = onChange
        self.onCancel = onCancel
    }
  
    func makeUIView(context: UIViewRepresentableContext<SwiftUISearchBar>) -> UISearchBar {
        
        let searchBar = UISearchBar(frame: .zero)
        searchBar.prompt = "Enter search string..."
        searchBar.returnKeyType = .search
        searchBar.delegate = context.coordinator
        searchBar.text = searchText
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SwiftUISearchBar>) {
        print("Update UISearchBar")
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(parent:self)
    }
    
    
    class SearchBarCoordinator:NSObject,UISearchBarDelegate{
        var parent:SwiftUISearchBar
        
        init(parent:SwiftUISearchBar){
            self.parent=parent
        }
        
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            if !self.parent.shouldSearch{
                searchBar.text = ""
                self.parent.onCancel?()
                
            }else{
                if let searchText = searchBar.text {
                    self.parent.onCommit?(searchText)
                }
                self.parent.shouldSearch = false
            }
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.parent.onChange?(searchText)
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            self.parent.shouldSearch = true
            searchBar.resignFirstResponder()
        }
        
        func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
            return true
        }
        
    }
    
}
