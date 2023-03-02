//
//  TestView.swift
//  Potpourri
//
//  Created by sufan on 8/31/20.
//

import SwiftUI
import AVKit

struct TestView: View {
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate
        case vanilla
        case strawberry

        var id: String { self.rawValue }
    }

    @State private var bindBoolean = false
    @State private var bindString = ""
    @State private var bindDouble: Double = 0.5
    @State private var bindFloat = 0.1
    @State private var bindInt = 0
    @State private var bindColor = Color.accentColor
    @State private var bindPicker = Flavor.chocolate
    
    var body: some View {
        ScrollView() {
//            VideoPlayer(player: AVPlayer(url:  URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4")!)) {
//                VStack {
//                    Text("Watermark")
//                        .font(.caption)
//                        .foregroundColor(.white)
//                        .background(Color.black.opacity(0.7))
//                        .clipShape(Capsule())
//                    Spacer()
//                }
//            }
            
            Group {
                Button(action: { bindBoolean.toggle() }) {
                    Text("Show details")
                }
                
                ColorPicker("Title", selection: $bindColor)
                
                DatePicker(selection: .constant(Date()), label: { Text("Date") })
                
                DisclosureGroup("DisclosureGroup", isExpanded: $bindBoolean) {
                    Toggle("On", isOn: $bindBoolean)
                    Toggle("Off", isOn: Binding<Bool>(
                        get: { !bindBoolean },
                        set: { bindBoolean = !$0 }
                    ))
                }
                
                EditButton()
                
                Form {
                    TextField("Username", text: $bindString)
                }
                
                GroupBox(label: Text("GroupBox")) {
                    Text("Group")
                }
                
                Label("42.circle", systemImage: "42.circle")
                
                Link(destination: URL(string: "https://www.google.com")!) {
                    Text("Link")
                }
                
                Picker("Picker", selection: $bindPicker) {
                    Label(Flavor.chocolate.id, systemImage: "wind.snow").tag(Flavor.chocolate)
                    Text(Flavor.chocolate.id).tag(Flavor.chocolate)
                    Text(Flavor.vanilla.id).tag(Flavor.vanilla)
                    Text(Flavor.strawberry.id).tag(Flavor.strawberry)
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .tag(Flavor.strawberry)
                }
            }
                
            Group {
                ProgressView("Progress", value: bindFloat)
                
                SecureField("Enter a password", text: $bindString)
                
//                SignInWithAppleButton(
//                    .signIn,
//                    onRequest: { request in
//                        request.requestedScopes = [.fullName, .email]
//                    },
//                    onCompletion: { result in
//                        switch result {
//                        case .success (let authResults):
//                            debugPrint("Authorization successful. ", authResults)
//                        case .failure (let error):
//                            debugPrint("Authorization failed: " + error.localizedDescription)
//                        }
//                    }
//                )

                Slider(value: $bindDouble, in: 0...1, step: 0.1)
                
                Stepper(value: $bindInt, in: 0...20) {
                    Text("Step: \(bindInt)")
                }
            }
        }
        .padding()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
