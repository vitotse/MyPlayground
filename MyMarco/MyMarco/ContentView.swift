//
//  ContentView.swift
//  MyMarco
//
//  Created by vito on 2023/9/22.
//

import SwiftUI
import VTMacro

struct TestMarco {
    
    #constant("error_tip")

    init() {
        let test = #stringify(1)
        print("stringify\(test)")
        
    }
}

struct ContentView: View {
//    let testMarco = TestMarco()
    let vm = VM()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }

}

class VM {
    
    init() {
        setup()
    }
    
    func setup() {
        print("\(TestMarco.errorTip)")
    }
    
}

#Preview {
    ContentView()

}
