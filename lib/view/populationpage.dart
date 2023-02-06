import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controller/datacontroller.dart';
import 'package:practice/route/app_route.dart';



class PopulationPage extends StatelessWidget {
   PopulationPage({Key? key}) : super(key: key);

var get = Get.arguments;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        actions:  [
          InkWell(onTap: () {
            Get.toNamed(AppRoute.Validations);
          },
              child: Icon(Icons.logout_outlined))
        ],
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, ${get[0]['1']}'),
            Text('Your Password Is ${get[0]['2']} '),
          ],
        ),
      ),
      body: SafeArea(
        child: GetBuilder<DataController>(
            init: DataController(),
            builder: (controller) => Obx(
                  () => controller.isLoading.value == false
                      ? ListView.builder(
                          itemCount: controller.movielist.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Text(
                                        'Last Upadate Date : ${controller.movielist[index].updatedAt}'),
                                    Text(
                                        'ID : ${controller.movielist[index].id}'),
                                    Text(
                                        'Country : ${controller.movielist[index].country}'),
                                    Text(
                                        'Name : ${controller.movielist[index].name}'),
                                    Text(
                                        'Postal Code : ${controller.movielist[index].postalCode}'),
                                    Text(
                                        'City : ${controller.movielist[index].city}'),
                                  ],
                                ),
                              ),
                            );
                          })
                      : const Center(
                          child: CircularProgressIndicator(
                          color: Colors.blue,
                        )),
                )),
      ),
    );
  }
}

class Validations extends StatefulWidget {
 Validations({Key? key,}) : super(key: key);


  @override
  _ValidationsState createState() => _ValidationsState();
}

class _ValidationsState extends State<Validations> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final pwdController = TextEditingController();
  bool _validate = false;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(

        appBar: AppBar(
          title: Text('Log In'),
          centerTitle: true,

        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 150,
                  width: 200,
                  child: Image.network('https://www.freepnglogos.com/uploads/eagle-png-logo/lakes-eagles-png-logo-14.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: ' name...',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pwdController,
                  decoration: InputDecoration(hintText: ' password...'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                    }
                    if (value.length < 6) {
                      return "Password must be atleast 6 characters long";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    Get.toNamed(AppRoute.PopulationPage,arguments: [
                      {"1":nameController.text,
                      "2":pwdController.text,
                      },
                    ]
                        );


                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
