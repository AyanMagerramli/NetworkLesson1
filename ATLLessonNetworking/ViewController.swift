//
//  ViewController.swift
//  ATLLessonNetworking
//
//  Created by Ayan on 24.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = HomeViewModel(networkManager: NetworkManager.shared)
   

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.getPosts {
            DispatchQueue.main.async {[weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewModel.items?[indexPath.row].title
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.show(controller, sender: nil)
    }
}
