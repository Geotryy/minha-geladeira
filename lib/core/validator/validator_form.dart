
import 'package:flutter/material.dart';

FormFieldValidator<String> requiredField(String message) {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  };
}

FormFieldValidator<String> integerField(String message){
  return (value) {
 if (value == null || value.trim().isEmpty) {
      return message;
    }
else if (int.tryParse(value.trim()) == null){
  return 'Digite um número válido';
}
return null;
};
}