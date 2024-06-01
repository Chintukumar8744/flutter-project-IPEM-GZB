
class SignUpWithEmailAndPasswordFailure{
  final String message;
  const SignUpWithEmailAndPasswordFailure([this.message="An Unknown error occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure('Please  enter a stronger  password.');
        case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Email is not  valid  or  bably  forematted');
        case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('An Account already exist  for  that email.');
      case 'operation-not-allowed':
      case '':return SignUpWithEmailAndPasswordFailure("Opeartion  is not  allowed. please  contect  support.");
      case 'user-disabled':
      case '':return SignUpWithEmailAndPasswordFailure("This user has been disabled . please contect support  for help.");

      default:return SignUpWithEmailAndPasswordFailure();
    }
  }
}