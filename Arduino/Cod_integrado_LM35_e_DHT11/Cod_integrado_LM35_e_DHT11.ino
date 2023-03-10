// Sensor de temperatura e umidade 
  #include "DHT.h"
  #define dht_type DHT11 //define qual o tipo de sensor DHTxx que está sendo utilizado
  int dht_pin= A0; 
  DHT dht_1 = DHT (dht_pin, dht_type); // pode-se configurar diversos sensores DHTxx

//Sensor de temperatura usando o LM35
  const int LM35 = A2; // Define o pino que lera a saída do LM35
  float temperatura; // Variável que armazenará a temperatura medida
 
//Função que será executada uma vez quando ligar ou resetar o Arduino
void setup() {
  Serial.begin(9600);
  dht_1.begin();// inicializa a comunicação serial
}
 
//Função que será executada continuamente
void loop() {

temperatura = (float(analogRead(LM35))*5/(1023))/0.01;
float umidade = dht_1.readHumidity();

    if (isnan(temperatura) or isnan(umidade))
    {
      Serial.println("Erro ao ler o DHT");
    }
    else
    {
      // Serial.print ("Umidade: ");
      Serial.print (umidade);
     //  Serial.print(" %");
     //  Serial.print (" Temperatura: ");
      Serial.print(temperatura);
     //  Serial.println(" C");
    }
delay(2000);
}
