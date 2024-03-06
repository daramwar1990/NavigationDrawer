//
//  BaseViewController.swift
//  NavigationDrawer
//
//  Created by Raghavendra Daramwar on 09/03/22.
//

import UIKit

class BaseViewController: UIViewController,SlideMenuDelegate {
    
    
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        let topViewController : UIViewController = self.navigationController!.topViewController!
       
        
        switch(index){
            
            
        case 0:

            self.openViewControllerBasedOnIdentifier(MainDashBoardViewController(), nibName: "MainDashBoardViewController")
            
            break
        case 1:

            
            self.openViewControllerBasedOnIdentifier(LoanViewController(), nibName: "LoanViewController")
            
            break
        default:
            print("default\n", terminator: "")
        }

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    func openViewControllerBasedOnIdentifier(_ vcName:UIViewController, nibName : String){
        let destViewController : UIViewController = type(of: vcName).init(nibName: nibName, bundle: nil)
        
        let topViewController : UIViewController = self.navigationController!.topViewController!
        
        
        
//        for vc in self.navigationController!.viewControllers {
//            if vc is MainDashBoardViewController  {
//                self.navigationController?.popToViewController(vc, animated: true)
//               // self.navigationController?.popViewController(animated: true)
//            }
//           else if  vc is LoanViewController {
//                self.navigationController?.popToViewController(vc, animated: true)
//               // self.navigationController?.popViewController(animated: true)
//            }
//        }
        
        if (topViewController.nibName == destViewController.nibName){
            print("same vc")
            for vc in self.navigationController!.viewControllers{
                if vc.nibName == topViewController.nibName{
                    self.navigationController?.popToViewController(vc, animated: true)
                }
                else {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
                
            }
            
           // self.navigationController?.popToViewController(destViewController, animated: true)
           // self.navigationController?.popViewController(animated: true)
        }
        
         else {
             for vc in self.navigationController!.viewControllers{
                 if vc.nibName == topViewController.nibName{
                     self.navigationController?.popToViewController(vc, animated: true)
                 }
                 else {
                     self.navigationController?.pushViewController(vc, animated: true)
                 }
                 
                 
             }
             
             
            // self.navigationController!.pushViewController(destViewController, animated: true)
         }

         
    }
    
    

    /*
     func addSlideMenuButton(){
         let btnShowMenu = UIButton(type: UIButton.ButtonType.system)
         btnShowMenu.setImage(self.defaultMenuImage(), for: UIControl.State())
         btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
       //  btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControl.Event.touchUpInside)
         let customBarItem = UIBarButtonItem(customView: btnShowMenu)
         self.navigationItem.leftBarButtonItem = customBarItem;
     }
     
     func defaultMenuImage() -> UIImage {
         var defaultMenuImage = UIImage()
         
         UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)
         
         UIColor.black.setFill()
         UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
         UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
         UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
         
         UIColor.white.setFill()
         UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
         UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
         UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
         
         defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
         
         UIGraphicsEndImageContext()
        
         return defaultMenuImage;
     }
     @objc func onSlideMenuButtonPressed(_ sender : UIButton){
         if (sender.tag == 10)
         {
             // To Hide Menu If it already there
             self.slideMenuItemSelectedAtIndex(-1);
             
             sender.tag = 0;
             
             let viewMenuBack : UIView = view.subviews.last!
             
             UIView.animate(withDuration: 0.3, animations: { () -> Void in
                 var frameMenu : CGRect = viewMenuBack.frame
                 frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                 viewMenuBack.frame = frameMenu
                 viewMenuBack.layoutIfNeeded()
                 viewMenuBack.backgroundColor = UIColor.clear
                 }, completion: { (finished) -> Void in
                     viewMenuBack.removeFromSuperview()
             })
             
             return
         }
         
         sender.isEnabled = false
         sender.tag = 10
         
        // let menuVC : SideMenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
         let menuVC : SideMenuViewController = SideMenuViewController.init(nibName: "SideMenuViewController", bundle: nil)
         
         menuVC.btnMenu = sender
         menuVC.delegate = self
         self.view.addSubview(menuVC.view)
         self.addChild(menuVC)
         menuVC.view.layoutIfNeeded()
         
         
         menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
         
         UIView.animate(withDuration: 0.3, animations: { () -> Void in
             menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
             sender.isEnabled = true
             }, completion:nil)
     }
     */
    
     func onSlideMenuButtonPressed(_ sender : UIButton){
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
                }, completion: { (finished) -> Void in
                    viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
       // let menuVC : SideMenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        let menuVC : SideMenuViewController = SideMenuViewController.init(nibName: "SideMenuViewController", bundle: nil)
        
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
            }, completion:nil)
    }
}

extension Bundle {

    func loadNibNamed(named: String, owner: AnyObject!, identifier: String) -> UIView? {
        return loadNibNamed(named, owner: owner, options: nil)?.filter({ ($0 as AnyObject).restorationIdentifier == identifier }).first as? UIView
    }
}
