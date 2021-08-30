//
//  AuthenticationViewModel.swift
//  messenger
//
//  Created by Michał Jażdżyk on 28/08/2021.
//

import Firebase
import GoogleSignIn
import FBSDKLoginKit

class AuthViewModel: NSObject, ObservableObject {
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    var manager = LoginManager()
    @Published var state: SignInState = .signedOut
    @Published var email: String = ""
    @Published var displayName: String = ""
    @Published var photoUrl: String = ""
    
    override init() {
        super.init()
        setupGoogleSignIn()
    }
    
    func continueWithGoogle() {
        if GIDSignIn.sharedInstance().currentUser == nil {
            GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
            GIDSignIn.sharedInstance().signIn()
        }
    }
    
    func continueWithFacebook() {
        manager.logIn(permissions:["public_profile","email"],from:nil) { [self] (result,err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            if !result!.isCancelled {
                let credential = FacebookAuthProvider
                  .credential(withAccessToken: AccessToken.current!.tokenString)
                Auth.auth().signIn(with:credential) { authResult, error in
                    state = .signedIn
                }
                print(email,displayName,photoUrl)
            }
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance().signOut()
        manager.logOut()
        do {
            try Auth.auth().signOut()
            state = .signedOut
        } catch let signOutError as NSError {
            print(signOutError.localizedDescription)
        }
    }
    
    private func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = self
    }
}

extension AuthViewModel: GIDSignInDelegate {

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            firebaseAuthentication(withUser: user)
        } else {
            print(error.debugDescription)
        }
    }
    
    private func firebaseAuthentication(withUser user: GIDGoogleUser) {
        if let authentication = user.authentication {
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { (_, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self.state = .signedIn
                }
            }
        }
    }
}
