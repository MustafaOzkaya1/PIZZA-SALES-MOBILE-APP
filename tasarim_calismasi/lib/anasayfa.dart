import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasarim_calismasi/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}
//left-start - leading
// right - end -trailing
class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    //çoklu ekran desteği
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi =ekranBilgisi.size.width;
    print("Ekran Yükseklği : $ekranYuksekligi");
    print("Ekran Genişliği : $ekranGenisligi");

    var d = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Delicious Pizza",style: TextStyle(color: yaziRenk1,fontFamily: "Madimi",fontSize: 22),),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top:ekranGenisligi/14),
            child: Text(d!.pizzaBaslik,style: TextStyle(fontSize: ekranGenisligi/12,color:anaRenk,fontFamily: "Madimi",fontWeight:FontWeight.bold),),
          ),
          Padding(
            padding:  EdgeInsets.only(top:ekranGenisligi/16),
            child: Image.asset("images/pizza.png",width: ekranGenisligi/2.5,height: ekranGenisligi/2.5,),
          ),
          Padding(
            padding:  EdgeInsets.only(top: ekranGenisligi/35),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children:[
                //tüm kelimeler için dil desteği sağlandı
                chip(icerik: d.peynirYazi),
                chip(icerik: d.sucukYazi),
                chip(icerik: d.zeytinYazi),
                chip(icerik: d.biberYazi),
              ],
            ),
          ),
         Padding(
           padding:  EdgeInsets.all(ekranGenisligi/16),
           child: Column(
             children: [
               Padding(
                 padding:  EdgeInsets.only(top:ekranGenisligi/10),
                 child: Text(d.teslimatSure,style: TextStyle(fontSize:ekranGenisligi/15,color:anaRenk,fontFamily: "Madimi",fontWeight:FontWeight.bold),),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 10),
                 child: Text(d.teslimatBaslik,style: TextStyle(fontSize: ekranGenisligi/15,color:anaRenk,fontFamily: "Madimi",fontWeight:FontWeight.bold),),
               ),
               Padding(
                 padding:  EdgeInsets.only(top:ekranGenisligi/40),
                 child: Text(
                   d.pizzaAciklama,
                   style: TextStyle(fontSize: ekranGenisligi/15, color: yaziRenk2, fontFamily: "Madimi",), textAlign: TextAlign.center,
                 ),
               ),
             ],
           ),
         ),
          Padding(
            padding:  EdgeInsets.only(top:ekranGenisligi/4,left: ekranGenisligi/35,right: ekranGenisligi/35),
            child: Row(
              children: [
                Text(d.fiyat,style: TextStyle(fontSize: ekranGenisligi/10,color:anaRenk,fontFamily: "Oswald",fontWeight:FontWeight.bold),),
                const Spacer(),
                SizedBox(width: ekranGenisligi/2,height: ekranGenisligi/7,
                  child: TextButton(onPressed: (){}, child: Text(d.buttonYazi, style: TextStyle(color: yaziRenk1,fontFamily: "Oswald",fontSize: 20),),
                    style: TextButton.styleFrom(
                        backgroundColor: anaRenk,
                      shape: const RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//Özelleştirilmiş widget kullanımı
class chip extends StatelessWidget {
  String icerik;


  chip({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){}, child: Text(icerik, style: TextStyle(color: yaziRenk1,fontFamily: "Oswald",fontSize: 20),),
      style: TextButton.styleFrom(backgroundColor: anaRenk),
    );
  }
}

