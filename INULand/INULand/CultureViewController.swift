import UIKit
import BetterSegmentedControl

class CultureViewController: UIViewController {
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var segmentedControlView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var indexOfSegment: UInt = 1
    
    // MARK: - Examples
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topImage.image = UIImage(named: "group")
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        // Control 5: Adding custom subview to Indicator
        let indicatorControl = BetterSegmentedControl(
            frame: CGRect(x: 0.0, y: 72.0, width: view.bounds.width, height: 57.0),
            titles: ["방 개수", "DVD목록"],
            index: 0, options: [.backgroundColor(.white),
                                .titleColor(.lightGray),
                                .indicatorViewBorderColor(.lightGray),
                                .selectedTitleColor(UIColor(red:84/255, green:124/255, blue:227/255, alpha:1.00)),
                                .bouncesOnChange(false),
                                .panningDisabled(false)])
        indicatorControl.autoresizingMask = [.flexibleWidth]
        let customSubview = UIView(frame: CGRect(x: 0, y: 45, width: 207, height: 4.0))
        customSubview.backgroundColor = UIColor(red:84/255, green:124/255, blue:227/255, alpha:1.00)
        customSubview.layer.cornerRadius = 2.0
        customSubview.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
        indicatorControl.addTarget(self, action: #selector(CultureViewController.whenSegmentChanged(_:)), for: .valueChanged)
        indicatorControl.addSubviewToIndicator(customSubview)
        view.addSubview(indicatorControl)
    }
    
    @objc func whenSegmentChanged(_ sender: BetterSegmentedControl) {
        for view in self.segmentedControlView.subviews {
            if view.tag == 10 {
                view.removeFromSuperview()
            }
        }
        if sender.index == 0{
            collectionView.selectItem(at: [Int(sender.index), 0], animated: true, scrollPosition: .centeredHorizontally)
        }
        else{
            collectionView.selectItem(at: [Int(sender.index), 0], animated: true, scrollPosition: .centeredHorizontally)
        }
    }
    // MARK: - Action handlers
    /* @objc func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl) {
     if sender.index == 0 {
     print("Turning lights on.")
     view.backgroundColor = .white
     }
     else {
     print("Turning lights off.")
     view.backgroundColor = .darkGray
     }
     }
     */
    /*@IBAction func segmentedControl1ValueChanged(_ sender: BetterSegmentedControl) {
     print("The selected index is \(sender.index) and the title is \(sender.titles[Int(sender.index)])")
     }*/
    
}
/*
 }
 
 }
 
 
 
 extension CultureViewController {
 func initSegmentControl(index: UInt) {
 let indicatorControl = BetterSegmentedControl(
 frame: CGRect(x: 0.0, y: 72.0, width: view.bounds.width, height: 57.0),
 titles: ["방 개수", "DVD목록"],
 index: 0, options: [.backgroundColor(.white),
 .titleColor(.lightGray),
 .indicatorViewBorderColor(.lightGray),
 .selectedTitleColor(UIColor(red:84/255, green:124/255, blue:227/255, alpha:1.00)),
 .bouncesOnChange(false),
 .panningDisabled(false)])
 indicatorControl.autoresizingMask = [.flexibleWidth]
 let customSubview = UIView(frame: CGRect(x: 0, y: 45, width: 207, height: 4.0))
 customSubview.backgroundColor = UIColor(red:84/255, green:124/255, blue:227/255, alpha:1.00)
 customSubview.layer.cornerRadius = 2.0
 customSubview.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
 indicatorControl.addTarget(self, action: #selector(CultureViewController.whenSegmentChanged(_:)), for: .valueChanged)
 indicatorControl.tag = 10
 indicatorControl.addSubviewToIndicator(customSubview)
 view.addSubview(indicatorControl)
 }
 @objc func whenSegmentChanged(_ sender: BetterSegmentedControl) {
 for view in self.segmentedControlView.subviews {
 if view.tag == 10 {
 view.removeFromSuperview()
 }
 }
 indexOfSegment = sender.index
 initSegmentControl(index: sender.index)
 collectionView.selectItem(at: [Int(sender.index), 0], animated: true, scrollPosition: .centeredHorizontally)
 }
 
 
 }
 */
extension CultureViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 10
            
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 1{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CultureCollectionViewCell", for: indexPath) as! CultureCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Culture2CollectionViewCell", for: indexPath) as! Culture2CollectionViewCell
            cell.backgroundColor = UIColor.white
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    
}
