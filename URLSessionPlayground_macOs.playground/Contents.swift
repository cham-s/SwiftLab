import Cocoa
import PlaygroundSupport
import WebKit

import WebKit

struct URLLoader {
    var url: URL
    private var webView: WKWebView
    
    init?(urlString: String) {
        if let url = URL(string: urlString) {
            self.url = url
        } else {
            return nil
        }
        webView = WKWebView(frame: NSRect(x: 100, y: 100, width: 320, height: 780))
    }
    
    public func load() {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.handleError(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    self.handleServerError(response)
                    return
            }
            
            if let mimeType = httpResponse.mimeType, mimeType == "text/html",
                let data = data,
                let string = String(data: data, encoding: .utf8) {
                DispatchQueue.global().async {
                    self.webView.loadHTMLString(string, baseURL: self.url)
                    //PlaygroundPage.current.liveView = self.webView
                    print(string)
                }
            } else {
                print("mime type not handled")
            }
        }
        task.resume()
    }
    
    private func handleError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    private func handleServerError(_ response: URLResponse?) {
        if let httpResponse = response as? HTTPURLResponse {
            print("error number: \(httpResponse.statusCode)")
        } else {
            print("some weird error")
        }
    }
}


func run() {
    let group = DispatchGroup()
    group.enter()
    if let loader = URLLoader(urlString: "https://apple.com") {
        DispatchQueue.global().async {
            loader.load()
        }
        
        group.wait()
        return
    } else {
        print("bad url")
    }
}

run()



