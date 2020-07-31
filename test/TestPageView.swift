//
//  TestPageView.swift
//  test
//
//  Created by oblank on 7/31/20.
//

import SwiftUI

let items: [PageViewItem] = [
    PageViewItem(image: UIImage(named: "01")!, text: "TITLE 01"),
    PageViewItem(image: UIImage(named: "02")!, text: "TITLE 02"),
    PageViewItem(image: UIImage(named: "03")!, text: "TITLE 03")
]

struct TestPageView: View {
    var body: some View {
        PagerView(items: items, frame: CGRect(x: 0, y: 0, width: 300, height: 200), automaticSlidingInterval: 3.0)
        
    }
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        TestPageView()
    }
}
