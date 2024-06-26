import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigInService {
  
  static const List<String> scopes = <String>[
  'email',
];

static final GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

static Future <GoogleSignInAccount?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    final googleKey = await account?.authentication;
    
    print('******* ID TOKEN *******');
    print(account);
    print( googleKey?.idToken );
    // TODO:  Llamar un servicio REST a nuestro backend
    // con el ID Token
    print('ID TOKEN');
    String? token = googleKey?.idToken;
    if (token != null) {
        while (token!.length > 0) {
          int initLength = (token!.length >= 500 ? 500 : token.length);
          print(token.substring(0, initLength));
          int endLength = token.length;
          token = token.substring(initLength, endLength);
        }
      } else {
        print('No se pudo obtener el token.');
      }

    return account;
  } catch (e) {
    print(e);
    return null; 
  }
}

static Future signOut() async {
  await _googleSignIn.signOut();
}
}