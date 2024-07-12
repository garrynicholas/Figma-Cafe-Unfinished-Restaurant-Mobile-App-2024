import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:figmacafe/order_provider/model_catatan.dart';
import 'package:figmacafe/order_provider/model_reservasi.dart';
import 'package:figmacafe/presentation/pesanan/pesanan_sukses.dart';
import 'package:figmacafe/presentation/rekening/seabank.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:figmacafe/user/user_provider.dart';
import 'package:figmacafe/presentation/pesanan/pesanan_item.dart';
import 'package:figmacafe/presentation/pesanan/pesanan_provider.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // TextEditingController _addressController = TextEditingController();
  // TextEditingController _restaurantLocationController = TextEditingController();
  // TextEditingController _tableNumberController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  List<String> restaurantLocations = [
    'Pasuruan: Figma Cafe Nanas Raya',
    'Pasuruan: Figma Cafe Pahlawan',
    'Surabaya: Figma Cafe 1',
    'Surabaya: Figma Cafe 2',
    'Jakarta: Figma Cafe 1',
    'Jakarta: Figma Cafe 2',
    // Add more locations as needed
  ];

  bool isReservationEnabled = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    ReservationModel reservationModel = Provider.of<ReservationModel>(context);
    final modelCatatan = Provider.of<ModelCatatan>(context);
    String? reservasiNumber = '5';

    final currencyFormat = NumberFormat.compactCurrency(
      locale: 'id_ID',
      symbol: '',
      decimalDigits: 0,
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Text(
              "My Cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
                color: Color(0xFF0700FF),
              ),
            ),
            // Reservation Container
            SizedBox(
              height: 24.0,
            ),

            Expanded(
              child: cartProvider.cartItems.isEmpty
                  ? Center(
                      child: Text(
                        'Tidak ada pesanan.',
                        style: TextStyle(color: Colors.black87),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cartProvider.cartItems.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CartItemWidget(
                              cartItem: cartProvider.cartItems[index],
                              currencyFormat: currencyFormat,
                              imageAssets:
                                  cartProvider.cartItems[index].imageAssets,
                              specialRequest: Provider.of<ModelCatatan>(context)
                                  .getSpecialRequest(
                                      cartProvider.cartItems[index].title),
                            ),
                          ],
                        );
                      },
                    ),
            ),
            PaymentSummary(
              currencyFormat: currencyFormat,
              cartProvider: cartProvider,
              reservasiNumber: reservasiNumber,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            onPressed: cartProvider.cartItems.isEmpty
                ? null
                : () {
                    // cartProvider.clearCart();
                    _showBottomSheet(context);
                  },
            child: Text(
              'PESAN',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF0700FF),
            ),
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  String? reservasiNumber;
  final currencyFormat = NumberFormat.compactCurrency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: 0,
  );

  final cartProvider = Provider.of<CartProvider>(context, listen: false);

  bool isButton1Filled = false;
  bool isButton2Filled = false;
  bool isButton3Filled = false;
  bool isButton4Filled = false;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Set to true for a draggable full-height sheet
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          void updateButtonStates(
              bool button1, bool button2, bool button3, bool button4) {
            setState(() {
              isButton1Filled = button1;
              isButton2Filled = button2;
              isButton3Filled = button3;
              isButton4Filled = button4;
            });
          }

          return Container(
            height: MediaQuery.of(context).size.height *
                0.85, // Adjust the height factor as needed (80% of the screen height)
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(
                    255, 247, 247, 247), // Set the background color
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Rounded horizontal line at the very top
                  Center(
                    child: Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: Text(
                      'Konfirmasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Pilih Metode Pembayaran',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      updateButtonStates(true, false, false, false);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isButton1Filled ? 'SeaBank' : 'SeaBank',
                            style: TextStyle(
                              color:
                                  isButton1Filled ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          Visibility(
                            visible: isButton1Filled,
                            child: Image.asset(
                              'assets/images/succ5.png',
                              height: 40.0,
                              width: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary:
                          isButton1Filled ? Color(0xFF0700FF) : Colors.white,
                      backgroundColor:
                          isButton1Filled ? Color(0xFF0700FF) : Colors.white,
                      side: BorderSide(
                        color:
                            isButton1Filled ? Color(0xFF0700FF) : Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius
                      ),
                      minimumSize: Size(
                          double.infinity, 50.0), // Adjust the button height
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      updateButtonStates(false, true, false, false);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isButton2Filled ? 'OVO' : 'OVO',
                            style: TextStyle(
                              color:
                                  isButton2Filled ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          Visibility(
                            visible: isButton2Filled,
                            child: Image.asset(
                              'assets/images/succ5.png',
                              height: 40.0,
                              width: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary:
                          isButton2Filled ? Color(0xFF0700FF) : Colors.white,
                      backgroundColor:
                          isButton2Filled ? Color(0xFF0700FF) : Colors.white,
                      side: BorderSide(
                        color:
                            isButton2Filled ? Color(0xFF0700FF) : Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius
                      ),
                      minimumSize: Size(
                          double.infinity, 50.0), // Adjust the button height
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      updateButtonStates(false, false, true, false);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isButton3Filled ? 'Dana' : 'Dana',
                            style: TextStyle(
                              color:
                                  isButton3Filled ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          Visibility(
                            visible: isButton3Filled,
                            child: Image.asset(
                              'assets/images/succ5.png',
                              height: 40.0,
                              width: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary:
                          isButton3Filled ? Color(0xFF0700FF) : Colors.white,
                      backgroundColor:
                          isButton3Filled ? Color(0xFF0700FF) : Colors.white,
                      side: BorderSide(
                        color:
                            isButton3Filled ? Color(0xFF0700FF) : Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius
                      ),
                      minimumSize: Size(
                          double.infinity, 50.0), // Adjust the button height
                    ),
                  ),
                  SizedBox(height: 8.0),
                  OutlinedButton(
                    onPressed: () {
                      updateButtonStates(false, false, false, true);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isButton4Filled
                                ? 'Bayar di Tempat'
                                : 'Bayar di Tempat',
                            style: TextStyle(
                              color:
                                  isButton4Filled ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          Visibility(
                            visible: isButton4Filled,
                            child: Image.asset(
                              'assets/images/succ5.png',
                              height: 40.0,
                              width: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary:
                          isButton4Filled ? Color(0xFF0700FF) : Colors.white,
                      backgroundColor:
                          isButton4Filled ? Color(0xFF0700FF) : Colors.white,
                      side: BorderSide(
                        color:
                            isButton4Filled ? Color(0xFF0700FF) : Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius
                      ),
                      minimumSize: Size(
                          double.infinity, 50.0), // Adjust the button height
                    ),
                  ),
                  SizedBox(height: 24.0),
                  PaymentSummary(
                    currencyFormat: currencyFormat,
                    cartProvider: cartProvider,
                    reservasiNumber: reservasiNumber,
                  ),
                  SizedBox(height: 40.0),
                  ElevatedButton(
                    onPressed: () {
                      bool isAnyButtonFilled = isButton1Filled ||
                          isButton2Filled ||
                          isButton3Filled ||
                          isButton4Filled;

                      if (isAnyButtonFilled) {
                        cartProvider.clearCart();
                        if (isButton4Filled) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PesananSukses(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RekeningRestoran(),
                            ),
                          );
                        }
                      } else {
                        // Show pop-up dialog to inform the user to choose a payment method
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor:
                                  Colors.white, // Set background color to white
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    16.0), // Adjust the border radius
                              ),
                              title: Text(
                                'Peringatan',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                              content: Container(
                                height: 50.0,
                                child: Column(
                                  children: [
                                    Text(
                                      'Pilih metode pembayaran terlebih dahulu',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                Container(
                                  width: double
                                      .infinity, // Make the container full width
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(
                                          0xFF0700FF), // Set button background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Adjust the border radius
                                      ),
                                    ),
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'PESAN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0700FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius
                      ),
                      minimumSize: Size(
                          double.infinity, 50.0), // Adjust the button height
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class PaymentSummary extends StatelessWidget {
  final NumberFormat currencyFormat;
  final CartProvider cartProvider;
  final String? reservasiNumber;

  PaymentSummary({
    Key? key,
    required this.currencyFormat,
    required this.cartProvider,
    this.reservasiNumber,
  }) : super(key: key) {
    print('PaymentSummary constructor - reservasiNumber: $reservasiNumber');
  }

  @override
  Widget build(BuildContext context) {
    print('PaymentSummary build - reservasiNumber: $reservasiNumber');

    double totalHarga = cartProvider.getTotalPrice();
    double ongkir = 5.0; // Set Ongkir

    double totalPembayaran = totalHarga + ongkir;

    print('PaymentSummary build - ongkir: $ongkir');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        borderRadius: BorderRadius.circular(8.0), // Set the border radius
      ),
      padding: EdgeInsets.all(16.0), // Set the padding as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ringkasan Pembayaran',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Harga'),
              Text('${currencyFormat.format(totalHarga)}K'),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ongkir'),
              Text('${currencyFormat.format(ongkir)}K'),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Pembayaran',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '${currencyFormat.format(totalPembayaran)}K',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final NumberFormat currencyFormat;
  final String imageAssets;
  String specialRequest;

  CartItemWidget({
    Key? key,
    required this.cartItem,
    required this.currencyFormat,
    required this.imageAssets,
    required this.specialRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelCatatan = Provider.of<ModelCatatan>(context);

    return Card(
      elevation: 0.0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    imageAssets,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cartItem.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                            child: Text(
                              '${currencyFormat.format(cartItem.price)}K',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.0), // Adjusted spacing
                      Text(
                        'Catatan: ${modelCatatan.getSpecialRequest(cartItem.title)}', // Displaying special request
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0), // Adjusted spacing
            Row(
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: IconButton(
                    iconSize: 12.0,
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .decrementQuantity(cartItem.title);
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '${cartItem.quantity}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: IconButton(
                    iconSize: 12.0,
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .incrementQuantity(cartItem.title);
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        _showSpecialRequestPopup(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_calendar_outlined,
                            color: Colors.black,
                          ), // Add the desired icon inside the button
                          SizedBox(
                              width:
                                  4.0), // Adjust the spacing between icon and text
                          Text(
                            'Catatan',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black),
                        minimumSize: Size(30.0, 32.0), // Set the button size
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 8.0),
                Spacer(), // Add Spacer to push the remove button to the right
                // Remove Button
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    final cartProvider =
                        Provider.of<CartProvider>(context, listen: false);
                    final index = context
                        .read<CartProvider>()
                        .cartItems
                        .indexOf(cartItem);

                    if (index != -1) {
                      cartProvider
                          .removeFromCart(cartProvider.cartItems[index].title);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSpecialRequestPopup(BuildContext context) {
    // Get the initial value from ModelCatatan
    String initialSpecialRequest =
        Provider.of<ModelCatatan>(context, listen: false)
            .getSpecialRequest(cartItem.title);

    TextEditingController specialRequestController =
        TextEditingController(text: initialSpecialRequest);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final modelCatatan = Provider.of<ModelCatatan>(context);
        return Dialog(
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(
                  255, 245, 245, 245), // Set container background color
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Catatan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  controller: specialRequestController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan catatan...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          12.0), // Adjust the border radius
                    ),
                    fillColor: Colors.white, // Set input text background color
                    filled: true,
                  ),
                  maxLines: 5,
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Update special request using SpecialRequestModel
                          modelCatatan.updateSpecialRequest(
                              cartItem.title, specialRequestController.text);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0700FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust the border radius
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Batal',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust the border radius
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Clear the special request
                          specialRequestController.clear();
                        },
                        child: Text(
                          'Clear',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust the border radius
                          ),
                          minimumSize: Size(50.0, 40.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
