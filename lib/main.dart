import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // dropdown yani combobox, oluşturmak için listeye ihtiyacımız var sonra içerisindeki her (satırı) item ı tasarlıyoruz
  // ve seçildikten sonra işlemleri tamamlıyoruz
  var ulkelerListe = <String>[];
  String secilenUlke = "Türkiye"; // varsayılan değerimiz, aynı zamanda dropdownbutton a ekleyeceğiz ve ilk görünen ülke burası olacak

  @override
  void initState() {
    // liste içeriğini oluşturacağız, böylelikle sayfa açıldığı zaman içerik oluşmuş olarak gelecek, genellikle veritabanından
    // çekeriz öyle gibi göstereceğiz, initState ilk açıldığında çalışan metodumuzdur
    super.initState();
    ulkelerListe.add("Türkiye");
    ulkelerListe.add("İtalya");
    ulkelerListe.add("Almanya");
    ulkelerListe.add("Rusya");
    ulkelerListe.add("Çin");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>( // hangi türde verileri göstereceğini belirtmemiz gerekiyor bu yüzden <> içerisine mutlaka yazıyoruz
                value: secilenUlke, // ilk açıldığında içerisindeki değeri göreceğiz ayrıca seçim yaptıktan sonra hangisini en son seçildi
                // takibini de sayesinde kullanıp arayüzde değişiklik yapabileceğiz
                items: ulkelerListe.map<DropdownMenuItem<String>>((String veriler){
                  return DropdownMenuItem<String>(
                    value: veriler, // buradaki :veriler değişkeni items içerisindeki veriler ve listedeki verileri tek tek getirecek
                    child: Text("Ülke : $veriler", style: TextStyle(color: Colors.deepPurple, fontSize: 20),),
                  );
                }).toList(), // listedeki verileri görüntüleme işlemi burada
              // <String> yine liste veri türü ile ilgili ve buradaki veriler değişkeni sayesinde liste içerisindeki bilgileri teker teker alacacğız
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (String? secilenVeri){
                  // sayesibde dropdown menü üzerinde seçilen itemı burada yakalayacağız ve içeriği alacağız
                  setState(() {
                    secilenUlke = secilenVeri!; // seçim olur fakat seçilen ülkeyi değiştirmek istesekte değiştiremeyiz
                  });
                },
            ),
            Text("Seçilen Ülke: $secilenUlke"),
            ElevatedButton(
                onPressed: (){
                  print("En son seçilen ülke : $secilenUlke");
                },
                child: Text("Göster"),
            ),
          ],
        ),
      ),
    );
  }
}
