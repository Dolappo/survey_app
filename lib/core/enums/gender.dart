enum Gender{
  male,
  female,
}

String getGenderCapitalized(Gender gender){
  String gen = gender.name.toString();
  String genderCapitalized = gen.replaceRange(0, 1, gen.substring(0,1).toUpperCase());
  return genderCapitalized;
}