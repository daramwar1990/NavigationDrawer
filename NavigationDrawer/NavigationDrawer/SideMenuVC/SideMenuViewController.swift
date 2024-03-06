//
//  SideMenuViewController.swift
//  NavigationDrawer
//
//  Created by Raghavendra Daramwar on 09/03/22.
//

import UIKit
import Foundation

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class SideMenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    

    @IBOutlet weak var sideMenuTableVIew: UITableView!
    
    var array: [String] = []
    var delegate : SlideMenuDelegate?
    
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    var btnMenu : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateArrayMenuOptions()
        self.view.backgroundColor = .green
        sideMenuTableVIew.register(UINib(nibName: "SideOptionsTableViewCell", bundle: nil), forCellReuseIdentifier: "sideMenuCell")
        self.sideMenuTableVIew.dataSource = self
        self.sideMenuTableVIew.delegate = self
    }

    func updateArrayMenuOptions(){
        array.append("HomeIcon")
        array.append("PlayIcon")
        
        sideMenuTableVIew.reloadData()
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { _ in
                self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideMenuTableVIew.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath) as? SideOptionsTableViewCell
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        cell!.lblVCName.text = self.array[indexPath.row]
       // cell.textLabel?.text = self.array[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.tag = indexPath.row
        self.onCloseMenuClick(btn)
    }
    
    
}//EOC
