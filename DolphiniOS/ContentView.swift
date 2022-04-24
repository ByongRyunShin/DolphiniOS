//
//  ContentView.swift
//  DolphiniOS
//
//  Created by mac3 on 2022/04/13.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State var isLoading: Bool = true
    var body: some View {
        ZStack {
            // 1) CHANGED: zIndex added
            // 앱 화면
            Webview(url: URL(string: "http://222.122.196.22:8380/login.frm")!)
                    
            // Launch Screen
            if isLoading {
                // 2) CHANGED: transition and zIndex added
                launchScreenView.transition(.opacity).zIndex(1)
            }
                    
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                //3) CHANGED: withAnimation added
                withAnimation { isLoading.toggle() }
            })
        }
    }
}

extension ContentView {
    
    var launchScreenView: some View {
        
        ZStack(alignment: .center) {
            Image("logo")
        }
        
    }
    
}

struct Webview: UIViewRepresentable {
    let url: URL
    func makeUIView(context: UIViewRepresentableContext<Webview>) -> WKWebView {
        let webview = WKWebView()
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
        return webview
    }
    func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<Webview>) {
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
