//
//  ContentView.swift
//  MyMarco
//
//  Created by vito on 2023/9/22.
//

import SwiftUI
import TestSwiftMacro

struct TestMarco {
    init() {
        let test = #stringify(1)
        print("stringify\(test)")
    }
}


struct ContentView: View {
    let TestMarco = TestMarco()
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

#Preview {
    ContentView()

}
