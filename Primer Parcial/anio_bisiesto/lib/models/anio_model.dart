class AnioModel {

  final int anio;

  AnioModel(this.anio);

  // aqui va la logica para anio bisiesto

  bool esBisiesto(){
    if(anio%4==0 && (anio%100!=0 || anio%400==0)){
      return true;
    }else{
      return false;
    }
  }


}