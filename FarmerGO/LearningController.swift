

//1 S   8張
//

import Foundation
import UIKit

class LearningViewController:UIViewController{
    
    let userDefaults = UserDefaults.standard;
    
    @IBOutlet weak var 收成Btn: UIButton!
    
    @IBOutlet weak var 到優惠券Btn: UIButton!
    
    var delegate: ModalDelegate? 
    
    @IBAction func btnDown(_ sender: UIButton) {
        
        收成Btn.setBackgroundImage(UIImage(named: "綠鈕 下壓"), for: .normal)
    }
    
    @IBAction func btnUp(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
        switch sender {
        case 收成Btn:
             種出優惠券彈窗();
            break;
        case 到優惠券Btn:
            userDefaults.set("到優惠券", forKey: "nowState")
            self.dismiss(animated: true, completion: nil)
            if let delegate = self.delegate {
                delegate.changeValue(value: "到ＧＯＯＯＯＯＯＯＯ")
            }
            break;
        default:
            break;
        }
        
       
        
        
    }
    
    
    
    @IBAction func btnUpOutside(_ sender: UIButton) {
        收成Btn.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
    }
    

    @IBOutlet weak var 種出優惠券BackgroundView: UIView!
    
    
    func 種出優惠券彈窗(){
        種出優惠券BackgroundView.isHidden = false;
        
        // make the square not visible and scale it to 0.5x
        種出優惠券BackgroundView.alpha = 0
        種出優惠券BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        // Finally the animation!
        UIView.animate(
            withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.種出優惠券BackgroundView.transform = .identity
                self.種出優惠券BackgroundView.alpha = 1
        }, completion: nil)
        
        
    }
    
    
    
    
    @IBAction func close查看優惠券(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


protocol ModalDelegate {
    func changeValue(value: String)
}
