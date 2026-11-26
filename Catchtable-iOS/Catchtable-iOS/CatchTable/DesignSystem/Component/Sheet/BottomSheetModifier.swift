//
//  BottomSheetModifier.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/26/26.
//

import SwiftUI

private struct BottomSheetModifier<SheetContent: View>: ViewModifier {
    @State private var dragOffset: CGFloat = 0
    @Binding var isPresented: Bool

    let onDismiss: () -> Void
    @ViewBuilder let sheetContent: () -> SheetContent

    private let cornerRadius: CGFloat = 36
    private let dismissThreshold: CGFloat = 100

    func body(content: Content) -> some View {
        content
            .overlay {
                if isPresented {
                    Color.black70
                        .ignoresSafeArea()
                        .onTapGesture { isPresented = false }
                        .transition(.opacity)
                }
            }
            .overlay(alignment: .bottom) {
                if isPresented {
                    sheetContent()
                        .frame(maxWidth: .infinity)
                        .background {
                            UnevenRoundedRectangle(
                                topLeadingRadius: cornerRadius,
                                topTrailingRadius: cornerRadius
                            )
                            .fill(Color.white)
                            .ignoresSafeArea(edges: .bottom)
                        }
                        .offset(y: dragOffset)
                        .gesture(dragGesture)
                        .transition(.move(edge: .bottom))
                }
            }
            .animation(.easeInOut(duration: 0.25), value: isPresented)
            .onChange(of: isPresented) { _, isPresented in
                guard !isPresented else { return }
                dragOffset = 0
                onDismiss()
            }
    }

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                dragOffset = max(0, value.translation.height)
            }
            .onEnded { value in
                if value.translation.height > dismissThreshold {
                    isPresented = false
                } else {
                    withAnimation(.easeOut(duration: 0.2)) {
                        dragOffset = 0
                    }
                }
            }
    }
}

extension View {
    func bottomSheet<SheetContent: View>(
        isPresented: Binding<Bool>,
        onDismiss: @escaping () -> Void = {},
        @ViewBuilder content: @escaping () -> SheetContent
    ) -> some View {
        modifier(
            BottomSheetModifier(
                isPresented: isPresented,
                onDismiss: onDismiss,
                sheetContent: content
            )
        )
    }
}
