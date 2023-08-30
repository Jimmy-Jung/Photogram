//
//  ClassOpenExample.swift
//  SeSACFramework
//
//  Created by 정준영 on 2023/08/29.
//

import Foundation



open class ClassOpenExample {
    public init() {}
    private static func privateExample() {
        print(#function)
    }
    
    fileprivate static func fileprivateExample() {
        print(#function)
    }
    
    internal static func internalExample() {
        print(#function)
    }
    
    public static func publicExample() {
        print(#function)
    }
    
    internal func internalfunc() {
        print(#function)
    }
    
    public func publicfunc() {
        print(#function)
    }
    
    private func privatefunc() {
        print(#function)
    }
    
}

public class ClassPublicExample {
    private static func privateExample() {
        print(#function)
    }
    
    fileprivate static func fileprivateExample() {
        print(#function)
    }
    
    internal static func internalExample() {
        print(#function)
    }
    
    public static func publicExample() {
        print(#function)
    }
    
}

class ClassInternalExample {
    private static func privateExample() {
        print(#function)
    }
    
    fileprivate static func fileprivateExample() {
        print(#function)
    }
    
    internal static func internalExample() {
        print(#function)
    }
    
    public static func publicExample() {
        print(#function)
    }
    
}
