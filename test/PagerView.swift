//
//  FSPagerView.swift
//  test
//
//  Created by oblank on 7/30/20.
//
//  some konwledge taken from: https://www.hackingwithswift.com/books/ios-swiftui/using-coordinators-to-manage-swiftui-view-controllers
//

import SwiftUI
import FSPagerView

struct PagerView: UIViewRepresentable {
    let frame: CGRect
    let automaticSlidingInterval: CGFloat? = nil
    
    class Coordinator: NSObject, FSPagerViewDelegate, FSPagerViewDataSource {
        func numberOfItems(in pagerView: FSPagerView) -> Int {
            return 5
        }
        
        func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
            // TODO 
//                cell.imageView?.image = ...
//                cell.textLabel?.text = ...
                return cell
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIView(context: Context) -> FSPagerView {
        // Create a pager view
        let pagerView = FSPagerView(frame: frame)
        if automaticSlidingInterval == nil {
            pagerView.automaticSlidingInterval = automaticSlidingInterval!
        }
        pagerView.delegate = context.coordinator
        pagerView.dataSource = context.coordinator
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")

        return pagerView
    }
    
    func updateUIView(_ uiView: FSPagerView, context: Context) {
        uiView.frame = frame
        
//        uiView.delegate = context.coordinator
//        uiView.dataSource = context.coordinator
    }
}
