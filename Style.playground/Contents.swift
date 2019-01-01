import UIKit
import Foundation

public class FileReader {
    var delimiter: Data
    var filename: String
    private let fileHandle: FileHandle?
    private let chunkSize = 64
    private let buffer: Data
    
    public init(filename: String, delimiter: String) {
        self.delimiter = delimiter.data(using: .utf8)!
        self.filename = filename
        self.fileHandle = FileHandle(forReadingAtPath: filename)
        self.buffer = Data(capacity: chunkSize)
    }
    
    /// Read a line from the file
    ///
    /// - Parameter: None
    func readLine() -> String? {
        return nil
    }
}
