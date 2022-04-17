//
//  ContentView.swift
//  DolphiniOS
//
//  Created by mac3 on 2022/04/13.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
            Image("logo")
            Webview(url: URL(string: "http://222.122.196.22:8380/login.frm")!)
        
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
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        let url = webView.url

        if url?.absoluteString.range(of: ".pdf") != nil {
            pdfBackButton.isHidden = false
        }
        else {
            pdfBackButton.isHidden = true
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
