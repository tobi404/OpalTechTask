//
//  Line.swift
//  OpalTechTask
//
//  Created by Beka Demuradze on 13.12.24.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        if rect.width > rect.height {
            // Horizontal line if width > height
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        } else {
            // Vertical line if height >= width
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }

        return path
    }
}
