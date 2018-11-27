#define LM35 (A0)
#define LDR (A1)
#define SAMPLE (30)

int temperature[SAMPLE];
int light[SAMPLE];

void setup() {
    int i;

    pinMode(LM35, INPUT);
    pinMode(LDR, INPUT);
    Serial.begin(9600);

    for (i = 0; i < SAMPLE; i++) {
        temperature[i] = 0;
        light[i] = 0;
    }
}

void read(int* data, int sensor) {
    int i;
    for (i = 0; i < SAMPLE-1; i++) {
        data[i+1] = data[i];
    }
    data[0] = analogRead(sensor);
}

float average(int* data) {
    int i;
    float avg = 0;
    for (i = 0; i < SAMPLE; i++) {
        avg = i*avg/(i+1) + data[i]/(i+1);
    }
    return avg;
}

void loop() {
    read(temperature, LM35);
    read(light, LDR);
}

void serialEvent() {
    int i;
    String line = Serial.readString();
    float value = 0;

    for (i = 0; i < line.length(); i++) {
        if (line[i] == 't' || line[i] == 'T') {
            value = average(temperature)*500.0/1024.0;
            Serial.println(value);
        } else if (line[i] == 'l' || line[i] == 'L') {
            value = average(light)*5000.0/1024.0;
            Serial.println(value);
        }
    }
}
