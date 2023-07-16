// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct Logger {
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    public static func info(
        _ messages: Any?...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        printMessage(
            messages,
            state: "🔵 INFO",
            file: file,
            function: function,
            line: line
        )
    }
    
    public static func error(
        _ messages: Any?...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        printMessage(
            messages,
            state: "🔴 ERROR",
            file: file,
            function: function,
            line: line
        )
    }
    
    public static func warning(
        _ messages: Any?...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        printMessage(
            messages,
            state: "🟡 WARNING",
            file: file,
            function: function,
            line: line
        )
    }
    
    public static func debug(
        _ messages: Any?...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        printMessage(
            messages,
            state: "🟢 DEBUG",
            file: file,
            function: function,
            line: line
        )
    }
    
    private static func printMessage(
        _ messages: Any?...,
        state: String,
        file: String,
        function: String,
        line: Int
    ) {
        #if DEBUG
        let dateString = dateFormatter.string(from: Date())
        let items = messages.compactMap { item in
            if item != nil {
                return item
            }
            else {
                return nil
            }
        }
        print("\(dateString) - \(state) \(sourceFileName(file)).\(function):\(line)", items)
        #endif
    }
    
    private static func sourceFileName(
        _ filePath: String
    ) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : (components.last?.replacingOccurrences(of: ".swift", with: " >>> ") ?? "")
    }
}

