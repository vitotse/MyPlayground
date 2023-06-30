//: [Previous](@previous)

import SwiftUI
import UIKit
import PlaygroundSupport

// MARK: - UILabel

struct UIKitLable: UIViewRepresentable {
    typealias UIViewType = UILabel
    
    var text: String
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = text
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
    
}

struct LabelTestView: View {
    
    @State var content: String = "I'm a UIKit label"
    
    var body: some View {
        VStack {
            UIKitLable(text: content)
                .frame(width: 100, height: 21)
            Button("修改内容") {
                self.content = "I'm a UIKit label \(arc4random())"
            }
            
        }
        
    }
}

//PlaygroundPage.current.setLiveView(LabelTestView())


// MARK: - UIViewController
struct UIKitViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    var bgColor: UIColor
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = self.bgColor
        return vc
    }
    
    
    func updateUIViewController(_ vc: UIViewController, context: Context) {
        print("update")
    }
    
}

struct UIKitViewControllerView: View {
    var body: some View {
        UIKitViewController(bgColor: UIColor.blue)
    }
    
}

PlaygroundPage.current.setLiveView(UIKitViewControllerView())



//: [Next](@next)
