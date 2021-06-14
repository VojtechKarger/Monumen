//
//  MonumentaAppApp.swift
//  MonumentaApp
//
//  Created by vojta on 14.06.2021.
//

import SwiftUI

@main
struct MonumentaAppApp: App {
    @StateObject var vm = ChatBotModel()
   
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
                .environmentObject(vm)
        }
    }
}
