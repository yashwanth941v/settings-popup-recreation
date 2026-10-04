//
//  ContentView.swift
//  Settings Popup
//
//  Created by Yashwanth V on 04/10/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSettings = false
    
    var body: some View {
        
        NavigationStack{
            Color.clear.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Home").font(.largeTitle).bold(true)        .fixedSize(horizontal: true, vertical: false)

                    }.sharedBackgroundVisibility(.hidden)
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {showSettings = true}
                        label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                    
                }
        }.sheet(isPresented: $showSettings) {
            Text("Settings go here")
            
        }
        
    }
}

#Preview {
    ContentView()
}
