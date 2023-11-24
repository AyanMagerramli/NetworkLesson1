//
//  ViewController.swift
//  ATLLessonNetworking
//
//  Created by Ayan on 24.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [Post]()
    let baseURL = "https://jsonplaceholder.typicode.com"

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getPostItems()
    }
    
    func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getPostItems () {
        guard let url = URL(string: "\(baseURL)/posts") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    self.items = try JSONDecoder().decode([Post].self, from: data!)
                    print(self.items)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.show(controller, sender: nil)
    }
}
