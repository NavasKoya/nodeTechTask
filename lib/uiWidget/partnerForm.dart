import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:restaurant_form/databaseServices/databseReferences.dart';

class PartnerForm extends StatefulWidget {
  @override
  _PartnerFormState createState() => _PartnerFormState();
}

class _PartnerFormState extends State<PartnerForm> {

  final _registerFormKey=GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _emailIDController = TextEditingController();
  TextEditingController _foodCodeController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _hintTextStyle = GoogleFonts.ubuntu(
    color: Colors.grey[500],
  );

  final _labelTextStyle = GoogleFonts.ubuntu(
    color: Colors.grey[600],
    fontWeight: FontWeight.bold,
  );

  final _boxDecorationStyle = BoxDecoration(
    color: Color(0xFF757979),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _scaffoldBody(),
    );
  }

  _scaffoldBody() {
    Size _pageSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: _pageSize.height*.3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF677BE8),
                Color(0xFF9874D2),
                Color(0xFFD178C4),
              ]
            )
          ),
        ),

        Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: _pageSize.height*.025),
                    child: Text('Node Techs', style: GoogleFonts.ubuntu(color: Colors.white, fontWeight: FontWeight.bold, fontSize: _pageSize.width*.075),),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric( horizontal: _pageSize.width*.075),
                    child: Card(
                      elevation: 9,
                      child: Container(
                        color: Colors.white,
                        height: _pageSize.height*.7,
                        child: Form(
                          key: _registerFormKey,
                          child: ListView(
                            children: [
                              SizedBox(height: _pageSize.height*.015),

                              Card(
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  controller: _nameController,
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.black87,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    fillColor: Colors.white70,
                                    filled: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    prefixIcon: Icon(
                                      Ionicons.md_restaurant,
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Restaurant Name',
                                    hintStyle: _hintTextStyle,
                                  ),
                                  onSaved: (input) => _nameController.text=input,
                                  validator: (input) => input.trim().length<1 ? "Please provide valid name" : null,
                                ),
                              ),

                              SizedBox(height: _pageSize.height*.015),

                              Card(
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: _numberController,
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.black87,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    fillColor: Colors.white70,
                                    filled: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    prefixIcon: Icon(
                                      FontAwesome.phone,
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Phone Number',
                                    hintStyle: _hintTextStyle,
                                  ),
                                  onSaved: (input) => _numberController.text=input,
                                  validator: (input) => input.trim().length<1 ? "Please provide valid number" : null,
                                ),
                              ),

                              SizedBox(height: _pageSize.height*.015),

                              Card(
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailIDController,
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.black87,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    fillColor: Colors.white70,
                                    filled: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    prefixIcon: Icon(
                                      MaterialIcons.email,
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Email ID',
                                    hintStyle: _hintTextStyle,
                                  ),
                                  onSaved: (input) => _emailIDController.text=input,
                                  validator: (input) => input.trim().length<1 ? "Please provide valid email ID" : null,
                                ),
                              ),

                              SizedBox(height: _pageSize.height*.015),

                              Card(
                                child: TextFormField(
                                  controller: _foodCodeController,
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.black87,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    fillColor: Colors.white70,
                                    filled: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    prefixIcon: Icon(
                                      FontAwesome.barcode,
                                      color: Colors.grey,
                                    ),
                                    hintText: 'FSSAI Code',
                                    hintStyle: _hintTextStyle,
                                  ),
                                  onSaved: (input) => _foodCodeController.text=input,
                                  validator: (input) => input.trim().length<1 ? "Please provide valid FSSAI code" : null,
                                ),
                              ),

                              SizedBox(height: _pageSize.height*.015),

                              Card(
                                child: TextFormField(
                                  keyboardType: TextInputType.streetAddress,
                                  controller: _addressController,
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.black87,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    fillColor: Colors.white70,
                                    filled: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    prefixIcon: Icon(
                                      Entypo.address,
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Address',
                                    hintStyle: _hintTextStyle,
                                  ),
                                  onSaved: (input) => _addressController.text=input,
                                  validator: (input) => input.trim().length<1 ? "Please provide valid address" : null,
                                ),
                              ),

                              SizedBox(height: _pageSize.height*.015),

                              Card(
                                child: TextFormField(
                                  keyboardType: TextInputType.streetAddress,
                                  controller: _descriptionController,
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.black87,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    fillColor: Colors.white70,
                                    filled: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    prefixIcon: Icon(
                                      Entypo.info,
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Description',
                                    hintStyle: _hintTextStyle,
                                  ),
                                  onSaved: (input) => _descriptionController.text=input,
                                  validator: (input) => input.trim().length<1 ? "Please provide valid description" : null,
                                ),
                              ),

                              SizedBox(height: _pageSize.height*.015),

                              Center(
                                child: ElevatedButton(
                                  onPressed: _submitForm,
                                  child: Container(
                                    child: Text(
                                      'Submit',
                                      style: GoogleFonts.ubuntu(color: Colors.white, fontWeight: FontWeight.bold, fontSize: _pageSize.width*.05),
                                    ),
                                  )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Text('Login with Google'),
                  GestureDetector(
                    onTap: _signInWithGoogle,
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("assets/icons/google.svg")
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 10),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void _submitForm() {
    String errorMessage="";
    UserCredential emailAuthResult;

    if(_registerFormKey.currentState.validate()){
      _registerFormKey.currentState.save();

      FirebaseFirestore.instance.collection('Restaurant List').doc(_emailIDController.text+DateTime.now().toString()).set({
        "restName": _nameController.text,
        "restEmail": _emailIDController.text,
        "restPhoneNum": _numberController .text,
        "restCode": _foodCodeController.text,
        "restAddress": _addressController.text,
        "restDescription": _descriptionController.text,
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data saved Successfully'),
          duration: Duration(seconds: 5),
        )
    );

    _nameController.clear();
    _numberController.clear();
    _emailIDController.clear();
    _foodCodeController.clear();
    _addressController.clear();
    _descriptionController.clear();
  }

  _signInWithGoogle() async{
    _showLoadingIndicator();
    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    restaurantGoogleSignIn= _googleSignIn;
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    if(googleSignInAuthentication==null)
      Navigator.pop(context);

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    assert(!user.isAnonymous);

    assert(await user.getIdToken() != null);

    final User _currentUser = _auth.currentUser;
    assert(user.uid == _currentUser.uid);

    setState(() {
      _emailIDController.text = _currentUser.email;
    });

    Navigator.pop(context);
  }

  _showLoadingIndicator(){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height:50, width: 50,
                  child: new CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 25,),
                new Text("Loading",
                  style: GoogleFonts.ubuntu(fontSize: 18),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
