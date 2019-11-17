
import Foundation
import UIKit
import Foundation

class CouponViewController: UIViewController{
    
    var  state = "Hiiiiiiii";
    
    @IBOutlet weak var 優惠券ImageView: UIImageView!
    
    
    
    @IBAction func dismissToHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pushToCoupon2(_ sender: Any) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print(state)
        if(state == "已兌換"){
            優惠券ImageView.image = UIImage(named: "優惠券 已兌換-1")
        }
    }
    
}


class CouponViewController2:UIViewController {
    
    func show兌換PopIn(){
        確認兌換優惠BackgroundView.isHidden = false;
        // make the square not visible and scale it to 0.5x
        確認兌換優惠BackgroundView.alpha = 0
        確認兌換優惠BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        // Finally the animation!
        UIView.animate(
            withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.確認兌換優惠BackgroundView.transform = .identity
                self.確認兌換優惠BackgroundView.alpha = 1
                self.優惠倒數BackgroundView.isHidden = false
        }, completion: nil)
    }
    
    
    @IBAction func popToCoupon(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        if(seconds < 120){
            let a = self.navigationController!.viewControllers[0] as! CouponViewController
            a.state = "已兌換"
            self.navigationController?.popToViewController(a, animated: true)
//            self.navigationController!.popToRootViewController(animated: true)
        }
    }
    
    
    @IBOutlet weak var 兌換優惠按鈕: UIButton!
    
    @IBOutlet weak var 確認兌換優惠BackgroundView: UIView!
    @IBOutlet weak var 優惠倒數BackgroundView: UIView!
    @IBOutlet weak var 倒數Label: UILabel!
    
    
    @IBAction func btnDown(_ sender: UIButton) {
        兌換優惠按鈕.setBackgroundImage(UIImage(named: "橘鈕 下壓"), for: .normal)
    }
    
    @IBAction func btnUpOutside(_ sender: UIButton) {
        兌換優惠按鈕.setBackgroundImage(UIImage(named: "橘鈕"), for: .normal)
    }
    
    @IBAction func btnUp(_ sender: UIButton) {
        兌換優惠按鈕.setBackgroundImage(UIImage(named: "橘鈕"), for: .normal)
        show兌換PopIn();
    }
    
    
    @IBAction func 不兌換(_ sender: Any) {
        UIView.animate(
            withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.確認兌換優惠BackgroundView.alpha = 0
                self.確認兌換優惠BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: {result -> Void in
            self.優惠倒數BackgroundView.isHidden = true
        })
    }
    var seconds = 120 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one
    
    
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if(seconds > 0){
            seconds -= 1
            let minute = String(format: "%02d", seconds / 60)
            let second = String(format: "%02d", seconds % 60)
            倒數Label.text = "優惠倒數 \(minute):\(second)"
        }else{
            timer.invalidate();
        }
    }
    
    
    @IBAction func 兌換(_ sender: Any) {
        UIView.animate(
            withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.確認兌換優惠BackgroundView.alpha = 0
                self.確認兌換優惠BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.runTimer();
        }, completion: nil)
    }
    
    
    
    
}
