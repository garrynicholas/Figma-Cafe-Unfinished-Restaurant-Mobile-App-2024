import 'package:flutter/material.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, bool errorText) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        errorText: errorText ? 'Please fill your email' : null,
        /* filled: true: Properti ini menentukan apakah widget tersebut (mungkin sebuah TextField) 
        akan diisi (filled) atau tidak. Ketika filled diatur menjadi true, widget tersebut akan 
        memiliki latar belakang yang terisi dengan warna atau pola tertentu. Jika diatur menjadi 
        false atau tidak diatur, latar belakang mungkin akan transparan atau mengikuti gaya tampilan default */
        filled: true,
        /* Saat FloatingLabelBehavior diatur menjadi never, label terapung tidak akan muncul saat 
        pengguna memulai memasukkan teks ke dalam TextField */
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

TextField reusableTextAreaField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, bool errorText) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    maxLines: 4, // Set the desired number of lines for the text area
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        errorText: errorText ? 'Please fill your email' : null,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.multiline, // Use TextInputType.multiline for text area
  );
}

Container masukButton(BuildContext context, bool isMasuk, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        //isMasuk dibawah untuk mendapatkan mau itu button masuk atau button buat akun
        isMasuk ? 'MASUK' : 'BUAT AKUN',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      //ButtonStyle dibawah untuk pergantian warna ketika button diklik
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.black26;
        }
        return Colors.white;
      })),
    ),
  );
}

Container nextButton(BuildContext context, bool isMasuk, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        'SELANJUTNYA',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      //ButtonStyle dibawah untuk pergantian warna ketika button diklik
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.black26;
        }
        return Colors.white;
      })),
    ),
  );
}

Container masukRuleButton(BuildContext context, bool isMasuk, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        //isMasuk dibawah untuk mendapatkan mau itu button masuk atau button buat akun
        isMasuk ? 'MASUK SEBAGAI KASIR' : 'MASUK SEBAGAI ADMIN',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      // ButtonStyle dibawah untuk pergantian warna ketika button diklik
      // backgroundColor didefinisikan menggunakan MaterialStateProperty.resolveWith
      // yang memberikan warna latar belakang tombol berdasarkan kondisi atau state tombol.
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.black26;
        }
        return Colors.white;
      })),
    ),
  );
}
