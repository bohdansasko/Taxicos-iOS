//
//  CHLogger.swift
//  exmo-ios-client
//
//  Created by Office Mac on 9/3/19.
//  Copyright © 2019 Bogdan Sasko. All rights reserved.
//

import Foundation

struct log {
    
    private init() {}
    
    private static func log(level: Level, _ items: [Any], pathToFile: String, line: Int) {
        #if DEBUG
            let fileName = (pathToFile as NSString).lastPathComponent
            let argsAsStr = items.map { String(describing: $0) }.joined(separator: " ")
            let threadAsStr = Thread.current.isMainThread ? "thread: <main>" : "thread: <background>"
            print(level.icon, Date().now, threadAsStr, line, fileName, argsAsStr)
        #endif
    }

}

// MARK: - Log level

private extension log {
    
    enum Level {
        case debug
        case info
        case error
        case network
        
        var icon: String {
            switch self {
            case .debug  : return "👁"
            case .info   : return "ℹ️"
            case .error  : return "🤬"
            case .network: return "📡"
            }
        }
    }
    
}

extension log {
    
    static func debug(_ message: Any..., pathToFile: String = #file, line: Int = #line) {
        log(level: .debug, message, pathToFile: pathToFile, line: line)
    }
    
    static func info(_ message: Any..., pathToFile: String = #file, line: Int = #line) {
        log(level: .info, message, pathToFile: pathToFile, line: line)
    }
    
    static func error(_ message: Any..., pathToFile: String = #file, line: Int = #line) {
        log(level: .error, message, pathToFile: pathToFile, line: line)
    }
    
    static func network(_ message: Any..., pathToFile: String = #file, line: Int = #line) {
        log(level: .network, message, pathToFile: pathToFile, line: line)
    }
    
}
