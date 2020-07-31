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

struct PageViewItem {
    var image: UIImage
    var text: String?
}

struct PagerView: UIViewRepresentable {
    let items: [PageViewItem]
    let frame: CGRect?
    let automaticSlidingInterval: CGFloat?
    
    class Coordinator: NSObject, FSPagerViewDelegate, FSPagerViewDataSource {
        var parent: PagerView
        
        init(_ parent: PagerView) {
            self.parent = parent
        }
        
        func numberOfItems(in pagerView: FSPagerView) -> Int {
            return parent.items.count
        }
        
        func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
            cell.imageView?.image = parent.items[index].image
            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.clipsToBounds = true
            cell.textLabel?.text = parent.items[index].text
            return cell
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> FSPagerView {
        let pagerView = frame != nil ? FSPagerView(frame: frame!) : FSPagerView()
        if automaticSlidingInterval != nil {
            pagerView.automaticSlidingInterval = automaticSlidingInterval!
        }
        pagerView.delegate = context.coordinator
        pagerView.dataSource = context.coordinator
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")

        return pagerView
    }
    
    func updateUIView(_ uiView: FSPagerView, context: Context) {
        if frame != nil {
            uiView.frame = frame!
        }
        if automaticSlidingInterval != nil {
            uiView.automaticSlidingInterval = automaticSlidingInterval!
        }
        
//        uiView.delegate = context.coordinator
//        uiView.dataSource = context.coordinator
    }
}
