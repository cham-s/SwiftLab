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

@available(OSX 10.13, *)
class MySession: NSObject, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate {
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        return URLSession(configuration: configuration,
                          delegate: self, delegateQueue: nil)
    }()
    
    var receivedData: Data?
    
    func startLoad() {
        let url = URL(string: "https://apple.com")!
        receivedData = Data()
        let task = session.dataTask(with: url)
        task.resume()
    }
    
    // delegate methods
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask,
                    didReceive response: URLResponse,
                    completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        guard let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode),
            let mimeType = response.mimeType,
            mimeType == "text/html" else {
                
                completionHandler(.cancel)
                return
        }
        
        completionHandler(.allow)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.receivedData?.append(data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask,
                    didCompleteWithError error: Error?) {
        DispatchQueue.global().async {
            if let error = error {
                self.handleClientError(error)
            } else if let receivedData = self.receivedData,
                let string = String(data: receivedData, encoding: .utf8) {
                print(string)
            } else {
                print("no data")
            }
        }
    }
    
    func handleClientError(_ error: Error) {
        print(error.localizedDescription)
    }
}


@available(OSX 10.13, *)
func run() {
    let group = DispatchGroup()
    group.enter()
    let loader = MySession()
    DispatchQueue.global().async {
        loader.startLoad()
    }
    
    group.wait()
    return
}

if #available(OSX 10.13, *) {
    run()
} else {
    // Fallback on earlier versions
    // TODO: handle earlier version
}
