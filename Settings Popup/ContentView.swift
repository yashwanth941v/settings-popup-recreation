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
    @State private var privacyProtection = "Standard"
    @State private var followUpSuggestions = false
    @State private var organizeByThread = true
    @State private var mutedThreadAction = "Mark Read"
    @State private var threadSortOrder = "Newest First"
    @State private var collapseReadThreads = false
    @State private var autoExpandThreads = true
    @State private var notifyOnMutedThread = false
    @State private var threadGrouping = "By Subject"
    
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
                            
                            NavigationLink {
                                Form {
                                    Section {
                                        Picker("Privacy Protection", selection: $privacyProtection) {
                                            Text("Standard").tag("Standard")
                                            Text("Enhanced").tag("Enhanced")
                                            Text("Maximum").tag("Maximum")
                                            Text("Off").tag("Off")
                                        }
                                        .pickerStyle(.inline)
                                        .labelsHidden()
                                    }
                                }
                                .navigationTitle("Privacy Protection")
                                .navigationBarTitleDisplayMode(.inline)
                            } label: {
                                Text("Privacy Protection")
                            }
                            
                            Toggle("Follow-up Suggestions", isOn: $followUpSuggestions)
                        
                    }
                    
                    Section("Threading") {
                        
                        Toggle("Organise by Thread", isOn: $organizeByThread)
                        
                        NavigationLink {
                            Form {
                                Section {
                                    Picker("Muted Thread Action", selection: $mutedThreadAction) {
                                        Text("Mark Read").tag("Mark Read")
                                        Text("Archive").tag("Archive")
                                        Text("Delete").tag("Delete")
                                        Text("Do Nothing").tag("Do Nothing")
                                    }
                                    .pickerStyle(.inline)
                                    .labelsHidden()
                                }
                            }
                            .navigationTitle("Muted Thread Action")
                            .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            LabeledContent("Muted Thread Action", value: mutedThreadAction)
                        }
                        
                        NavigationLink {
                            Form {
                                Section {
                                    Picker("Thread Sort Order", selection: $threadSortOrder) {
                                        Text("Newest First").tag("Newest First")
                                        Text("Oldest First").tag("Oldest First")
                                        Text("Most Active").tag("Most Active")
                                        Text("Alphabetical").tag("Alphabetical")
                                    }
                                    .pickerStyle(.inline)
                                    .labelsHidden()
                                }
                            }
                            .navigationTitle("Thread Sort Order")
                            .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            LabeledContent("Thread Sort Order", value: threadSortOrder)
                        }
                        
                        Toggle("Collapse Read Threads", isOn: $collapseReadThreads)
                        
                        Toggle("Auto-expand Threads", isOn: $autoExpandThreads)
                        
                        Toggle("Notify on Muted Threads", isOn: $notifyOnMutedThread)
                        
                    }
                    
                    Section("Notifications") {
                        
                        Toggle("Thread Replies", isOn: .constant(true))
                        
                        Toggle("Mentions", isOn: .constant(true))
                        
                        NavigationLink {
                            Form {
                                Section {
                                    Picker("Notification Sound", selection: .constant("Default")) {
                                        Text("Default").tag("Default")
                                        Text("Chime").tag("Chime")
                                        Text("Bell").tag("Bell")
                                        Text("None").tag("None")
                                    }
                                    .pickerStyle(.inline)
                                    .labelsHidden()
                                }
                            }
                            .navigationTitle("Notification Sound")
                            .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            LabeledContent("Notification Sound", value: "Default")
                        }
                        
                        Toggle("Vibration", isOn: .constant(true))
                        
                        Toggle("Badge App Icon", isOn: .constant(true))
                        
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
