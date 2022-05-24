//
//  testManualView.swift
//  crew-training
//
//  Created by Hikaru Jitsukawa on 2022/05/24.
//

import SwiftUI

struct testManualView: View {
    
    var imageNames: [String]
    
    @State private var index: Int = 0
    @State private var offset: CGFloat = 0
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<self.imageNames.count) {
                        Image(self.imageNames[$0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: geometry.size.width)
                    }
                }
            }
            .content.offset(x: self.offset)
            .frame(width: geometry.size.width, height: nil, alignment: .leading)
            .gesture(DragGesture()
                .onChanged({ value in
                    self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                    
                })
                .onEnded({ value in
                    let scrollThreshold = geometry.size.width / 2
                    if value.predictedEndTranslation.width < -scrollThreshold {
                        self.index = min(self.index + 1, self.imageNames.endIndex - 1)
                    } else if value.predictedEndTranslation.width > scrollThreshold {
                        self.index = max(self.index - 1, 0)
                    }
                    
                    withAnimation{
                        self.offset = -geometry.size.width * CGFloat(self.index)
                    }
                })
            )
        }
    }
}

struct testManualView_Previews: PreviewProvider {
    static var previews: some View {
        testManualView(imageNames: [
            "IMG_0583",
            "IMG_0587",
            "IMG_0588"
        ])
    }
}
