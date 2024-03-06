//
//  LoanViewController.swift
//  NavigationDrawer
//
//  Created by Raghavendra Daramwar on 09/03/22.
//

import UIKit

class LoanViewController: BaseViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationController?.navigationBar.isHidden = true
//        addSlideMenuButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
 //       addSlideMenuButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
   //     addSlideMenuButton()
    }

    @IBAction func brnMenuIconClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
