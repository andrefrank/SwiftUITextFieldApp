//
//  SwiftUITextField_.swift
//  SwiftUITextField
//
//  Created by Andre Frank on 16.11.19.
//  Copyright © 2019 Afapps+. All rights reserved.
//

import SwiftUI
import UIKit


struct SwiftUITextField: UIViewRepresentable {
    var onCommit: (() -> Void)?
    var onChange: ((String) -> Void)?
    
    init(onCommitHandler: @escaping (() -> Void), onChangeHandler: @escaping ((String) -> Void)) {
        self.onCommit = onCommitHandler
        self.onChange = onChangeHandler
    }
    
    //MARK: - UIViewPresentable protocol
    func makeUIView(context: UIViewRepresentableContext<SwiftUITextField>) -> UITextField {
        ///Create the UITextfield and set the Delegate
        let uiTextField = UITextField(frame: .zero)
        uiTextField.delegate = context.coordinator
        return uiTextField
    }
    
    ///The coordinator will  be the delegate
    func makeCoordinator() -> SwiftUITextField.UITextFieldCoordinator {
        return UITextFieldCoordinator(parent: self)
    }
    
    ///Set default visibility properties during updates for UITextfield
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<SwiftUITextField>) {
        ///Give the UITextfield maximum horziontal width ( low priority to shrink width
        uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        /// Give freedom for limit the height otherwise the textfield will use the maximum possible height when no other constraints are set
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
    /// The coordinator class which will be the delegate
    class UITextFieldCoordinator: NSObject, UITextFieldDelegate {
        ///The parent will be the SwiftUI View which will receive the specified handler methods onCommit/onChange
        let parent: SwiftUITextField
        
        init(parent: SwiftUITextField) {
            self.parent = parent
        }
        
        /// Inform SwiftUI about the end of editing
        func textFieldDidEndEditing(_ textField: UITextField) {
            self.parent.onCommit?()
        }
        
        /// Resign focus
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                textField.resignFirstResponder()
            return false
        }
        
        /// For validation purposes
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // Check if there is any text available and override due to your personal expression rules...
            if let currentText = textField.text as NSString? {
                let proposedText = currentText.replacingCharacters(in: range, with: string as String)
                parent.onChange?(proposedText)
            }
            return true
        }
    }
}
