
import UIKit
import Foundation


class SeedViewController: UIViewController{
    override func viewDidLoad() {
        
    }
    
    @IBAction func closePage(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func goToGetSeedPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "seedPage2") as! SeedViewController2
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

class SeedViewController2: UIViewController,UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @IBAction func closePage(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnDown(_ sender: UIButton) {
       sender.setBackgroundImage(UIImage(named: "綠鈕 下壓"), for: .normal)
    }
       
    @IBAction func btnOutside(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
    }

    
    @IBAction func goToHomePage(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("useSeed", forKey: "nowState")

        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var 小知識Btn: UIButton!
    
    @IBOutlet weak var 報你知Btn: UIButton!
    
    @IBOutlet weak var 小廚房Btn: UIButton!
    @IBAction func goToNextPage(_ sender: UIButton) {
        
        switch sender {
        case 小知識Btn:
            print("小")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "seedPage3") as! SeedViewController3
            vc.whichImage = "農作物的小知識"
            self.navigationController?.pushViewController(vc, animated: true)
            break;
        case 報你知Btn:
            print("報")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "seedPage3") as! SeedViewController3
            vc.whichImage = "營養價值報你知"
            self.navigationController?.pushViewController(vc, animated: true)
            break;
        case 小廚房Btn:
            print("房")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "seedPage3") as! SeedViewController3
            vc.whichImage = "美食料理小廚房"
            self.navigationController?.pushViewController(vc, animated: true)
            break;
        default:
            break;
        }
        
    }
    
    
    
}


class SeedViewController3: UIViewController{

    var whichImage:String!
    
    @IBOutlet weak var showImageView: UIImageView!
    
    
    override func viewDidLoad() {
        showImageView.image = UIImage(named: whichImage)
    }
    
    @IBAction func popController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
