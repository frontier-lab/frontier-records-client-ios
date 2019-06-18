//
//  LaunchScreen.swift
//  FrontierRecords
//
//  Created by NHNEnt on 18/06/2019.
//  Copyright © 2019 frontier. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var bottomProgressLabel: UILabel!
    
    var initWorkerQueue: DispatchQueue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initWorkerQueue = DispatchQueue.init(label: "init-worker")
        self.updateLabel(text: "Starting Initializing...")
        initWorkerQueue?.async {
            self.initWork()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initWorkerQueue?.async {
            print("load main view")
            DispatchQueue.main.async {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let mainViewController = storyBoard.instantiateViewController(withIdentifier: "main")
                self.present(mainViewController, animated: true, completion: {})
            }
        }
    }
    
    private func initWork() {
        self.initApp()
        self.initUser()
        self.initAppData()
        self.initFinishing()
    }
    
    private func initApp() {
        let text = "Starting Initializing "
        print(text)
        self.updateLabel(text: text)
        self.printPercent(text: text, delay: 0.02)
        
    }
    private func initUser() {
        let text = "Get UserInfo "
        print(text)
        self.updateLabel(text: text)
        self.printPercent(text: text, delay: 0.01)
        
    }
    private func initAppData() {
        let text = "Preparing App Data "
        print(text)
        self.updateLabel(text: text)
        self.printPercent(text: text, delay: 0.01)
        
    }
    private func initFinishing() {
        let text = "Finising Initializing..."
        print(text)
        self.updateLabel(text: text)
        Thread.sleep(forTimeInterval: 1)
        
    }
    
    private func updateLabel(text: String) {
        DispatchQueue.main.async {
            self.bottomProgressLabel.text = text
        }
    }
    private func printPercent(text: String, delay: Double) {
        
        for i in 0...100 {
            self.updateLabel(text: text + "(\(i)%) ...")
            Thread.sleep(forTimeInterval: delay)
        }
    }
}
