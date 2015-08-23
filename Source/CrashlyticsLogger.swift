//
//  CrashlyticsLogger.swift
//
//  
//  
//

import CocoaLumberjack
import Crashlytics

class CrashlyticsLogger: DDAbstractLogger {
    static let sharedInstance = CrashlyticsLogger()
    
    override func logMessage(logMessage: DDLogMessage!) {
        CLS_LOG_SWIFT(logMessage.message)
    }
}

private func CLS_LOG_SWIFT( _ format: String = "", _ args:[CVarArgType] = [], file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
    let fileLastPathComponentNSString: NSString = NSString(string: NSString(string: file).lastPathComponent)
        CLSLogv("\(fileLastPathComponentNSString.stringByDeletingPathExtension).\(function) line \(line) $ \(format)", getVaList(args))
}
