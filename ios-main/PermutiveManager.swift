//
//  PermutiveManager.swift
//  ios-main
//
//  Created by Marco on 4/8/2022.
//  Copyright © 2022 Marco. All rights reserved.
//

import Foundation
import Permutive_iOS

class PermutiveManager {
    private static let apiKey = "10a245c4-a2f8-4502-8824-8d767a630613"
    private static let organisationId = "8230918b-a7dd-44fb-a85a-7ff990c4d151"
    private static let workspaceId = "8230918b-a7dd-44fb-a85a-7ff990c4d151"
    static let shared = PermutiveManager()
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
            PermutiveManager.testTracker()
        }
    }
    
    static func testTracker() {
        do {
            let url = URL(string: "https://9jokes.com")!
            let properties = try? EventProperties([:])
            let pageContext = Context(
                title: "Home",
                url: url,
                referrer: nil
            )
            let pageTracker = try? Permutive.shared.createPageTracker(properties: properties, context: pageContext)
            print("createPageTracker=\(String(describing: pageTracker))")
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
