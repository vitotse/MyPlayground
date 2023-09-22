import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    var body: some View {
        
        /// 渲染顺序问题
        Text(" Hello Swift UI")
            .frame(width: 20, height: 20)
            .background(Color.red)
            .padding(20)
            .background(Color.blue)
        
    }
    
}

PlaygroundPage.current.setLiveView(ContentView())

