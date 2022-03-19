library constants;

class BottomNav {
  static const String title = "PetFit";
  static const String trackservichome = "Citizen Service";
  static const String paynow = "Pay Now";
  static const String trackservic = "Track Services";
  static const String paynoe = "Pay Now";
  static const String help = "Help";
  static const String markattend = "Mark my Attendance";
}

class HOME {
  static String username = "admin";
  static String password = "admin@123";
  static String title = "Welcome to PetFit";
  static String loginMessage = "Sign In As:";
  static String loginPetA = "Fix Appointmnet ";
  static String appointhistorty = "AppointmentHostory";
  static String loginPet = " Login ";
  static String detailspage = "Detail Pages";
  static String feedbackhint = "Welcome New User";
  static String feedbackhints =
      "we would like your feedback to improve our app";
  static String feedbacklite = "How do you feel about the features of the app";
  static String feedbackints = "Please select any feedback category";
  static String send = "Send";
  static String addPetImage = "Add Pet'sPhoto/Video";
  static String addPet = "AddPet";
}

class NavigationDrawerhint {
  static String faq = "FAQ";
  static String userprofile = "UserProfile";
  static String addPet = "AddPet";
  static String help = "Help";
  static String logOut = "LogOut";
  static String citizen = "Citizen Service";
  static String smogandpollution = "Smog and pollution Complaint";
  static String feedback = "Feedback and Rating";
  static String aboutUs = "About Us";
}

class Trackservice {
  static String mobileNo = "ok";
  static String trackid = "Tracking ID";
  static String tracknumber = "Tracking Number";
  static String track = "Track";
  static String feedback = "Give FeedBack";
  static String trackservice = "Thank you!!!";
  static String alert = "Alert";
  static String cancel = "Cancel";
  static String trackalertmess = "Enter Tracking Id";
  static String trackhint =
      "we thankyou for your feedback we wil get back to you soon";
}

class LoginString {
  static String petName = "PetName:";
  static String petDob = "petAge:";
  static String PetLocation = "Pet Location:";
  static String petBreed = "Pet Breed";
  static String ownerContact = "PedID:";
  static String ownerDetails = "Owner Details:";
  static String album = "Album";
  static String schedule = "Schedule";
  static String create = "Create";
  static String view = "View";
  static String call = "Call";
  static String delete = "Delete";

  static String contantdetails = "Contant Details";
  static String emailAddress = "New User";
  static String password = "Password";
  static String emailId = "emailid";
  static String emailerrormsg = "This feild  cannot be  left blank";
  static String contantus = "Contant Us :";
  static String faxNo = "Fax No :";
  static String address = " Address :";
  static String info = "Info :";
  static String passerrormsg = "Please enter your password";
  static String passlength = "Your password should be more then 9 char long";
  static String termsconditions = "Terms and Conditions";
  static String termshint = " \u00a9 Pet-fit . All rights reserved.";
  static String heaterstatus = "Heaterstatus";
  static String success = "Success";
  static String valueTrue = "Success";
  static String huggigheater = " Pet- Fit";
  static String hintheater =
      "Please turn ON and OFF \n The Heater to know the  status";
}

String? validateName(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(patttern);
  if (value.isEmpty) {
    return "Name is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Name must be a-z and A-Z";
  }
  return null;
}

String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(patttern);
  if (value.isEmpty) {
    return "MobileNumber is Required";
  } else if (value.length != 10) {
    return "Mobile number must 10 digits";
  } else if (!regExp.hasMatch(value)) {
    return "Mobile Number must be digits";
  }
  return null;
}

String? validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return "Email is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Invalid Email";
  } else {
    return null;
  }
}

String? validateDesc(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(patttern);
  if (value.isEmpty) {
    return "Desc is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Desc must be a-z and A-Z";
  } else if (value.length < 50) {
    return "Desc must be 50 line min";
  }
  return null;
}

String? validateLocation(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(patttern);
  if (value.isEmpty) {
    return "Location is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Desc must be a-z and A-Z";
  } else if (value.length < 50) {
    return "Desc must be 50 line min";
  }
  return null;
}

class NetworkconnectionTime {
  static const int connectionTimeOut = 3;
}
