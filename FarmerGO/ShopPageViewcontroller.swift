
import Foundation
import UIKit
import Foundation

class ShopViewController: UIViewController{
    
    @IBOutlet weak var 購買彈窗BackgroundView: UIView!
    
    @IBOutlet weak var 購買名稱Label: UILabel!
    
    @IBOutlet weak var 金額Label: UILabel!
    
    @IBOutlet weak var 購買Btn: UIButton!
    
    @IBOutlet weak var 鋤頭Btn: UIButton!
    
    @IBOutlet weak var 澆水器Btn: UIButton!
    
    @IBOutlet weak var 肥料Btn: UIButton!
    
    @IBOutlet weak var 關閉購買Btn: UIButton!
    
    
    @IBOutlet weak var 關閉ShopBtn: UIButton!
    
    
    @IBOutlet weak var 商品ImageView: UIImageView!
    
    
    @IBOutlet weak var 鋤頭已購買: UILabel!
    
    @IBOutlet weak var 澆水器已購買: UILabel!
    
    @IBOutlet weak var 肥料已購買: UILabel!
    
    
    
    override func viewDidLoad() {
        鋤頭已購買.layer.cornerRadius = 4
        澆水器已購買.layer.cornerRadius = 4
        肥料已購買.layer.cornerRadius = 4
        鋤頭已購買.clipsToBounds = true
        澆水器已購買.clipsToBounds = true
        肥料已購買.clipsToBounds = true
        
        
        if let 鋤頭狀態 = userDefaults.value(forKey: "鋤頭-小") as? String{
            if(鋤頭狀態 == "0"){
                鋤頭已購買.isHidden = true
            }else{
                鋤頭已購買.isHidden = false
            }
        }else{
            userDefaults.set("0", forKey: "鋤頭-小")
        }
        
        if let 澆水器狀態 = userDefaults.value(forKey: "澆水器-小") as? String{
            if(澆水器狀態 == "0"){
                澆水器已購買.isHidden = true
            }else{
                澆水器已購買.isHidden = false
            }
        }else{
            userDefaults.set("0", forKey: "澆水器-小")
        }
        
        if let 肥料狀態 = userDefaults.value(forKey: "肥料-小") as? String{
            if(肥料狀態 == "0"){
                肥料已購買.isHidden = true
            }else{
                肥料已購買.isHidden = false
            }
        }else{
            userDefaults.set("0", forKey: "肥料-小")
        }
    }
    
    
    @IBAction func btnDown(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "棕鈕 下壓"), for: .normal)
    }
          
    @IBAction func btnOutside(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "棕鈕"), for: .normal)
    }
    
    let userDefaults:UserDefaults = UserDefaults.standard
    
    
    
    
    
    
//show購買PopIn()
    @IBAction func btnInside(_ sender: UIButton) {
        switch sender {
        case 鋤頭Btn:
            show購買PopIn(name: "鋤頭", 金額: "500")
            break;
        case 澆水器Btn:
            show購買PopIn(name: "澆水器", 金額: "150")
            break;
        case 肥料Btn:
            show購買PopIn(name: "肥料", 金額: "350")
            break;
        case 購買Btn:
            sender.setBackgroundImage(UIImage(named: "棕鈕"), for: .normal)
            var dollar = userDefaults.value(forKey: "dollar") as! String
            dollar = String(Int(dollar)! - Int(金額Label.text!)!)
            
            switch  購買名稱Label.text{
            case "鋤頭-小":
                鋤頭已購買.isHidden = false
                userDefaults.set("1", forKey: "鋤頭-小")
                break;
            case "澆水器-小":
                澆水器已購買.isHidden = false
                userDefaults.set("1", forKey: "澆水器-小")
            break;
            case "肥料-小":
                肥料已購買.isHidden = false
                userDefaults.set("1", forKey: "肥料-小")
                break;
            default:
                break;
            }
            
            userDefaults.set(dollar, forKey: "dollar")
            
            
            UIView.animate(
                withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
                options: .curveEaseOut, animations: {
                    self.購買彈窗BackgroundView.alpha = 0
                    self.購買彈窗BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }, completion:nil)
            
            
            
            break;
        case 關閉ShopBtn:
            self.dismiss(animated: true, completion: nil)
            break;
        case 關閉購買Btn:
            UIView.animate(
                withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
                options: .curveEaseOut, animations: {
                    self.購買彈窗BackgroundView.alpha = 0
                    self.購買彈窗BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }, completion: {result -> Void in
                self.購買彈窗BackgroundView.isHidden = true;
            })
            break;
        default:
            break;
        }
    }
          

    func show購買PopIn(name:String,金額:String){
        
        switch name {
        case "鋤頭":
            商品ImageView.image = UIImage(named: "商店 鋤頭")
            購買名稱Label.text = "鋤頭-小"
            金額Label.text = 金額
            break;
        case "澆水器":
            商品ImageView.image = UIImage(named: "商店 澆水器")
            購買名稱Label.text = "澆水器-小"
            金額Label.text = 金額
            break;
        case "肥料":
            商品ImageView.image = UIImage(named: "商店  肥料")
            購買名稱Label.text = "肥料-小"
            金額Label.text = 金額
            break;
        default:
            break;
        }
        
        購買彈窗BackgroundView.isHidden = false;
        // make the square not visible and scale it to 0.5x
        購買彈窗BackgroundView.alpha = 0
        購買彈窗BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        // Finally the animation!
        UIView.animate(
            withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.購買彈窗BackgroundView.transform = .identity
                self.購買彈窗BackgroundView.alpha = 1
        }, completion: nil)
    }
    
    
    
}
