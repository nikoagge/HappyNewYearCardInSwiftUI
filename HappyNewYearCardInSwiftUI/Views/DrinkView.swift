//
//  DrinkView.swift
//  HappyNewYearCardInSwiftUI
//
//  Created by Nikos Aggelidis on 1/1/24.
//

import SwiftUI

struct DrinkView: View {
    let screen = UIScreen.current?.bounds
    @State var isAnimated = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                    getWavePath(
                        interval: screen?.width ?? 0,
                        amplitude: 120,
                        base: 150 + (screen?.height ?? 0) / 2
                    )
                    .foregroundColor(Color.yellow.opacity(0.6))
                    .offset(x: isAnimated ? -1 * (screen?.width ?? 0) : 0)
                    .animation(
                        Animation.linear(duration: 4)
                            .repeatForever(autoreverses: false),
                        value: 1)
                    
                    getWavePath(
                        interval: (screen?.width ?? 0) * 1.2,
                        amplitude: 130,
                        base: 160 + (screen?.height ?? 0) / 2
                    )
                    .foregroundColor(Color.yellow.opacity(0.7))
                    .offset(x: isAnimated ? -1 * (screen?.width ?? 0) * 1.2 : 0)
                    .animation(
                        Animation.linear(duration: 5)
                            .repeatForever(autoreverses: false),
                        value: 1)
                    
                    getWavePath(
                        interval: (screen?.width ?? 0) * 1.5,
                        amplitude: 140,
                        base: 170 + (screen?.height ?? 0) / 2
                    )
                    .foregroundColor(Color.yellow.opacity(1))
                    .offset(x: isAnimated ? -1 * (screen?.width ?? 0) * 1.5 : 0)
                    .animation(
                        Animation.linear(duration: 3)
                            .repeatForever(autoreverses: false),
                        value: 1)
                }
                .offset(
                    x: 0,
                    y: -250
                )
                .onAppear() {
                    self.isAnimated = true
                }
                
                Image(ImageName.drinkWithStrawInsideTheGlass.rawValue)
                    .resizable()
                    .frame(
                        width: 380,
                        height: 560,
                        alignment: .center
                    )
                    .shadow(
                        color: .black,
                        radius: 10,
                        x: 0,
                        y: 0
                    )
            }
        }
    }
    
    private func getWavePath(
        interval: CGFloat,
        amplitude: CGFloat = 100,
        base: CGFloat = (UIScreen.current?.bounds.height ?? 0) / 2
    ) -> Path {
        Path { path in
            path.move(to: CGPoint(
                x: 0,
                y: base
            ))
            
            path.addCurve(
                to: CGPoint(
                    x: 1 * interval,
                    y: base
                ),
                control1: CGPoint(
                    x: interval * 0.35,
                    y: amplitude + base
                ),
                control2: CGPoint(
                    x: interval * 0.65,
                    y: -amplitude + base
                )
            )
            
            path.addCurve(
                to: CGPoint(
                    x: 2 * interval,
                    y: base
                ),
                control1: CGPoint(
                    x: interval * 1.35,
                    y: amplitude + base
                ),
                control2: CGPoint(
                    x: interval * 1.65,
                    y: -amplitude + base
                )
            )
            
            path.addLine(to: CGPoint(
                x: 2 * interval,
                y: screen?.height ?? 0
            ))
            
            path.addLine(to: CGPoint(
                x: 0,
                y: screen?.height ?? 0
            ))
        }
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView()
    }
}
