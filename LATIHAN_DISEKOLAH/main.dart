//conditon

void main () {
  int nilai =74;
  if (nilai >= 80 && nilai <=100){
    print("A");
  }
  else if(nilai >= 70 && nilai <=84){
    print("B");
  }

  else if(nilai >= 60 && nilai <=69){
    print("C");
  }

  else if(nilai >= 50 && nilai <=59){
    print("D");
  }

  else if(nilai < 50 && nilai >=0){
    print("D");
  }
  else {
    print("nilai tidak valid");
  }
  
}