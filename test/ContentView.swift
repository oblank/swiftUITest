//
//  ContentView.swift
//  test
//
//  Created by oblank on 7/28/20.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        Text("Hello, world!").padding()
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


struct ContentView: View {
    @ObservedObject var webViewStateModel: WebViewStateModel = WebViewStateModel()
    var body: some View {
        
        NavigationView {
            LoadingView(isShowing: .constant(webViewStateModel.loading)) {
                VStack {
                    //loading logic taken from https://stackoverflow.com/a/56496896/9838937
                    //Add onNavigationAction if callback needed
    //                WebView(url: URL.init(string: "https://www.google.com")!, webViewStateModel: self.webViewStateModel)
                    
                    HtmlTextView(html: "<div>标题123<div>content </div><div>test1<br/>test2</div></div>")
                    
//                    WebView(htmlString: "<h1>标题</h1><div>#content </div><div>test1<br/>test2</div>", webViewStateModel: self.webViewStateModel)
                }
            }
            .navigationBarTitle(Text(webViewStateModel.pageTitle), displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Last Page") {
                    self.webViewStateModel.goBack.toggle()
                }.disabled(!webViewStateModel.canGoBack)
            )
        
     }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

