//
//  TestThumbScroll.swift
//  Potpourri
//
//  Created by sufan on 9/1/20.
//

import SwiftUI

class ScrollToModel: ObservableObject {
    enum Action {
        case end
        case top
    }
    @Published var direction: Action? = nil
}


struct TestThumbScroll: View {
    @StateObject var vm = ScrollToModel()
    
    var duration: TimeInterval
    @Binding var isPlaying: Bool
    
    private let thumbnails: [String] = {
        let name = "hello, world!"
        let hashValue = 1234567899
        
        var thumbnails: [String] = []
        
        debugPrint(name, name.hashValue, hashValue)
        
        for i in 1...100 {
            let ingredientIndex = hashValue/(i*10) % unown.count
            thumbnails.append(unown[ingredientIndex])
        }
        
        return thumbnails
    }()
    
    var body: some View {
        
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                ScrollViewReader { scrollView in
                    VStack {
                        ForEach(thumbnails, id: \.self) { thumbnail in
                            
                            Image(systemName: thumbnail)
                                .font(.title)
                                .imageScale(.large)
                            
                        }
                    }
                    .onReceive(vm.$direction) { action in
                        guard !thumbnails.isEmpty else { return }
                        withAnimation(.easeInOut(duration: 5)) {
                            switch action {
                            case .top:
                                scrollView.scrollTo(thumbnails.first!)
                            case .end:
                                scrollView.scrollTo(thumbnails.last!)
                            default:
                                return
                            }
                        }
                    }
                    
                }
            }
//            .ignoresSafeArea()
            
            HStack {
                Button(action: { vm.direction = .top }) { // < here
                    Image(systemName: "arrow.up.to.line")
                        .padding(.horizontal)
                }
                Button(action: { vm.direction = .end }) { // << here
                    Image(systemName: "arrow.down.to.line")
                        .padding(.horizontal)
                }
            }
            .offset(x: -100, y: -100)
            
            Image(systemName: "arrow.up.and.down")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundColor(isPlaying ? .green : .red)
        }
        
    }
}

struct TestThumbScroll_Previews: PreviewProvider {
    static var previews: some View {
        TestThumbScroll(duration: 10, isPlaying: .constant(true))
    }
}
