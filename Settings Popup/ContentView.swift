//
//  ContentView.swift
//  Settings Popup
//
//  Created by Yashwanth V on 04/10/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSettings = false
    @State private var showLabels = true
    @State private var previewLines = 2
    @State private var swipeOpt = "Archive"
    @State private var askBeforeDel = true
    
    var body: some View {
        
        NavigationStack{
            Color.clear.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Home").font(.largeTitle).bold(true)
                            .fixedSize(horizontal: true, vertical: false)

                    }.sharedBackgroundVisibility(.hidden)
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {showSettings = true}
                        label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                    
                }
        }.sheet(isPresented: $showSettings) {
            
            NavigationStack {
                Form {
                    Section("Message List") {
                        
                            NavigationLink{
                                Form{
                                    Section{
                                        Picker("Swipe Options", selection: $swipeOpt)
                                        {
                                            Text("Archive").tag("Archive")
                                            Text("Delete").tag("Delete")
                                            Text("Mark Read").tag("Mark Read")
                                            Text("Mark Unread").tag("Mark Unread")
                                            Text("None").tag("None")
                                        }.pickerStyle(.inline)
                                            .labelsHidden()
                                    }
                                    
                                }
                                .navigationTitle("Swipe Options")
                                .navigationBarTitleDisplayMode(.inline)
                            } label: {
                            Text("Swipe Options")}
                        
                            NavigationLink {
                                Form {
                                    Section {
                                        Picker("Preview", selection: $previewLines) {
                                            Text("1 Line").tag(1)
                                            Text("2 Lines").tag(2)
                                            Text("3 Lines").tag(3)
                                            Text("4 Lines").tag(4)
                                        }
                                        .pickerStyle(.inline)
                                        .labelsHidden()
                                    }
                                }
                                .navigationTitle("Preview")
                                .navigationBarTitleDisplayMode(.inline)
                            } label: {
                            LabeledContent("Preview", value: "\(previewLines) Lines")}
                        
                            Toggle("Show To/Cc Labels", isOn: $showLabels)
                    }
                    
                    
                    Section("Messages") {
                        
                            Toggle("Ask Before Deleting", isOn: $askBeforeDel)
                        
                    }
                }
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
            }
            .presentationDragIndicator(.visible)
            }
                    
                }
            }


#Preview {
    ContentView()
}
