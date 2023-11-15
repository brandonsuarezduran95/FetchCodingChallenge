//
//  NoConnectionView.swift
//  FetchCodingChallenge
//
//  Created by Brandon Suarez on 11/15/23.
//

import SwiftUI

fileprivate enum Constants {
    static let noConnectionMessage: String = "No Internet Connection"
    static let secondaryMessage: String = "Please connect to Wifi or Cellular Data"
    static let imageName: String = "wifi.slash"
}

struct NoConnectionView: View {
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: Constants.imageName)
                .font(.system(size: 56))
            Text(Constants.noConnectionMessage)
                .font(.title2)
            Text(Constants.secondaryMessage)
                .font(.body)
                .foregroundColor(.gray)
        }
    }
}

struct NoConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        NoConnectionView()
    }
}
