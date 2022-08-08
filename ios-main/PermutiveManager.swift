//
//  PermutiveManager.swift
//  ios-main
//
//  Created by Marco on 4/8/2022.
//  Copyright © 2022 Marco. All rights reserved.
//

import Foundation
import Permutive_iOS
import ReactiveSwift

class PermutiveManager {
    private static let apiKey = ""
    private static let organisationId = ""
    private static let workspaceId = ""
    static let shared = PermutiveManager()
    static var isReady = MutableProperty<Bool>(false)
    var pageTracker: PageTrackerProtocol?
    
    static func startSDK() {
        guard let options = Options(
            apiKey: PermutiveManager.apiKey,
            organisationId: PermutiveManager.organisationId,
            workspaceId: PermutiveManager.workspaceId
        ) else {
            return
        }
        options.logModes = LogMode.all

        print("Permutive going to start.")

        Permutive.shared.start(with: options) { error in
            guard error == nil else {
                print("Permutive error=\(String(describing: error))")
                return
            }
            print("Permutive SDK ready.")
            PermutiveManager.isReady.value = true
            PermutiveManager.testTracker()
        }
    }
    
    static func testTracker() {
        do {
            let url = URL(string: "https://9gag.com/hot")!
            let properties = try? EventProperties([:])
            let pageContext = Context(
                title: "Home",
                url: url,
                referrer: nil
            )
            let pageTracker = try? Permutive.shared.createPageTracker(properties: properties, context: pageContext)
            print("createPageTracker=\(String(describing: pageTracker)) when isReady=\(PermutiveManager.isReady.value)")
            guard let tracker = pageTracker else {
                return
            }
            try? tracker.resume()
            try tracker.track(event: "LinkClick", properties: try? EventProperties(["name": "value"]))
        } catch (let error){
            print("error=\(error)")
        }
    }
}
