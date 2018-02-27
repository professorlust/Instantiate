//
//  Storyboard.swift
//  Instantiate
//
//  Created by tarunon on 2016/12/04.
//  Copyright © 2016年 tarunon. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)
    import UIKit
    public typealias Storyboard = UIStoryboard
    public typealias StoryboardName = String
    public typealias StoryboardSceneIdentifier = String
    public typealias ViewController = UIViewController
#endif

#if os(macOS)
    import AppKit
    public typealias Storyboard = NSStoryboard
    public typealias StoryboardName = NSStoryboard.Name
    public typealias StoryboardSceneIdentifier = NSStoryboard.SceneIdentifier
    public typealias ViewController = NSViewController
#endif

public protocol StoryboardType where Self: NSObject {
    static var storyboard: Storyboard { get }
}

public enum InstantiateSource {
    case initial
    case identifier(StoryboardSceneIdentifier)
}

/// Supports to associate ViewController class and Storyboard.
/// Notes: If you implement this class, your ViewController class load view in `init(with:)`.
/// Notes: `inject` call after `viewDidLoad`.
public protocol StoryboardInstantiatable: Instantiatable, Injectable, StoryboardType where Self: ViewController {
    /// Source of Storyboard identifier, or specify initial view controller. Default is .initial
    static var instantiateSource: InstantiateSource { get }
}

public extension StoryboardInstantiatable where Self: NSObject {
    static var instantiateSource: InstantiateSource {
        return .initial
    }
}

