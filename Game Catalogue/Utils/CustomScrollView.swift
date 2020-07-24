//
//  CustomScrollView.swift
//  Game Catalogue
//
//  Created by Wanhar on 24/07/20.
//

import Foundation
import SwiftUI

struct CustomScrollView<ROOTVIEW>: UIViewRepresentable where ROOTVIEW: View {
    
    var width : CGFloat, height : CGFloat
    let handlePullToRefresh: () -> Void
    let rootView: () -> ROOTVIEW
    
    func makeCoordinator() -> Coordinator<ROOTVIEW> {
        Coordinator(self, rootView: rootView, handlePullToRefresh: handlePullToRefresh)
    }

    func makeUIView(context: Context) -> UIScrollView {
        let control = UIScrollView()
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(context.coordinator, action:
            #selector(Coordinator.handleRefreshControl),
                                          for: .valueChanged)

        let childView = UIHostingController(rootView: rootView() )
        childView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        control.addSubview(childView.view)
        return control
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {}

    class Coordinator<ROOTVIEW>: NSObject where ROOTVIEW: View {
        var control: CustomScrollView
        var handlePullToRefresh: () -> Void
        var rootView: () -> ROOTVIEW

        init(_ control: CustomScrollView, rootView: @escaping () -> ROOTVIEW, handlePullToRefresh: @escaping () -> Void) {
            self.control = control
            self.handlePullToRefresh = handlePullToRefresh
            self.rootView = rootView
        }

        @objc func handleRefreshControl(sender: UIRefreshControl) {

            sender.endRefreshing()
            handlePullToRefresh()
           
        }
    }
}
