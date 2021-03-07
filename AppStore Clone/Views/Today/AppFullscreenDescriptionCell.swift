//
//  AppFullscreenDescriptionCell.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 08.03.2021.
//

import UIKit

class AppFullscreenDescriptionCell: UITableViewCell {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fermentum dui faucibus in ornare quam viverra orci. Elementum tempus egestas sed sed. Nisi quis eleifend quam adipiscing vitae proin sagittis nisl. In pellentesque massa placerat duis ultricies. Faucibus ornare suspendisse sed nisi lacus sed. Adipiscing commodo elit at imperdiet dui accumsan sit. Et leo duis ut diam quam nulla porttitor massa. Vitae proin sagittis nisl rhoncus mattis rhoncus. Est lorem ipsum dolor sit amet. In nulla posuere sollicitudin aliquam ultrices sagittis orci. Felis bibendum ut tristique et egestas quis. Vel pharetra vel turpis nunc eget. Vel turpis nunc eget lorem dolor sed viverra. Et netus et malesuada fames ac turpis egestas maecenas pharetra. Massa enim nec dui nunc mattis enim ut tellus. Lorem ipsum dolor sit amet consectetur adipiscing elit. Integer enim neque volutpat ac. Tortor condimentum lacinia quis vel eros donec. Neque aliquam vestibulum morbi blandit cursus.Vitae ultricies leo integer malesuada nunc vel. Condimentum id venenatis a condimentum vitae sapien pellentesque habitant. Sed blandit libero volutpat sed cras ornare arcu. In cursus turpis massa tincidunt dui ut ornare. Gravida neque convallis a cras semper auctor neque vitae. Ut consequat semper viverra nam. Egestas sed tempus urna et pharetra pharetra. Praesent semper feugiat nibh sed pulvinar proin gravida hendrerit lectus. Lorem mollis aliquam ut porttitor leo a. Semper viverra nam libero justo laoreet sit amet cursus. Enim neque volutpat ac tincidunt vitae semper. A scelerisque purus semper eget duis at. Quis hendrerit dolor magna eget est lorem. Morbi tincidunt augue interdum velit. Adipiscing elit ut aliquam purus. Tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat. Eget felis eget nunc lobortis mattis aliquam faucibus purus. Ultrices tincidunt arcu non sodales neque sodales ut. Erat imperdiet sed euismod nisi porta lorem. Sit amet consectetur adipiscing elit pellentesque habitant morbi tristique."
        
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(padding: .init(top: 0, left: 24, bottom: 0, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
