//
//  MainDashBoardViewController.swift
//  NavigationDrawer
//
//  Created by Raghavendra Daramwar on 09/03/22.
//

import UIKit


class MainDashBoardViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //addSlideMenuButton()
        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }


    @IBAction func brnMenuIconClicked(_ sender: Any) {
        onSlideMenuButtonPressed(sender as! UIButton)
    }
}
