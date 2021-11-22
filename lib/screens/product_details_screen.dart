import 'package:flutter/material.dart';
import 'package:kanzangshop/components/components.dart';
import 'package:kanzangshop/services/networking.dart';
import 'package:kanzangshop/services/services.dart';

class ProductDetails extends StatefulWidget {
  late final Productmodel product;
  late final String sessionid;

  ProductDetails({required this.product, required this.sessionid});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String productName = '';
  String productDescription = '';
  String productSummary = '';
  String productLogo = '';
  //List<Widget> Productgallary = [];

  getProductDetails() async {
    NetworkHelper networkHelper = new NetworkHelper();
    var productDetails =
        networkHelper.getProductDetails(widget.sessionid, widget.product.id);
    return productDetails;
  }

  void updateValues() async {
    var productDetail = await getProductDetails();
    // var ListProductgallary = productDetail['gallery'];
    //ListProductgallary.map((product) => getProductImage(context, product));

    setState(() {
      productName = productDetail['name'];
      productLogo = productDetail['logo'];
      productSummary = productDetail['summary'];
      productDescription = productDetail['description'];

      //Productgallary = ListProductgallary;
    });
  }

  // @override
  // Future<Widget> getProductImage(BuildContext context, dynamic product) async {
  //   return Container(
  //       height: 200, width: 200, child: await (Image.network(product)));
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    productLogo,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              productName,
              style: kTitleStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              productSummary,
              style: kSummaryStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Product Description:",
              style: kTitleStyle,
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              productDescription,
              style: kSummaryStyle,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Product Gallery:',
              style: kTitleStyle,
            )
          ],
        ),
      ),
    );
  }
}

//Expanded(
//   child: ListView.builder(
//       itemCount: Productgallary.length,
//       itemBuilder: (context, index) {
//         return Container(
//             height: 20, width: 20, child: this.Productgallary[index]);
//       }),
// )
