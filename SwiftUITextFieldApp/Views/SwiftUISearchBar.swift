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
  
    func makeUIView(context: UIViewRepresentableContext<SwiftUISearchBar>) -> UISearchBar {
        
        let searchBar = UISearchBar(frame: .zero)
        searchBar.prompt = "Enter search string..."
        searchBar.returnKeyType = .search
        searchBar.showsSearchResultsButton = true
        searchBar.delegate = context.coordinator
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SwiftUISearchBar>) {
        print("Update UISearchBar")
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(parent:self)
    }
    
    
    class SearchBarCoordinator:NSObject,UISearchBarDelegate{
        let parent:SwiftUISearchBar
        
        init(parent:SwiftUISearchBar){
            self.parent=parent
        }
        
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            print("did end....")
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print(searchText)
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            print("Search Button clicked")
            searchBar.resignFirstResponder()
        }
        
        func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
            print("SearchBar request end editing")
            return true
        }
        
    }
    
}
