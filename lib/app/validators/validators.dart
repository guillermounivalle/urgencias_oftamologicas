

/**
 * Esto es una clase MIXIN
 *
 * Una clase MIXIN es una clase que extiende funcionalidades de
 * clases existentes
 * */

abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator{
  @override
  bool isValid(String value){
    return value.isNotEmpty;
  }
}

class EmptyFieldValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final StringValidator nameValidator = NonEmptyStringValidator();
  final StringValidator lastnameValidator = NonEmptyStringValidator();
  final StringValidator documentIdValidator = NonEmptyStringValidator();
  final StringValidator speciality = NonEmptyStringValidator();
  final String invalidEmailErrorText = '"Email" no puede ser un campo vacio';
  final String invalidPasswordErrorText = '"Contraseña" no puede ser un campo vacio';
  final String invalidNameErrortext = 'El campo "Nombre" no puede ser vacio';
  final String invalidLastNameErrorText = 'El campo "Apellido" no puede ser vacio';
  final String invalidDocumentIdErrorText = 'El campo "Documento" identidad no puede ser vacio';
  final String invalidEspecilityErrorText = 'El campo Especialidad no puede ser vacio';
}