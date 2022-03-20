import UIKit
import Lottie
class RocketViewController: UIViewController {
    let queue = DispatchQueue(label: "thread-safe-obj")
    var rocket = [RocketModelElement]()
    
    var launch = [LaunchModelElement]()
    var launchFirst = [LaunchModelElement]()
    var launchSecond = [LaunchModelElement]()
    var launchThree = [LaunchModelElement]()

    var collectionView: UICollectionView!
    var pageControl = UIPageControl()
    let layout = PagingCollectionViewLayout()
    var slideAnimView = AnimationView()
    var currentNameRocket = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        navigationController?.setNavigationBarHidden(true, animated: true)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: Notification.Name("reloadData"), object: nil)
        
    }
    override func loadView() {
        super.loadView()
            self.fetchLaunch()
            self.fetchRocket()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func viewWillLayoutSubviews() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        //        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-110)
        super.viewWillLayoutSubviews()
    }
    
    private func fetchRocket() {
        
        
        let urlString = "https://api.spacexdata.com/v4/rockets"
        NetworkDataFetch.shared.rocketFetch(urlString: urlString) { [self] rocketModel, error in
            if error == nil {
                
                guard let rocketModel = rocketModel else { return }
                
                self.rocket = rocketModel
                self.setupCollectionView()
                self.setupPageControl()
            } else {
                print(error!.localizedDescription)
            }
        }
        
    }
    private func fetchLaunch() {
        let urlString = "https://api.spacexdata.com/v4/launches"
        NetworkDataFetch.shared.launchFetch(urlString: urlString) { launchModel, error in
            if error == nil {
                guard let launchModel = launchModel else { return }
                self.launch = launchModel
                self.launchFirst = self.launch.filter({$0.rocket.rawValue == "5e9d0d95eda69955f709d1eb"}).sorted(){$0.staticFireDateUnix ?? 0 > $1.staticFireDateUnix ?? 0}
                self.launchSecond = self.launch.filter({$0.rocket.rawValue == "5e9d0d95eda69973a809d1ec"}).sorted(){$0.staticFireDateUnix ?? 0 > $1.staticFireDateUnix ?? 0}
                self.launchThree = self.launch.filter({$0.rocket.rawValue == "5e9d0d95eda69974db09d1ed"}).sorted(){$0.staticFireDateUnix ?? 0 > $1.staticFireDateUnix ?? 0}
            } else {
                print(error!.localizedDescription)
            }
        }
    
    }
    
    private func setupCollectionView() {
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-110)
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.clipsToBounds = false
        collectionView.dataSource = self
        collectionView.backgroundColor = ThemeColors.mainBlack
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        collectionView.register(RocketCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        let constraints = [
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height-72)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupPageControl() {
        
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPage = 0
        pageControl.numberOfPages = rocket.count
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = ThemeColors.simpleGray
        pageControl.isUserInteractionEnabled = false
        pageControl.backgroundColor = ThemeColors.secondaryBlack
        pageControl.addTarget(self , action: #selector(pageControlDidChange(_:)),
                              for: .valueChanged)
        let constraints = [
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 72),
            pageControl.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    @objc private func pageControlDidChange(_ sender : UIPageControl) {
        
    } // Если нужно будет делать переход по нажатию, что необязательно
    
    @objc func reloadData() {
        collectionView.reloadData()
    }
    
}
