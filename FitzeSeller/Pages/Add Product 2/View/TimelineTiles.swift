//
//  TimelineTiles.swift
//  FitzeSeller
//
//  Created by Bryan Kenneth on 16/11/22.
//

import SwiftUI

struct TimelineTiles: View {
    let number: Int
    @Binding var chosenPhase: Int
    let screen = NSScreen.main?.visibleFrame
//    @Binding var isLocked: Bool
//    @Binding var isNextLocked: Bool
    
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .fill(number <= chosenPhase ? Color.primaryColor : Color.lightGrey2)
                    .frame(width: 85, height: 85)
                
                if number > chosenPhase {
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 32))
                } else {
                    Text(String(number))
                        .font(.custom("Sora-Bold", size: 32))
                        .foregroundColor(Color.backgroundColor)
                }
               
            }
            if number != 4 {
                if number > chosenPhase || chosenPhase == 1 {
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .frame(width: screen!.width*0.1157407407,height: 1)
                } else {
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .frame(width: screen!.width*0.1157407407,height: 1)
                }

            }
        }
    }
    
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

//struct TimelineTiles_Previews: PreviewProvider {
//    static var previews: some View {
//        TimelineTiles()
//    }
//}
