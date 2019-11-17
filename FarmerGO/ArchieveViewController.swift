
import Foundation
import UIKit

class ArchieveViewController: UIViewController{
    
    @IBOutlet weak var 完成成就BackgroundView: UIView!
    
    @IBOutlet weak var 確定Btn: UIButton!
    
    
    let userDefaults = UserDefaults.standard
    
    @IBAction func closeController(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func openPopIn(_ sender: Any) {
        print("對起")
        
        self.完成成就BackgroundView.isHidden = false
        UIView.animate(
            withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.完成成就BackgroundView.transform = .identity
                self.完成成就BackgroundView.alpha = 1
        }, completion: nil)
    }
    
    @IBAction func btnUp(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
        
        
        完成成就BackgroundView.alpha = 0
        完成成就BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(
            withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.完成成就BackgroundView.alpha = 0
                self.完成成就BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.完成成就BackgroundView.isHidden = true;
        }, completion: nil)
        
        
        var dollar = userDefaults.value(forKey: "dollar") as? String
        dollar = String(Int(dollar!)!+500);
        userDefaults.set(dollar, forKey: "dollar")
        
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func quit(_ sender: Any) {
        UIView.animate(
            withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.完成成就BackgroundView.alpha = 0
                self.完成成就BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.完成成就BackgroundView.isHidden = true;
        }, completion: nil)
    }
    
    
    
    @IBAction func btnDown(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "綠鈕 下壓"), for: .normal)
    }
    
    
    @IBAction func btnUpOutside(_ sender: UIButton) {
        
        
        sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
    }
    
    
    
}
